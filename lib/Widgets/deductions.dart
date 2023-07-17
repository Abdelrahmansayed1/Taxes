import 'package:flutter/material.dart';

int deductions = 0;

class Deductions extends StatefulWidget {
  const Deductions({super.key});

  @override
  State<Deductions> createState() => _DeductionsState();
}

class _DeductionsState extends State<Deductions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 8, 20),
      child: TextFormField(
        initialValue: "0",
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Deductions',
          labelStyle: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffe2e2f0),
              width: 2,
            ),
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
            .copyWith(color: Colors.black54),
        validator: (value) {
          if (int.tryParse(value!) == null) {
            setState(() {
              deductions = 0;
            });
          } else if (int.tryParse(value)! < 0) {
            return "Deductions must be a valid number";
          }
        },
        onSaved: (newValue) {
          if (newValue == "") {
            newValue = "0";
          } else {
            setState(() {
              deductions = int.parse(newValue!);
            });
          }
          // print(deductions);
        },
      ),
    );
  }
}
