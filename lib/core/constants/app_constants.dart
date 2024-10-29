import 'package:flutter_dotenv/flutter_dotenv.dart';

const String envDevelopment = '.env.development';
const String envProduction = '.env.production';

final String storagePref = dotenv.env['STORAGE_PREF']!;
final String appTitle = dotenv.env['APP_TITLE']!;