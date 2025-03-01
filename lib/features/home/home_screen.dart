import 'package:flutter/material.dart';
import 'package:petspaw_admin/features/clinic/clinc.dart';
import 'package:petspaw_admin/features/dashboard/dashboard.dart';
import 'package:petspaw_admin/features/petstore/petstores.dart';
import 'package:petspaw_admin/theme/app_theme.dart';
import 'package:petspaw_admin/util/check_login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../common_widget/change_password.dart';
import '../../common_widget/custom_alert_dialog.dart';
import '../login/login_screen.dart';

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
    checkLogin(context);
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
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
      backgroundColor: backgroundColor,
      body: Row(
        children: [
          Container(
            width: 250,
            decoration: BoxDecoration(
              color: Color(0xFFFDFDFD),
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
                          color: primaryColor,
                        ),
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
                    isActive: _tabController.index == 0,
                    onTap: () => setState(() {
                      _tabController.animateTo(0);
                    }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SidebarItem(
                    icon: Icons.local_hospital,
                    label: "Clinics",
                    isActive: _tabController.index == 1,
                    onTap: () => setState(() {
                      _tabController.animateTo(1);
                    }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SidebarItem(
                    icon: Icons.store,
                    label: "Pet Store",
                    isActive: _tabController.index == 2,
                    onTap: () => setState(() {
                      _tabController.animateTo(2);
                    }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SidebarItem(
                    icon: Icons.lock_outline_rounded,
                    label: "Change Password",
                    isActive: _tabController.index == 3,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const ChangePasswordDialog(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SidebarItem(
                      icon: Icons.logout_rounded,
                      label: "Log Out",
                      isActive: _tabController.index == 4,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomAlertDialog(
                            title: "LOG OUT",
                            content: const Text(
                              "Are you sure you want to log out? Clicking 'Logout' will end your current session and require you to sign in again to access your account.",
                            ),
                            width: 400,
                            primaryButton: "LOG OUT",
                            onPrimaryPressed: () {
                              Supabase.instance.client.auth.signOut();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                  (route) => false);
                            },
                          ),
                        );
                      }),
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
                Petstores(),
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
  final bool isActive;
  final VoidCallback onTap;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isActive ? primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: isActive ? Colors.white : primaryColor, size: 24),
            SizedBox(width: 10),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: isActive ? Colors.white : primaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
