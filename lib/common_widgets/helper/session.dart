class Session {
  Session._();

  static String userid = '';

  static updateUserDataLocalStorage(
    String userid,
  ) async {
    Session.userid = userid;
  }
}
