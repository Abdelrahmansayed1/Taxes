import 'package:flutter/material.dart';
import 'package:taxes/Widgets/chart.dart';
import 'package:taxes/Widgets/social_insurance.dart';
import '../Widgets/result_card.dart';
import 'package:taxes/Widgets/deductions.dart';
import 'package:taxes/Widgets/monthly_salary.dart';

class ResultItems extends StatelessWidget {
  final double employeeSocialSecurity;
  final double taxes;
  final double martyrsFund;
  final double totalDeduction;
  final double netSalary;
  const ResultItems(
      {super.key,
      required this.employeeSocialSecurity,
      required this.taxes,
      required this.martyrsFund,
      required this.totalDeduction,
      required this.netSalary});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ResultCard(
                title: "Gross Salary",
                amount: monthlySalary.toStringAsFixed(2),
                asset: "lib/assets/coin (2).png",
              ),
              ResultCard(
                title: "Deductions",
                amount: deductions.toStringAsFixed(2),
                asset: "lib/assets/coin (2).png",
              ),
              ResultCard(
                title: "Social Insurance",
                amount: employeeSocialSecurity.toStringAsFixed(2),
                asset: "lib/assets/coin (2).png",
              ),
              ResultCard(
                title: "Taxes",
                amount: taxes.toStringAsFixed(2),
                asset: "lib/assets/coin (2).png",
              ),
              ResultCard(
                title: "Martyrs' Fund",
                amount: martyrsFund.toStringAsFixed(2),
                asset: "lib/assets/coin (2).png",
              ),
              ResultCard(
                title: "Total deduction",
                amount: totalDeduction.toStringAsFixed(2),
                asset: "lib/assets/coin (2).png",
              ),
              ResultCard(
                title: "Net Salary",
                amount: netSalary.toStringAsFixed(2),
                asset: "lib/assets/coin (2).png",
              ),
              Pie(
                netSalary: netSalary,
                socialInsurance: employeeSocialSecurity,
                deductions: deductions.toDouble(),
                taxes: taxes,
              )
            ],
          ),
        ],
      ),
    );
  }
}
