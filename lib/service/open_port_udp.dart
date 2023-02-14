import 'dart:io';

import 'package:udp/udp.dart';

Future openPortUdp() async {

      var receiver = await UDP.bind(Endpoint.any(port: const Port(5900)));

      receiver.asStream().listen((datagram) {
        var str = String.fromCharCodes(datagram!.data);
        stdout.write(str);
      });
      }