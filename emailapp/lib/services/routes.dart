import '../screens/login.dart';
import '../screens/home.dart';
import '../screens/submitedmail.dart';
import '../screens/contact.dart';
import '../screens/register.dart';

final routes = {
  "/contact": (context) => const ContactScreen(),
  "/register": (context) => const RegisterScreen(),
  "/login": (context) => const LoginScreen(),
  "/submited": (context) => const SubmitedMail(),
  "/home": (context) => const HomePage(),
};
