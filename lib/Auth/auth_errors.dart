import 'package:flutter/material.dart';

class Errors {
  static void showError(String errorMessage) {
    String errMessage;
    switch (errorMessage) {
      case ('Confirm your account using the link in the email to log in'):
        errMessage = 'Подтвердите ваш аккаунт, используя ссылку отправленную на вашу почту';
        break;
      // Добавьте другие коды ошибок и соответствующие сообщения
      default:
        errMessage = 'Произошла ошибка';
    }

  }
}
