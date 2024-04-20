class AppLinks {
  static const String server = "https://shifaa.online/newkiwi2024";
 // static const String server = "http://10.0.2.2/newkiwi2024"; // if local database

  //================= Images =======================

  static const String imagesPlaceOnServer = "https://shifaa.online/newkiwi2024/upload";
  static const String imagesCategories = "$imagesPlaceOnServer/categories";
  static const String imagesItems = "$imagesPlaceOnServer/items";


  //========================================


  static const String test = "$server/test.php";
  //================= Auth =======================
  static const String signUpAPI = "$server/auth/signup.php";
  static const String verifyCodesSignupAPI = "$server/auth/verifycode.php";
  static const String loginAPI = "$server/auth/login.php";
  //================= Forget Password =======================
  static const String checkEmailAPI = "$server/forgetpassword/checkemail.php";
  static const String resetPasswordAPI = "$server/forgetpassword/resetpassword.php";
  static const String verifyCodeAPI = "$server/forgetpassword/verifycode.php";
//================= Home =======================
  static const String homepage = "$server/home.php";
//================= Items =======================
  static const String items = "$server/items/items.php";
//================= Favorite =======================
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
}
