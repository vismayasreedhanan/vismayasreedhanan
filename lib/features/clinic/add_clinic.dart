import 'package:flutter/material.dart';
import 'package:petspaw_admin/common_widget/custom_alert_dialog.dart';

class AddClinic extends StatelessWidget {
  const AddClinic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(title: 'Add Clinic');
  }
}
