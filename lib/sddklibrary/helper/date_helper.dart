import 'package:ecommerce_app_mobile/common/ui/theme/AppText.dart';

extension DurationHelper  on Duration{
 String get remainedTimeByType {
   if(inMinutes<1){
     return "$inSeconds ${AppText.second}" ;
   }
   if(inHours<1){
     return "$inMinutes ${AppText.minute}" ;
   }
   if(inDays<1){
     return "$inHours ${AppText.hour}" ;
   }
   return "$inDays ${AppText.day}" ;
 }
}