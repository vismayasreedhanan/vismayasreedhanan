import 'package:flutter/material.dart';
import 'package:petspaw_admin/features/clinic/clinc.dart';
import 'package:petspaw_admin/features/dashboard/dashboard.dart';
import 'package:petspaw_admin/features/staff/staff.dart';
import 'package:petspaw_admin/theme/app_theme.dart';
import '../appointment/appointments.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 220,
            decoration: BoxDecoration(
              color: primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(2, 0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'PETSPAW',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: secondaryColor),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset('assets/paw.png'))
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  SidebarItem(
                    icon: Icons.dashboard,
                    label: "Dashboard",
                    index: 0,
                    currentIndex: _currentIndex,
                    onTap: () => setState(() {
                      _currentIndex = 0;
                      _tabController.animateTo(0);
                    }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SidebarItem(
                    icon: Icons.business,
                    label: "Clinics",
                    index: 1,
                    currentIndex: _currentIndex,
                    onTap: () => setState(() {
                      _currentIndex = 1;
                      _tabController.animateTo(1);
                    }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SidebarItem(
                    icon: Icons.people,
                    label: "Staff",
                    index: 2,
                    currentIndex: _currentIndex,
                    onTap: () => setState(() {
                      _currentIndex = 2;
                      _tabController.animateTo(2);
                    }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // SidebarItem(
                  //   icon: Icons.analytics,
                  //   label: "Analytics",
                  //   index: 3,
                  //   currentIndex: _currentIndex,
                  //   onTap: () => setState(() {
                  //     _currentIndex = 3;
                  //     _tabController.animateTo(3);
                  //   }),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // SidebarItem(
                  //   icon: Icons.event,
                  //   label: "Appointments",
                  //   index: 3,
                  //   currentIndex: _currentIndex,
                  //   onTap: () => setState(() {
                  //     _currentIndex = 3;
                  //     _tabController.animateTo(3);
                  //   }),
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: const [
                Dashboard(),
                Clinics(),
                StaffManagementView(),
                // AnalyticsView(),
                AppointmentsView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int currentIndex;
  final VoidCallback onTap;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: currentIndex == index
                ? Colors.blueGrey.shade700
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
