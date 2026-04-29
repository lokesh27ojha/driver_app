import 'package:driver_app/model/DriverState.dart';
import 'package:driver_app/model/RideRequest.dart';
import 'package:driver_app/model/RideRequestDetails.dart';
import 'package:driver_app/screens/RideDetailsScreen.dart';
import 'package:driver_app/service/AppStateService.dart';
import 'package:flutter/material.dart';



class HomeRequestList extends StatelessWidget {
  final List<RideRequest> requestList;
  final Function(RideRequest) onAccept;
  final Function(RideRequest) onReject;

  const HomeRequestList({
    super.key,
    required this.requestList,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: requestList.length,
        itemBuilder: (context, index) {
          final ride=requestList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              
              title: Text("${ride.pickupLocation} → ${ride.dropLocation}"),
              subtitle: Text("${ride.distance} km • ${ride.eta} min"),

              // 🔥 THIS IS THE IMPORTANT PART
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RideDetailsScreen(
                      ride: RideRequestDetails(
                        pickup: ride.pickupLocation,
                        drop: ride.dropLocation,
                        distance: ride.distance,
                        estimatedTime: ride.eta,
                        fare: ride.fare,
                      ),
                      onAccept: (){
                        onAccept(ride);
                        AppStateService.setRide(ride);
                        AppStateService.setState(DriverState.GOING_TO_PICKUP);
                      },
                      onReject: (){
                        onReject(ride);
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}