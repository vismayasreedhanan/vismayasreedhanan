import 'package:flutter/material.dart';

class AppointmentsView extends StatelessWidget {
  const AppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header with buttons
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Appointments',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.list),
                    label: const Text('List View'),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_today),
                    label: const Text('Calendar View'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('New Appointment'),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Stats cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              _buildStatCard(
                'Total Appointments',
                '2',
                Icons.calendar_month,
                Colors.blue,
              ),
              const SizedBox(width: 16),
              _buildStatCard(
                'Completed',
                '0',
                Icons.check_circle,
                Colors.green,
              ),
              const SizedBox(width: 16),
              _buildStatCard(
                'Scheduled',
                '1',
                Icons.schedule,
                Colors.blue,
              ),
              const SizedBox(width: 16),
              _buildStatCard(
                'Cancelled',
                '0',
                Icons.cancel,
                Colors.red,
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Appointments list
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              _buildAppointmentCard(
                petName: 'Max',
                ownerName: 'John Smith',
                time: '09:00',
                status: 'scheduled',
                doctor: 'Dr. Sarah Wilson',
              ),
              const SizedBox(height: 16),
              _buildAppointmentCard(
                petName: 'Luna',
                ownerName: 'Emma Davis',
                time: '10:30',
                status: 'in-progress',
                doctor: 'Dr. Michael Chen',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Icon(icon, color: color),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentCard({
    required String petName,
    required String ownerName,
    required String time,
    required String status,
    required String doctor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.pets,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  petName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.person_outline, size: 16),
                    const SizedBox(width: 4),
                    Text(ownerName),
                    const SizedBox(width: 16),
                    const Icon(Icons.access_time, size: 16),
                    const SizedBox(width: 4),
                    Text(time),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: status == 'scheduled'
                  ? Colors.blue.withOpacity(0.1)
                  : Colors.yellow.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: status == 'scheduled' ? Colors.blue : Colors.orange,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(doctor),
        ],
      ),
    );
  }
}
