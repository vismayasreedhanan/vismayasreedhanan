import 'package:flutter/material.dart';
import 'package:petspaw_admin/common_widget/custom_button.dart';
import 'package:petspaw_admin/common_widget/custom_search.dart';
import 'package:petspaw_admin/features/clinic/add_clinic.dart';
import 'package:petspaw_admin/features/dashboard/modern_clinic_card.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomSearch(
                onSearch: (p0) {},
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
            height: 30,
          ),
          Center(
            child: SizedBox(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ModernClinicCard(
                    name: 'PawCare Central',
                    location: '123 Main St, New York, NY',
                    rating: 4.8,
                    status: 'active',
                    appointments: 35,
                    imageUrl:
                        'https://www.reidmiddleton.com/wp-content/uploads/2016/09/Project-HeroImage01-DoctorsClinic1.jpg',
                  ),
                  ModernClinicCard(
                    name: 'Happy Tails Clinic',
                    location: '456 Park Ave, Boston, MA',
                    rating: 4.6,
                    status: 'active',
                    appointments: 24,
                    imageUrl:
                        'https://www.reidmiddleton.com/wp-content/uploads/2016/09/Project-HeroImage01-DoctorsClinic1.jpg',
                  ),
                  ModernClinicCard(
                    name: 'Pet Wellness Center',
                    location: '789 Oak Rd, Chicago, IL',
                    rating: 4.9,
                    status: 'inactive',
                    appointments: 54,
                    imageUrl:
                        'https://www.reidmiddleton.com/wp-content/uploads/2016/09/Project-HeroImage01-DoctorsClinic1.jpg',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
