class DbService {
  // Making Singelton
  // what is singelton and why we use it
  // A singleton is a design pattern that restricts the instantiation of a class to one single instance.
  static DbService? _instance;
  DbService._internal();
  factory DbService() {
    return _instance ??= DbService._internal();
  }
}
