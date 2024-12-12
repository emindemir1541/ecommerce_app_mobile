import 'package:ecommerce_app_mobile/data/model/user.dart';
import 'package:ecommerce_app_mobile/sddklibrary/helper/ui_helper.dart';
import 'package:flutter/material.dart';

class MainEvents{}

class ToggleThemeEvent extends MainEvents{
  late ThemeMode themeMode;


  ToggleThemeEvent(BuildContext context){
   themeMode = context.isDarkMode ? ThemeMode.light : ThemeMode.dark;
  }
  
  ToggleThemeEvent.from(this.themeMode);
  
}

class ContinueAppWithoutUpdateEvent extends MainEvents{}


class GetInitItemsEvent extends MainEvents{}
class UserSignedInEvent extends MainEvents{
  final User user;

  UserSignedInEvent(this.user);
}
class GetUserIfAuthorizedEvent extends MainEvents{}
class LogOutEvent extends MainEvents{}

class ChangePageEvent extends MainEvents{
  final int index;
  ChangePageEvent(this.index);
}