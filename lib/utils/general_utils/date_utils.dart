
import 'package:intl/intl.dart';

class DateUtils{

  static bool isValidFormat(String format){
    switch (format){
      case 'MM/DD/YY':
      case 'DD/MM/YY':
      case 'YY/MM/DD':
      case 'Mon-DD-YYYY':
      case 'DD-Mon-YYYY':
      case 'mm/dd/yyyy':
      case 'mm/dd/yy':
      case 'dd/mm/yyyy':
      case 'mm-dd-yyyy':
      case 'yyyy-mm-dd':
        return true;
      default:
        return false;
    }
  }

  //Get the current system date according to the specified date format
  static String getCurrentDate(String format){
    if(!isValidFormat(format)){
      throw ArgumentError('Invalid Format');
    }
    final currentDate = DateTime.now();
    final formatedDate = DateFormat(format).format(currentDate);

    return formatedDate;
  }

  //Convert Date to String according to incoming date format.
  static String getStringFromDate(DateTime date, String format){
    if(!isValidFormat(format)){
      throw ArgumentError('Invalid Format');
    }else{
      return DateFormat(format).format(date);
    }
  }

  //Convert String to Date according to incoming date format.
  static DateTime getDateFromString(String dateString, String format){
    if(!isValidFormat(format)){
      throw ArgumentError('Invalid Format');
    }else{
      return DateFormat(format).parse(dateString);
    }
  }

  //Formats given Date into String.
  static String formatDateToString(DateTime date, String format){
    if(!isValidFormat(format)){
      throw ArgumentError('Invalid Format');
    }else{
      return DateFormat(format).format(date);
    }
  }

  //Gets Days of weeks.
  static String getDayOfWeek(DateTime date){
    final DayofWeek = DateFormat('EEEE').format(date);
    return DayofWeek;
  }

  //Formats a DateTime object into a string using a provided pattern.
  static String formatDateTime(DateTime dateTime, String pattern){
    final formatter = DateFormat(pattern);
    return formatter.format(dateTime);
  }

  //Parse a string into DateTime object using a provided pattern.
  static DateTime parseDateTime(String dateString, String pattern){
    final formatter = DateFormat(pattern);
    return formatter.parse(dateString);
  }

  //Add a specific number of days into DateTime object.
  static DateTime addDays(DateTime dateTime,int days){
    return dateTime.add(Duration(days: days));
  }

  //Subtract a specific number of days from DateTime object.
  static DateTime subtractDays(DateTime dateTime, int days){
    return dateTime.subtract(Duration(days: days));
  }

  //Checks if two DateTime objects represent the same date.
  static bool isSameDay(DateTime dateTime1, DateTime dateTime2){
    return dateTime1.year == dateTime2.year &&
        dateTime1.month == dateTime2.month &&
        dateTime1.day == dateTime2.day;
  }

  //Check if a DateTime object represents the current date.
  static bool isToday(DateTime dateTime){
    return isSameDay(dateTime, DateTime.now());
  }

}