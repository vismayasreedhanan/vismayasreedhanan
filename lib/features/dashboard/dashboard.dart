import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:petspaw_admin/features/dashboard/stat_card.dart';
import 'package:petspaw_admin/theme/app_theme.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              StatCard(
                title: 'Total Clinics',
                value: '12',
                isPositive: true,
                icon: Icons.business,
              ),
              StatCard(
                title: 'Total PetStore',
                value: '72',
                isPositive: true,
                icon: Icons.pets,
              ),
              StatCard(
                title: 'Total Users',
                value: '89',
                isPositive: true,
                icon: Icons.people,
              ),
              StatCard(
                title: 'Total Pets',
                value: '100',
                isPositive: true,
                icon: Icons.star,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            'New Users',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFF1D8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Expanded(
                child: DataTable2(
                  columns: const [
                    DataColumn2(
                      label: Text('ID'),
                      size: ColumnSize.S,
                    ),
                    DataColumn2(label: Text('Name'), size: ColumnSize.L),
                    DataColumn2(label: Text('Email'), size: ColumnSize.L),
                    DataColumn2(label: Text('Joined Date'), size: ColumnSize.M),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('John Doe')),
                      DataCell(Text('john.doe@example.com')),
                      DataCell(Text('2023-01-01')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('Jane Smith')),
                      DataCell(Text('jane.smith@example.com')),
                      DataCell(Text('2023-02-01')),
                    ]),
                    // Add more rows as needed
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
