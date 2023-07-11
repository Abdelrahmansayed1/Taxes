import 'package:flutter/material.dart';
import 'package:taxes/Widgets/monthly_salary.dart';

int socialInsurance = 0;

class SocialInsurance extends StatefulWidget {
  const SocialInsurance({super.key});

  @override
  State<SocialInsurance> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SocialInsurance> {
  bool insured30 = false;
  bool unInsured = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 20, 8, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              "Social Insurance",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
            TextFormField(
              validator: (value) {
                if (int.tryParse(value!) == null) {
                  setState(() {
                    socialInsurance = 0;
                  });
                } else if (int.tryParse(value)! < 0) {
                  return "social insurance must be a valid number";
                }
              },
              onSaved: (newValue) {
                if (newValue == "") {
                  newValue = "0";
                } else {
                  setState(() {
                    socialInsurance = int.parse(newValue!);
                  });
                }
              },
              enabled: (insured30 || unInsured) ? false : true,
              style: (insured30 || unInsured)
                  ? const TextStyle(color: Colors.white38)
                  : const TextStyle(color: Colors.white),
              controller: insured30
                  ? TextEditingController(text: "10900")
                  : TextEditingController(),
              decoration: InputDecoration(
                labelText: 'Insurance Wage',
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
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                "Auto, Apply 30% allowances exempt",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
              trailing: Checkbox(
                fillColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.primary),
                value: insured30,
                onChanged: (value) {
                  if ((insured30 == false && unInsured == false) ||
                      (insured30 == true && unInsured == false)) {
                    setState(() {
                      insured30 = !insured30;
                    });
                  } else if (insured30 == false && unInsured == true) {
                    setState(() {
                      insured30 = !insured30;
                      unInsured = !unInsured;
                    });
                  }
                },
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                "Uninsured",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
              trailing: Checkbox(
                fillColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.primary),
                value: unInsured,
                onChanged: (value) {
                  if ((unInsured == false && insured30 == false) ||
                      (unInsured == true && insured30 == false)) {
                    setState(() {
                      unInsured = !unInsured;
                    });
                  } else if (unInsured == false && insured30 == true) {
                    setState(() {
                      unInsured = !unInsured;
                      insured30 = !insured30;
                    });
                  }
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
