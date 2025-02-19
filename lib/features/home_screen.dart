import 'package:flutter/material.dart';
import 'package:petspaw_admin/features/clinc.dart';
import 'package:petspaw_admin/features/staff.dart';

import 'appoiments.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PetCare Admin'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 22, 169, 66),
              ),
              child: Text(
                'PetCare Admin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {
                _tabController.animateTo(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.business),
              title: Text('Clinics'),
              onTap: () {
                _tabController.animateTo(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Staff'),
              onTap: () {
                _tabController.animateTo(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text('Analytics'),
              onTap: () {
                _tabController.animateTo(3);
              },
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Appointments'),
              onTap: () {
                _tabController.animateTo(4);
              },
            ),
          ],
        ),
      ),
      body: Expanded(
        child: TabBarView(
          controller: _tabController,
          children: [
            Dashboard(),
            Clinics(),
            StaffManagementView(),
            Container(
              color: Colors.red,
            ),
            AppointmentsView(),
          ],
        ),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Dashboard Overview',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          Text("Monitor and manage your pet care clinics"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DashboardCard(
                title: 'Total Clinics',
                value: '12',
                growth: '8%',
              ),
              DashboardCard(
                title: 'Total Patients',
                value: '1458',
                growth: '12%',
              ),
              DashboardCard(
                title: 'Total Staff',
                value: '89',
                growth: '5%',
              ),
              DashboardCard(
                title: 'Average Rating',
                value: '4.8',
                growth: '0.3%',
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Clinics Overview',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          ListView(
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
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final String growth;

  const DashboardCard({
    required this.title,
    required this.value,
    required this.growth,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 120,
          width: 130,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(value,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Growth: $growth', style: TextStyle(color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}

class ClinicCard extends StatelessWidget {
  final String name;
  final String location;
  final double rating;
  final String status;

  const ClinicCard({
    required this.name,
    required this.location,
    required this.rating,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(location, style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rating: $rating', style: TextStyle(fontSize: 14)),
                Text(status,
                    style: TextStyle(
                        fontSize: 14,
                        color: status == 'active'
                            ? const Color.fromARGB(255, 202, 202, 201)
                            : const Color.fromARGB(255, 30, 170, 37))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
