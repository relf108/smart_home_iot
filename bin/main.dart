import 'package:smart_home_iot/smart_home_iot.dart';

Future main() async {
  final app = Application<SmartHomeIotChannel>()
    ..options.configurationFilePath = "config.yaml"
    ..options.port = 8888;

  await app.startOnCurrentIsolate();

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}
