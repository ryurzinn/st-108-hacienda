import 'dart:io';
import 'package:udp/udp.dart';
import 'package:get/get.dart';

class OpenPortUdpController extends GetxController{

  var peso = '0'.obs;
  var estable = true.obs;

  

  Future openPortUdp() async {

    var arrayPeso;
    var receiver = await UDP.bind(Endpoint.any(port: const Port(5900)));

    receiver.asStream().listen((datagram) {
      var str = String.fromCharCodes(datagram!.data);
      
      str = str.substring(6, str.length);
      arrayPeso = str.split(',');
      peso.value = arrayPeso[0];
    
      stdout.write(str);
    });
  }

}




