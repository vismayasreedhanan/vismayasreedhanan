import 'package:flutter/material.dart';

class AppointmentsView extends StatelessWidget {
  const AppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: const [
              Expanded(
                  child: AppointmentStatCard(
                      title: 'Total Appointments',
                      value: '2',
                      icon: Icons.calendar_month,
                      color: Colors.blue)),
              SizedBox(width: 16),
              Expanded(
                  child: AppointmentStatCard(
                      title: 'Completed',
                      value: '0',
                      icon: Icons.check_circle,
                      color: Colors.green)),
              SizedBox(width: 16),
              Expanded(
                  child: AppointmentStatCard(
                      title: 'Scheduled',
                      value: '1',
                      icon: Icons.schedule,
                      color: Colors.blue)),
              SizedBox(width: 16),
              Expanded(
                  child: AppointmentStatCard(
                      title: 'Cancelled',
                      value: '0',
                      icon: Icons.cancel,
                      color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: const [
              AppointmentCard(
                  petName: 'Max',
                  ownerName: 'John Smith',
                  time: '09:00',
                  status: 'scheduled',
                  doctor: 'Dr. Sarah Wilson'),
              SizedBox(height: 16),
              AppointmentCard(
                  petName: 'Luna',
                  ownerName: 'Emma Davis',
                  time: '10:30',
                  status: 'in-progress',
                  doctor: 'Dr. Michael Chen'),
            ],
          ),
        ),
      ],
    );
  }
}

class AppointmentStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const AppointmentStatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String petName;
  final String ownerName;
  final String time;
  final String status;
  final String doctor;

  const AppointmentCard({
    required this.petName,
    required this.ownerName,
    required this.time,
    required this.status,
    required this.doctor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(width: 16),
          Text(doctor),
        ],
      ),
    );
  }
}
