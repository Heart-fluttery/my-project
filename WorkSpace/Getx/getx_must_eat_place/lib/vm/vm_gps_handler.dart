import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class VmGpsHandler extends GetxController{
   // 위치 정보
  final latitude = ''.obs;
  final longitude = ''.obs;

  Future<void> checkLocationPermission() async{
    LocationPermission permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }

    if(permission == LocationPermission.deniedForever) return;

    if(permission == LocationPermission.whileInUse || permission == LocationPermission.always){
      final position = await Geolocator.getCurrentPosition();
      latitude.value = position.latitude.toString();
      longitude.value = position.longitude.toString();
    }
  }

}