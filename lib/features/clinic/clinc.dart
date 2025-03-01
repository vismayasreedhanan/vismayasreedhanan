import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:petspaw_admin/common_widget/custom_button.dart';
import 'package:petspaw_admin/common_widget/custom_search.dart';
import 'package:petspaw_admin/features/clinic/add_clinic.dart';

import '../../theme/app_theme.dart';

class Clinics extends StatelessWidget {
  const Clinics({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  'Clinics',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                ),
              ),
              SizedBox(
                width: 300,
                child: CustomSearch(
                  onSearch: (p0) {},
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CustomButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AddClinic(),
                  );
                },
                label: 'Add Clinic',
                iconData: Icons.add,
                inverse: true,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Expanded(
                child: DataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 600,
                  columns: [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Phone')),
                    DataColumn(
                        label: Align(
                            alignment: Alignment.centerRight,
                            child: Text('Actions'))),
                  ],
                  rows: List<DataRow>.generate(
                    10,
                    (index) => DataRow(
                      cells: [
                        DataCell(Text('ID_$index')),
                        DataCell(Text('Clinic $index')),
                        DataCell(Text('clinic$index@example.com')),
                        DataCell(Text('123-456-7890')),
                        DataCell(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Edit action
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(color: Color(0xFFFFA94D)),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Delete action
                                },
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: Color(0xFFFF6B6B)),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // View details action
                                },
                                child: Text(
                                  'View',
                                  style: TextStyle(color: Color(0xFF6EC5FF)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
