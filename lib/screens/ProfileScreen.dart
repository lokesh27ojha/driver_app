import 'package:driver_app/components/profile/ProfileHistoryCard.dart';
import 'package:driver_app/screens/FullImageScreen.dart';
import 'package:flutter/material.dart';
import 'package:driver_app/service/AppStateService.dart';
//import 'package:driver_app/model/DriverState.dart';



  class ProfileScreen extends StatefulWidget {
    const ProfileScreen({super.key});

    @override
    State<ProfileScreen> createState() => _ProfileScreenState();
  }

  class _ProfileScreenState extends State<ProfileScreen> {

    String imagePath = "assets/img/dp.jpg";

    Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 35, color: color),
          SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

    @override
    Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
        ),
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: Column(
            children: [

              // 🔵 BLUE HEADER
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    // 🟡 TEXT AREA
                    Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStateService.currentDriver?.firstName ?? "Driver",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                child: Text("Home"),
                                onTap: () => {
                                  Navigator.of(context).pushNamed("/home")
                                },
                              )
                            ],
                          ),

                          Text(
                            AppStateService.currentDriver?.lastName ?? "Last Name",
                            style: TextStyle(
                              fontSize: 25,
                              height: 1,
                              color: Colors.white,
                            ),
                          ),

                          Text(
                            AppStateService.currentDriver?.licenceNumber ?? "N/A",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade700,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),

                    // 🟢 PROFILE IMAGE (CLICKABLE)
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: false, // 👈 IMPORTANT
                            pageBuilder: (_, __, ___) => FullImageScreen(
                              imagePath: imagePath,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: "profilePic",
                        child: ClipOval(
                          child: Image.asset(
                            imagePath,
                            width: 250,
                            height: 250,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 🔻 BELOW AREA
                      Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [

                    // 👤 DRIVER NAME CARD
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.person, color: Colors.blue),
                        title: Text("${AppStateService.currentDriver?.firstName ?? "Driver"} ${AppStateService.currentDriver?.lastName ?? "Driver"}"),
                        subtitle: Text("Driver ID: ${AppStateService.currentDriver?.firstName ?? "Driver"}"),
                        onTap: () {
                          Navigator.of(context).pushNamed("/details");
                        },
                      ),
                    ),

                    SizedBox(height: 10),

                    // 📊 STATS GRID
                    GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 1.3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [

                        // 🚗 TRIPS
                        _buildStatCard(
                          icon: Icons.local_taxi,
                          title: "Trips",
                          value: "128",
                          color: Colors.orange,
                        ),

                        // 📍 KMS
                        _buildStatCard(
                          icon: Icons.route,
                          title: "Kilometers",
                          value: "1,240 km",
                          color: Colors.green,
                        ),

                        // 💰 EARNINGS
                        _buildStatCard(
                          icon: Icons.currency_rupee,
                          title: "Earnings",
                          value: "₹18,500",
                          color: Colors.purple,
                        ),

                        // ⭐ RATING
                        _buildStatCard(
                          icon: Icons.star,
                          title: "Rating",
                          value: "4.8",
                          color: Colors.amber,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ProfileHistoryCard(
                      onTap: () {
                        Navigator.pushNamed(context, "/earning");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
            ],
          ),
        ),
      );
    }
  }