import 'package:flutter/material.dart';

import 'home_screen.dart';

class Clinics extends StatelessWidget {
  const Clinics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 700,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  hintText: 'Search',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: 700,
              child: ListView(
                shrinkWrap: true,
                children: [
                  ClinicCard(
                    name: 'PawCare Central',
                    location: '123 Main St, New York, NY',
                    rating: 4.8,
                    status: 'active',
                  ),
                  ClinicCard(
                    name: 'Happy Tails Clinic',
                    location: '456 Park Ave, Boston, MA',
                    rating: 4.6,
                    status: 'active',
                  ),
                  ClinicCard(
                    name: 'Pet Wellness Center',
                    location: '789 Oak Rd, Chicago, IL',
                    rating: 4.9,
                    status: 'inactive',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
