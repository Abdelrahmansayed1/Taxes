import 'package:flutter/material.dart';
import 'package:taxes/Widgets/deductions.dart';
import 'package:taxes/Widgets/exemptions.dart';
import 'package:taxes/Widgets/monthly_salary.dart';
import 'package:taxes/Widgets/result_card.dart';
import 'package:taxes/Widgets/result_items.dart';
import 'package:taxes/Widgets/social_insurance.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  double employeeSocialSecurity = socialInsurance * 0.11;
  double get taxes {
    double salaryAfterSocial = monthlySalary - employeeSocialSecurity;
    double taxBasis = salaryAfterSocial - exemptions;
    double taxAnnual = taxBasis * 12;
    double taxesSum = 0;
    if (taxAnnual < 600000) {
      if (taxAnnual <= 21000) {
        taxesSum += 0;
      } else if ((taxAnnual > 21000) && (taxAnnual <= 30000)) {
        taxesSum += (taxAnnual - 21000) * 0.025;
      } else if ((taxAnnual > 30000) && (taxAnnual <= 45000)) {
        taxesSum += (9000 * 0.025) + (taxAnnual - 30000) * 0.1;
      } else if ((taxAnnual > 45000) && (taxAnnual <= 60000)) {
        taxesSum += (9000 * 0.025) + (15000 * 0.1) + (taxAnnual - 45000) * 0.15;
      } else if ((taxAnnual > 60000) && (taxAnnual <= 200000)) {
        taxesSum += (9000 * 0.025) +
            (15000 * 0.1) +
            (15000 * 0.15) +
            (taxAnnual - 60000) * 0.2;
      } else if ((taxAnnual > 200000) && (taxAnnual <= 400000)) {
        taxesSum += (9000 * 0.025) +
            (15000 * 0.1) +
            (15000 * 0.15) +
            (140000 * 0.2) +
            (taxAnnual - 200000) * 0.225;
      } else {
        taxesSum += (9000 * 0.025) +
            (15000 * 0.1) +
            (15000 * 0.15) +
            (140000 * 0.2) +
            (200000 * 0.225) +
            (taxAnnual - 400000) * 0.25;
      }
    }
    double mothlyTax = taxesSum / 12;
    return mothlyTax;
  }

  double martyrsFund = monthlySalary * 0.0005;

  late double totalDeduction =
      deductions + employeeSocialSecurity + taxes + martyrsFund;

  late double netSalary = monthlySalary - totalDeduction;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(
            'Taxes EG',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontFamily: 'Outfit',
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 22,
                ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_outlined,
                  color: Theme.of(context).colorScheme.onPrimary,
                ))
          ],
          centerTitle: false,
          elevation: 2,
        ),
        body: ResultItems(
            employeeSocialSecurity: employeeSocialSecurity,
            taxes: taxes,
            martyrsFund: martyrsFund,
            totalDeduction: totalDeduction,
            netSalary: netSalary));
  }
}
