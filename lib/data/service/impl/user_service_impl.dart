import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_mobile/common/constant/firestore_collections.dart';
import 'package:ecommerce_app_mobile/common/constant/exception_handler.dart';
import 'package:ecommerce_app_mobile/common/constant/timeouts.dart';
import 'package:ecommerce_app_mobile/presentation/authentication/bloc/user_state.dart';
import 'package:ecommerce_app_mobile/sddklibrary/constant/exceptions/network_exceptions.dart';
import 'package:ecommerce_app_mobile/sddklibrary/constant/firebase_error_messages.dart';
import 'package:ecommerce_app_mobile/sddklibrary/helper/Helper.dart';
import 'package:ecommerce_app_mobile/sddklibrary/helper/Log.dart';
import 'package:ecommerce_app_mobile/sddklibrary/helper/error.dart';
import 'package:ecommerce_app_mobile/sddklibrary/helper/network_helper.dart';
import 'package:ecommerce_app_mobile/sddklibrary/helper/resource.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppText.dart';
import 'package:ecommerce_app_mobile/data/service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../model/user.dart';

class UserServiceImpl extends UserService {
  late final _firebaseAuth = firebase_auth.FirebaseAuth.instance;
  late final _fireStore = FirebaseFirestore.instance;

  @override
  Future<Resource<User>> addUser(UserRequestState userState) async {
    try {
      //check network connection
      final networkConnection = await NetworkHelper().isConnectedToNetwork();
      if (!networkConnection.isConnected) throw NetworkDeviceDisconnectedException("Network Device is down");

      //request user creation
      final authResponse = await _firebaseAuth
          .createUserWithEmailAndPassword(email: userState.email, password: userState.password)
          .timeout(Timeouts.postTimeout);
      final responseUser = authResponse.user;
      if (responseUser == null) throw firebase_auth.FirebaseAuthException(code: ExceptionHandler.nullUserId);

      //create user to fire store
      await _fireStore
          .collection(FireStoreCollections.users)
          .doc(responseUser.uid)
          .set(userState.toMap(responseUser.uid))
          .timeout(Timeouts.postTimeout);
      final User userFinal = User.fromUserState(userState, responseUser, authResponse);
      return Resource.success(userFinal);

      //catch exceptions
    } catch (exception) {
      return ExceptionHandler.firebaseResourceExceptionHandler(exception);
    }
  }

  @override
  Future<Resource<User>> sendVerificationEmail(User user) async {
    try {
      var networkConnection = await NetworkHelper().isConnectedToNetwork();
      if (!networkConnection.isConnected) throw NetworkDeviceDisconnectedException("Network Device is down");

      await user.firebaseUser.sendEmailVerification();

      return Resource.success(user);
    } catch (exception) {
      return ExceptionHandler.firebaseResourceExceptionHandler(exception);
    }
  }

  @override
  Future<Resource> changePassword(User user) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Resource<User>> changeUserSettings(User user) {
    // TODO: implement changeUserSettings
    throw UnimplementedError();
  }

  @override
  Future<Resource<User>> isEmailVerified() async {
    try {
      final networkConnection = await NetworkHelper().isConnectedToNetwork();
      if (!networkConnection.isConnected) throw NetworkDeviceDisconnectedException("Network Device is down");

      await _firebaseAuth.currentUser?.reload();

      final userResponse = await getUser();
      if (userResponse.status == Status.fail) {
        return Resource.fail(userResponse.error ?? DefaultError(userMessage: AppText.errorFetchingData));
      }
      User user = userResponse.data!;
      return Resource.success(user);
    } catch (exception) {
      return ExceptionHandler.firebaseResourceExceptionHandler(exception);
    }
  }

  @override
  Future<Resource<User>> signIn(UserRequestState userRequest) async {
    try {
      final networkConnection = await NetworkHelper().isConnectedToNetwork();
      if (!networkConnection.isConnected) throw NetworkDeviceDisconnectedException("Network Device is down");

      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: userRequest.email, password: userRequest.password);
      var userResponse = await getUser(userCredential: userCredential);
      if (userResponse.status == Status.fail) {
        return Resource.fail(userResponse.error ?? DefaultError(userMessage: AppText.errorFetchingData));
      }
      User user = userResponse.data!;

      return Resource.success(user);
    } catch (exception) {
      return ExceptionHandler.firebaseResourceExceptionHandler(exception);
    }
  }

  @override
  Future<Resource> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  bool isUserAuthenticated() {
    return _firebaseAuth.currentUser != null;
  }

  @override
  Future<Resource<User>> getUser({firebase_auth.UserCredential? userCredential}) async {
    try {
      final networkConnection = await NetworkHelper().isConnectedToNetwork();
      if (!networkConnection.isConnected) throw NetworkDeviceDisconnectedException("Network Device is down");

      _firebaseAuth.currentUser?.reload();
      if (_firebaseAuth.currentUser == null) throw firebase_auth.FirebaseAuthException(code: ExceptionHandler.nullUserId);
      final firebaseUser = _firebaseAuth.currentUser!;

      final fireStoreUserMap =
          await _fireStore.collection(FireStoreCollections.users).doc(firebaseUser.uid).get().timeout(Timeouts.postTimeout);
      if (!fireStoreUserMap.exists || fireStoreUserMap.data() == null) {
        return Resource.fail(DefaultError(
            userMessage: AppText.errorFetchingData, exception: "Can't get metadata from firestore while request user, it is empty"));
      }
      final user = User.fromMap(fireStoreUserMap.data()!, firebaseUser, userCredential: userCredential);
      return Resource.success(user);
    } catch (exception) {
      return ExceptionHandler.firebaseResourceExceptionHandler(exception);
    }
  }

}
