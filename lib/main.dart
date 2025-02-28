import 'package:ecommerce_app_mobile/common/constant/Screens.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppTheme.dart';
import 'package:ecommerce_app_mobile/firebase_options.dart';
import 'package:ecommerce_app_mobile/presentation/address/bloc/add_address_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/address/bloc/addresses_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/authentication/bloc/email_verification_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/authentication/bloc/sign_in_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/authentication/bloc/sign_up_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/authentication/pages/sign_in_screen.dart';
import 'package:ecommerce_app_mobile/presentation/authentication/pages/sign_up_screen.dart';
import 'package:ecommerce_app_mobile/presentation/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/common/screen/app_locked_screen.dart';
import 'package:ecommerce_app_mobile/presentation/home/bloc/home_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/main/bloc/main_blocs.dart';
import 'package:ecommerce_app_mobile/presentation/main/bloc/main_states.dart';
import 'package:ecommerce_app_mobile/presentation/main/page/main_loader.dart';
import 'package:ecommerce_app_mobile/presentation/order/bloc/order_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/products/bloc/prodcut_list_screen_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/products/bloc/product_details_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/profile/bloc/change_password_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/profile/bloc/edit_profile_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/return/bloc/request_return_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/return/bloc/return_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/search/bloc/search_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/splash/bloc/welcome_blocs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized(); // for use firebase before loading
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //todo: comment it when test is done
  //  FlutterNativeSplash.remove();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => MainBlocs()),
        BlocProvider(create: (BuildContext context) => WelcomeBlocs()),
        BlocProvider(create: (BuildContext context) => SearchBloc()),
        BlocProvider(create: (BuildContext context) => ProductScreenBloc()),
        BlocProvider(create: (BuildContext context) => HomeBloc()),
        BlocProvider(create: (BuildContext context) => ChangePasswordBloc()),
        BlocProvider(create: (BuildContext context) => ProductDetailsBloc()),
        BlocProvider(create: (BuildContext context) => EditProfileBloc()),
        BlocProvider(create: (BuildContext context) => CartBloc()),
        BlocProvider(create: (BuildContext context) => AddressesBloc()),
        BlocProvider(create: (BuildContext context) => AddAddressBloc()),
        BlocProvider(create: (BuildContext context) => SignInBloc()),
        BlocProvider(create: (BuildContext context) => SignUpBloc()),
        BlocProvider(create: (BuildContext context) => EmailVerificationBloc()),
        BlocProvider(create: (BuildContext context) => OrdersBloc()),
        BlocProvider(create: (BuildContext context) => ReturnsBloc()),
        BlocProvider(create: (BuildContext context) => ReturnRequestBloc()),
      ],
      child: BlocBuilder< MainBlocs, MainStates>(
        builder: (BuildContext context, MainStates state) =>
         MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().lightTheme,
          darkTheme: AppTheme().darkTheme,
          themeMode: state.themeMode,
          routes: {
            Screens.signInScreen: (context) => const SignInScreen(),
            Screens.signUpScreen: (context) => const SignUpScreen(),
            Screens.mainScreen: (context) => const MainLoader(),
            Screens.appIsGettingReadyScreen: (context) => const AppLockedScreen(),
          },
          // home:  AppIsGettingReadyScreen(),
          home: const MainLoader(),
        ),
      ),
    );
  }
}
