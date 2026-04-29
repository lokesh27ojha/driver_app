//import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

//import 'package:driver_app/model/Driver.dart';
import 'package:driver_app/data/MockRideRequestData.dart';
import 'package:driver_app/model/RideRequest.dart';
import 'package:flutter/material.dart';
import 'package:driver_app/components/home/HomeTopBar.dart';
import 'package:driver_app/components/home/HomeTripInfoCard.dart';
import 'package:driver_app/components/home/HomeStatusToggle.dart';
import 'package:driver_app/components/home/HomeMapSection.dart';
import 'package:driver_app/components/home/HomeRequestList.dart';
import 'package:driver_app/service/AppStateService.dart';
import 'package:driver_app/model/DriverState.dart';




class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void didChangeDependencies() {
    setState(() {});
    super.didChangeDependencies();
  }

  List<RideRequest> rideRequests=MockRideRequestData.rideRequests;

  DriverState get status => AppStateService.driverState;

  final driver = AppStateService.currentDriver;
  //final ride = AppStateService.currentRide;

  

  @override
  Widget build(BuildContext context) {
    if ((status == DriverState.GOING_TO_PICKUP || status == DriverState.ON_TRIP)
    && AppStateService.currentRide == null) {
  AppStateService.setState(DriverState.ONLINE);
}
    return Scaffold(
      body: Column(
        children: [

          HomeTopBar(
            name: driver?.firstName ?? "Driver",
            license: driver?.licenceNumber ?? "N/A",
            imagePath: "assets/img/dp.jpg",
            onProfileTap: () {
              Navigator.of(context).pushNamed("/profile");
            },
          ),

          if(status==DriverState.ON_TRIP)
            const HomeTripInfoCard(),

          HomeStatusToggle(
            status: status,
            isEnabled: status == DriverState.ONLINE || status==DriverState.OFFLINE, // 🔥 key logic
            onToggle: (value) {
              setState(() {
                AppStateService.setState(
                  value ? DriverState.ONLINE : DriverState.OFFLINE,
                );
              });
            },
          ),

          Expanded(
            child: HomeMapSection(
  key: ValueKey(status), // 🔥 forces rebuild on state change
  status: status,
  ride: AppStateService.currentRide,
),
          ),

          if (status == DriverState.ONLINE || status == DriverState.REQUEST_RECEIVED)
            HomeRequestList(
              requestList: rideRequests,
              onAccept: (ride) {
                setState(() {
                  AppStateService.setRide(ride);
                  AppStateService.setState(DriverState.GOING_TO_PICKUP);
                });
              },
              onReject: (ride) {},
            ),

            if (status == DriverState.GOING_TO_PICKUP)
  Padding(
    padding: const EdgeInsets.all(12),
    child: ElevatedButton(
      onPressed: () {
  setState(() {
    AppStateService.setState(DriverState.ON_TRIP);
  });
},
      child: const Text("Start Trip"),
    ),
  ),


      if(status == DriverState.ON_TRIP)
        Padding(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                AppStateService.setState(DriverState.ONLINE);
              });
            },
            child: const Text("End Trip")
          ),  
          ),
        ],
      ),
    );
  }
}