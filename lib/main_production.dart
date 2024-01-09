import 'package:adv_basics/login.dart';
import 'package:adv_basics/quiz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(
    fileName: 'environments/.env_production'
  );
  runApp(const Quiz());
}
