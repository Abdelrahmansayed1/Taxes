import 'package:flutter/material.dart';
import 'package:taxes/Screens/result_screen.dart';
import 'package:taxes/Widgets/deductions.dart';
import 'package:taxes/Widgets/exemptions.dart';
import 'package:taxes/Widgets/net_or_gross.dart';
import 'package:taxes/Widgets/social_insurance.dart';
import 'package:taxes/Widgets/monthly_salary.dart';

class TaxesForm extends StatefulWidget {
  const TaxesForm({super.key});

  @override
  State<TaxesForm> createState() => _TaxesFormState();
}

class _TaxesFormState extends State<TaxesForm> {
  bool _isExpanded = false;
  void save() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ResultScreen(),
      ));
    }

    // print(monthlySalary);
    // print(exemptions);
    // print(deductions);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 20, 8, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Theme.of(context).colorScheme.background,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Starts From",
                          style: TextStyle(color: Colors.white54),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        DropdownButton(
                          value: "2023",
                          items: const [
                            DropdownMenuItem(
                              value: "2023",
                              child: Text(
                                "2023",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "2022",
                              child: Text(
                                "2022",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                    MonthlySalary(),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        icon: _isExpanded
                            ? const Icon(
                                Icons.expand_less,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.expand_more,
                                color: Colors.white,
                              )),
                    _isExpanded ? const NetOrGross() : Container(),
                    _isExpanded ? const Exemptions() : Container(),
                    _isExpanded ? const Deductions() : Container(),
                  ],
                ),
              ),
            ),
            const SocialInsurance(),
            ElevatedButton(
              onPressed: save,
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.primary)),
              child: Text(
                'Calculate',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
