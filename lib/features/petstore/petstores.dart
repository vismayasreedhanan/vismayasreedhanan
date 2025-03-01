import 'package:flutter/material.dart';

import '../../common_widget/custom_button.dart';
import '../../common_widget/custom_search.dart';
import '../../theme/app_theme.dart';
import '../clinic/add_clinic.dart';

class Petstores extends StatelessWidget {
  const Petstores({super.key});

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
                  'PetStores',
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
                label: 'Add PetStore',
                iconData: Icons.add,
                inverse: true,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: List.generate(10, (index) => CustomPetStoreCard()),
          )),
        ],
      ),
    );
  }
}

class CustomPetStoreCard extends StatelessWidget {
  const CustomPetStoreCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: outlineColor),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: outlineColor),
                  borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://images.unsplash.com/photo-1516453734593-8d198ae84bcf?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with actual image URL
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PetStore Name', // Replace with actual pet store name
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
