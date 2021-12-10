
enum UserType{student, teacher}

class AppConstants{

  ///labels
  static const String appTitle = 'Announcements App';

  ///regex
  static final RegExp passwordRegExp = RegExp(r'(^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#@$!%*?&-])[A-Za-z\d@#$!%*?&-]{8,}$)');

  ///network
  static const String baseUrl = 'http://167.86.111.130:805/api';
  static const String tokenHeader = 'tokenHeader';
}