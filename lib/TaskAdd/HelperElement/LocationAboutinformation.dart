import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../Provider/Provider.dart';
import '../../services/Location_Service.dart';

class LocationAbouInfo extends StatefulWidget {
  const LocationAbouInfo({Key? key}) : super(key: key);

  @override
  State<LocationAbouInfo> createState() => _LocationAbouInfoState();
}

class _LocationAbouInfoState extends State<LocationAbouInfo> {
  Providerr providerr = Providerr();
  @override
  void initState() {
    providerr.getLatLong();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Providerr>(builder: (context, Providerr, child) {
      return GestureDetector(
        onTap: () {
          setState(() {
            Providerr.locationLoading = true;
          });
          Providerr.getLatLong();
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Providerr.locationLoading == true
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
                  : Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 38,
                        ),
                        Expanded(
                          child: Text(
                            Providerr.address,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        )
                      ],
                    ),
            ),
          ),
        ),
      );
    });
  }
}
