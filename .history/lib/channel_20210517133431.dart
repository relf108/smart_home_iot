import 'package:smart_home_iot/Objects/home.dart';
import 'package:smart_home_iot/Objects/motion_state.dart';
import 'package:smart_home_iot/smart_home_iot.dart';

class SmartHomeIotChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    Home home = new Home(MotionState(Timer(Duration(seconds: 0), ())), temp, brightness)

    final router = Router();

    ///Reset motion detected timer
    router.route("/motionDetected").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });
    ///Sets the temp of the system
    router.route("/setTemp").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });
    ///Set the brightness of the system to a new value, should be called when potentiometer changes
    router.route("/setBrightness").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });
    ///Get the current temp of the system
    router.route("/getTemp").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });
    ///Get the current value of an arduinos potentiometer (defines brightness)
    router.route("/getBrightness").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });
    ///Get weather motion has been detected in the last 5 minutes
    router.route("/getMotionState").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    return router;
  }
}
