import 'package:driver_app/components/earning/EarningHistoryList.dart';
import 'package:driver_app/components/earning/EarningTodayBanner.dart';
import 'package:driver_app/components/earning/EarningTotalCard.dart';
import 'package:flutter/material.dart';


class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Earnings")),

      body: Column(
        children: const [

          // 🔹 TODAY BANNER
          EarningTodayBanner(),

          // 🔹 TOTAL
          EarningTotalCard(),

          // 🔹 HISTORY
          Expanded(
            child: EarningsHistoryList(),
          ),
        ],
      ),
    );
  }
}