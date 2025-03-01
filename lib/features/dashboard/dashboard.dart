import 'package:flutter/material.dart';
import 'package:petspaw_admin/features/dashboard/activity_timeline.dart';
import 'package:petspaw_admin/features/dashboard/modern_clinic_card.dart';
import 'package:petspaw_admin/features/dashboard/stat_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              StatCard(
                title: 'Total Clinics',
                value: '12',
                trend: '+8%',
                isPositive: true,
                icon: Icons.business,
                color: Color(0xFF6C63FF),
              ),
              StatCard(
                title: 'Total Patients',
                value: '1,458',
                trend: '+12%',
                isPositive: true,
                icon: Icons.pets,
                color: Color(0xFF4CAF50),
              ),
              StatCard(
                title: 'Total Staff',
                value: '89',
                trend: '+5%',
                isPositive: true,
                icon: Icons.people,
                color: Color(0xFFFFA726),
              ),
              StatCard(
                title: 'Average Appointments',
                value: '4.8%',
                trend: '+0.3',
                isPositive: true,
                icon: Icons.star,
                color: Color(0xFFEC407A),
              ),
            ],
          ),

          const SizedBox(height: 32),

          Row(
            children: const [
              Text(
                'Recent Activity',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                'View All',
                style: TextStyle(color: Color(0xFF6C63FF)),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: Color(0xFF6C63FF), size: 16),
            ],
          ),
          const SizedBox(height: 16),

          const ActivityTimeline(),

          const SizedBox(height: 32),

          Row(
            children: const [
              Text(
                'Your Clinics',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                'View All',
                style: TextStyle(color: Color(0xFF6C63FF)),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: Color(0xFF6C63FF), size: 16),
            ],
          ),
          const SizedBox(height: 16),

          // Clinic list
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              ModernClinicCard(
                name: 'PawCare Central',
                location: '123 Main St, New York, NY',
                rating: 4.8,
                status: 'active',
                appointments: 18,
                imageUrl:
                    'https://www.reidmiddleton.com/wp-content/uploads/2016/09/Project-HeroImage01-DoctorsClinic1.jpg',
              ),
              ModernClinicCard(
                name: 'Happy Tails Clinic',
                location: '456 Park Ave, Boston, MA',
                rating: 4.6,
                status: 'active',
                appointments: 12,
                imageUrl:
                    'https://www.reidmiddleton.com/wp-content/uploads/2016/09/Project-HeroImage01-DoctorsClinic1.jpg',
              ),
              ModernClinicCard(
                name: 'Pet Wellness Center',
                location: '789 Oak Rd, Chicago, IL',
                rating: 4.9,
                status: 'inactive',
                appointments: 0,
                imageUrl:
                    'https://www.reidmiddleton.com/wp-content/uploads/2016/09/Project-HeroImage01-DoctorsClinic1.jpg',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
