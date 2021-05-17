import 'dart:convert';

import 'package:smart_home_iot/Objects/home.dart';
import 'package:smart_home_iot/Objects/motion_state.dart';
import 'package:smart_home_iot/smart_home_iot.dart';
import 'package:convert/convert.dart';

class SmartHomeIotChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    Home home = Home.off();

    final router = Router();

    ///Reset motion detected timer
    router.route("/setMotionDetected").linkFunction((request) async {
      ///Reset Timer
      home.motionState =
          MotionState(Timer(const Duration(minutes: 5), () => {}));
      return Response.ok(
          {"newMotionState": home.motionState.getState().toString()});
    });

    ///Sets the temp of the system
    router.route("/setTemp/[:temp]").linkFunction((request) async {
      home.temp = double.tryParse(request.path.variables['temp']!)!;
      return Response.ok({"newTemp": home.temp.toString()});
    });

    ///Set the brightness of the system to a new value, should be called when potentiometer changes
    router.route("/setBrightness/[:brightness]").linkFunction((request) async {
      home.brightness = integer.tryParse(request.path.variables['brightness']!)!;
      return Response.ok({"newBrightness": home.brightness.toString()});
    });

    ///Get the current temp of the system
    router.route("/getTemp").linkFunction((request) async {
      return Response.ok({"temp": home.temp.toString()});
    });

    ///Get the current value of an arduinos potentiometer (defines brightness)
    router.route("/getBrightness").linkFunction((request) async {
      return Response.ok({"brightness": home.brightness.toString()});
    });

    ///Get weather motion has been detected in the last 5 minutes
    router.route("/getMotionState").linkFunction((request) async {
      return Response.ok(
          {"motionState": home.motionState.getState().toString()});
    });

    return router;
  }
}
