import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:user_locations/data/model/user_address.dart';
import 'package:user_locations/providers/address_call_provider.dart';
import 'package:user_locations/providers/location_provider.dart';
import 'package:user_locations/providers/tab_box_provider.dart';
import 'package:user_locations/providers/user_locations_provider.dart';

class UserLocationsScreen extends StatefulWidget {
  const UserLocationsScreen({super.key});

  @override
  State<UserLocationsScreen> createState() => _UserLocationsScreenState();
}

class _UserLocationsScreenState extends State<UserLocationsScreen> {
  @override
  Widget build(BuildContext context) {
    List<UserAddress> userAddresses =
        Provider.of<UserLocationsProvider>(context).addresses;
    return Scaffold(
      appBar: AppBar(title: const Text("User Locations Screen")),
      body: ListView(
        children: [
          if (userAddresses.isEmpty) const Text("EMPTY!!!"),
          ...List.generate(userAddresses.length, (index) {
            UserAddress userAddress = userAddresses[index];
            return ListTile(
              onTap: () {
                context.read<TabBoxProvider>().changeIndex(0);
                context.read<AddressCallProvider>().getAddressByLatLong(
                    latLng: LatLng(userAddress.lat, userAddress.long));

                context
                    .read<LocationProvider>()
                    .updateLatLong(LatLng(userAddress.lat, userAddress.long));
              },
              title: Text(userAddress.address),
              subtitle:
                  Text("Lat: ${userAddress.lat} and Longt:${userAddress.long}"),
            );
          })
        ],
      ),
    );
  }
}
