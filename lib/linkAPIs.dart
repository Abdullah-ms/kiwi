class AppLinks {
  static const String server = "https://shifaa.online/newkiwi2024";
 // static const String server = "http://10.0.2.2/newkiwi2024";
  static const String test = "$server/test.php";
  //================= Auth =======================
  static const String signUpAPI = "$server/auth/signup.php";
  static const String verifyCodesSignupAPI = "$server/auth/verifycode.php";
  static const String loginAPI = "$server/auth/login.php";
  //================= Forget Password =======================
  static const String checkEmailAPI = "$server/forgetpassword/checkemail.php";
  static const String resetPasswordAPI = "$server/forgetpassword/resetpassword.php";
  static const String verifyCodeAPI = "$server/forgetpassword/verifycode.php";

}
