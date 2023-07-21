import 'package:flutter/material.dart';

late int socialInsurance;

class SocialInsurance extends StatefulWidget {
  const SocialInsurance({super.key});

  @override
  State<SocialInsurance> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SocialInsurance> {
  // Declaring the social insurance variables

  bool insured30 = false;
  bool unInsured = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 20, 8, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xffe2e2f0), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          // Social Insurance entry
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
                  ? const TextStyle(color: Colors.black12)
                  : const TextStyle(color: Colors.black54),
              controller: insured30
                  ? TextEditingController(text: "10900")
                  : TextEditingController(),
              decoration: InputDecoration(
                labelText: 'Social Insurance Salary',
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
            ),
            // auto apply  30 %
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                "Auto 30% insurance exemption",
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

            // auto apply un insured

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
