import 'package:adv_basics/login.dart';
import 'package:adv_basics/quiz.dart';
import 'package:adv_basics/side_menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(
    fileName: 'environments/.env_staging'
  );
  runApp(const Quiz());
}
