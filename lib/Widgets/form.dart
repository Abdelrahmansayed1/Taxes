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
  // Declaring the variables _isexpaded for expanded more icon
  // and save for calculate button

  bool _isExpanded = false;
  void save() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ResultScreen(),
      ));
    }
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
                  side: const BorderSide(color: Color(0xffe2e2f0), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Theme.of(context).colorScheme.background,
                child: Column(
                  children: [
                    // choosing the year of calculating the taxes

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       "Starts From",
                    //       style: TextStyle(
                    //           color:
                    //               Theme.of(context).colorScheme.onBackground),
                    //     ),
                    //     const SizedBox(
                    //       width: 5,
                    //     ),
                    //     DropdownButton(
                    //       value: "2023",
                    //       items: const [
                    //         DropdownMenuItem(
                    //           value: "2023",
                    //           child: Text(
                    //             "2023",
                    //             style: TextStyle(color: Colors.black45),
                    //           ),
                    //         ),
                    //         DropdownMenuItem(
                    //           value: "2022",
                    //           child: Text(
                    //             "2022",
                    //             style: TextStyle(color: Colors.black45),
                    //           ),
                    //         )
                    //       ],
                    //       onChanged: (value) {},
                    //     ),
                    //   ],
                    // ),
                    // Gross salary input
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Monthly Salary",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    const MonthlySalary(),

                    // Net or Gross input
                    const NetOrGross(),
                    IconButton(
                        style: ButtonStyle(
                            iconColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.primary)),
                        onPressed: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        icon: _isExpanded
                            ? Icon(
                                Icons.expand_less,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            : Icon(
                                Icons.expand_more,
                                color: Theme.of(context).colorScheme.primary,
                              )),
                    _isExpanded ? const Exemptions() : Container(),
                    _isExpanded ? const Deductions() : Container(),
                  ],
                ),
              ),
            ),
            // social insurance card

            const SocialInsurance(),
            const SizedBox(
              height: 20,
            ),

            //The calculate button

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
