import 'package:flutter/material.dart';
import 'package:petspaw_admin/common_widget/custom_button.dart';
import 'package:petspaw_admin/common_widget/custom_search.dart';

class StaffManagementView extends StatelessWidget {
  const StaffManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Staff Management',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomButton(
                inverse: true,
                onPressed: () {},
                label: 'Add Staff',
                iconData: Icons.add,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: const [
              Expanded(
                  child: DepartmentCard(
                      title: 'General Medicine',
                      staffCount: '12 / 15 active',
                      percentage: '80%')),
              SizedBox(width: 16),
              Expanded(
                  child: DepartmentCard(
                      title: 'Emergency',
                      staffCount: '18 / 20 active',
                      percentage: '90%')),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(child: CustomSearch(onSearch: (p0) {})),
              const SizedBox(width: 16),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.filter_list),
                label: const Text('All Departments'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: const [
              StaffCard(
                name: 'Dr. Sarah Wilson',
                role: 'doctor - General Medicine',
                imageUrl: 'assets/sarah.jpg',
                workingHours: '08:00 - 16:00',
                appointments: '8 appointments',
                rating: 4.8,
                email: 'sarah.wilson@clinic.com',
                isActive: true,
              ),
              SizedBox(height: 16),
              StaffCard(
                name: 'James Chen',
                role: 'nurse - Emergency',
                imageUrl: 'assets/james.jpg',
                workingHours: '16:00 - 00:00',
                appointments: '12 appointments',
                rating: 4.7,
                email: 'james.chen@clinic.com',
                isActive: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DepartmentCard extends StatelessWidget {
  final String title;
  final String staffCount;
  final String percentage;

  const DepartmentCard(
      {super.key,
      required this.title,
      required this.staffCount,
      required this.percentage});

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
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.person_outline, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                staffCount,
                style: TextStyle(color: Colors.grey[600]),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  percentage,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StaffCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;
  final String workingHours;
  final String appointments;
  final double rating;
  final String email;
  final bool isActive;
  final VoidCallback? onTap;

  const StaffCard({
    super.key,
    required this.name,
    required this.role,
    required this.imageUrl,
    required this.workingHours,
    required this.appointments,
    required this.rating,
    required this.email,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isActive
              ? Colors.green.withOpacity(0.3)
              : Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: AssetImage(imageUrl),
                      ),
                      if (isActive)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.circle,
                              color: Colors.green,
                              size: 16,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                name,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          role,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _InfoItem(
                      icon: Icons.access_time,
                      label: 'Hours',
                      value: workingHours,
                    ),
                    _InfoItem(
                      icon: Icons.event_available,
                      label: 'Appointments',
                      value: appointments,
                      isHighlighted: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isHighlighted;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isHighlighted ? theme.colorScheme.primary : Colors.grey[700];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
            color: isHighlighted ? theme.colorScheme.primary : null,
          ),
        ),
      ],
    );
  }
}
