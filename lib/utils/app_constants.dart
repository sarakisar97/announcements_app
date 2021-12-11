
enum UserType{student, teacher}

class AppConstants{

  ///labels
  static const String appTitle = 'Announcements App';

  ///regex
  static final RegExp passwordRegExp = RegExp(r'(^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#@$!%*?&-])[A-Za-z\d@#$!%*?&-]{8,}$)');

  ///images
  static const String defaultProfileImage = 'https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1223671392?k=20&m=1223671392&s=612x612&w=0&h=lGpj2vWAI3WUT1JeJWm1PRoHT3V15_1pdcTn2szdwQ0=';

  ///network
  static const String baseUrl = 'http://167.86.111.130:805/api';
  static const String userObject = 'userObject';

  ///messages
  static const String checkInternet = 'Check the internet connection please';

}