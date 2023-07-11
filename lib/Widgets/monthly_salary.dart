import 'package:flutter/material.dart';

int monthlySalary = 0;

class MonthlySalary extends StatefulWidget {
  MonthlySalary({
    super.key,
  });

  @override
  State<MonthlySalary> createState() => _MonthlySalaryState();
}

class _MonthlySalaryState extends State<MonthlySalary> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 20, 8, 0),
      child: TextFormField(
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Monthly Salary',
          labelStyle: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white54,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.white),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              int.tryParse(value) == null ||
              int.tryParse(value)! <= 0) {
            return "Salary must be a valid number";
          }
        },
        onSaved: (newValue) {
          setState(() {
            monthlySalary = int.parse(newValue!);
          });
        },
      ),
    );
  }
}
