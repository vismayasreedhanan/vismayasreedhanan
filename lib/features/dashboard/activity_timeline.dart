import 'package:flutter/material.dart';
import 'package:petspaw_admin/features/dashboard/timeline_item.dart';

class ActivityTimeline extends StatelessWidget {
  const ActivityTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TimelineItem(
          title: 'New appointment booked',
          description:
              'Max, a Golden Retriever, has been scheduled for a checkup',
          time: '10 minutes ago',
          color: Color(0xFF4CAF50),
          icon: Icons.calendar_today,
        ),
        TimelineItem(
          title: 'Staff schedule updated',
          description:
              'Dr. Johnson\'s availability has been updated for next week',
          time: '1 hour ago',
          color: Color(0xFF6C63FF),
          icon: Icons.people,
        ),
        TimelineItem(
          title: 'Inventory alert',
          description: 'Vaccine supplies running low at PawCare Central',
          time: '3 hours ago',
          color: Color(0xFFFFA726),
          icon: Icons.warning_amber,
        ),
        TimelineItem(
          title: 'Appointment rate',
          description: 'Happy to see our paw pets are safe and hydrated',
          time: '5 hours ago',
          color: Color(0xFFEC407A),
          icon: Icons.star,
          isLast: true,
        ),
      ],
    );
  }
}
