import 'package:flutter/material.dart';
import 'package:taxes/Widgets/chart.dart';
import 'package:taxes/Widgets/net_or_gross.dart';
import '../Widgets/result_card.dart';
import 'package:taxes/Widgets/deductions.dart';
import 'package:taxes/Widgets/monthly_salary.dart';

class ResultItems extends StatelessWidget {
  final double employeeSocialSecurity;
  final double taxes;
  final double martyrsFund;
  final double totalDeduction;
  final double netSalary;
  final double grossUp;
  const ResultItems(
      {super.key,
      required this.employeeSocialSecurity,
      required this.taxes,
      required this.martyrsFund,
      required this.totalDeduction,
      required this.netSalary,
      required this.grossUp});

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
              isGross
                  ? ResultCard(
                      title: "Gross Salary",
                      amount: monthlySalary.toStringAsFixed(2),
                      asset: "lib/assets/wage.png",
                    )
                  : ResultCard(
                      title: "Gross Salary",
                      amount: (monthlySalary + grossUp).toStringAsFixed(2),
                      asset: "lib/assets/wage.png",
                    ),
              isGross
                  ? Container()
                  : ResultCard(
                      title: "Grossing Up",
                      amount: grossUp.toStringAsFixed(2),
                      asset: "lib/assets/trend.png",
                    ),
              ResultCard(
                title: "Deductions",
                amount: deductions.toStringAsFixed(2),
                asset: "lib/assets/deduction.png",
              ),
              ResultCard(
                title: "Social Insurance",
                amount: employeeSocialSecurity.toStringAsFixed(2),
                asset: "lib/assets/social-security.png",
              ),
              ResultCard(
                title: "Taxes",
                amount: taxes.toStringAsFixed(2),
                asset: "lib/assets/taxes.png",
              ),
              ResultCard(
                title: "Martyrs' Fund",
                amount: martyrsFund.toStringAsFixed(2),
                asset: "lib/assets/donation.png",
              ),
              isGross
                  ? ResultCard(
                      title: "Total deduction",
                      amount: totalDeduction.toStringAsFixed(2),
                      asset: "lib/assets/cost.png",
                    )
                  : ResultCard(
                      title: "Total deduction",
                      amount: grossUp.toStringAsFixed(2),
                      asset: "lib/assets/cost.png",
                    ),
              isGross
                  ? ResultCard(
                      title: "Net Salary",
                      amount: netSalary.toStringAsFixed(2),
                      asset: "lib/assets/wage.png",
                    )
                  : ResultCard(
                      title: "Net Salary",
                      amount: (monthlySalary).toStringAsFixed(2),
                      asset: "lib/assets/wage.png",
                    ),
              isGross
                  ? Pie(
                      netSalary: netSalary,
                      socialInsurance: employeeSocialSecurity,
                      deductions: deductions.toDouble(),
                      taxes: taxes,
                    )
                  : Container()
            ],
          ),
        ],
      ),
    );
  }
}
