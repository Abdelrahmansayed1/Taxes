import 'package:flutter/material.dart';
import 'package:taxes/Widgets/deductions.dart';
import 'package:taxes/Widgets/exemptions.dart';
import 'package:taxes/Widgets/monthly_salary.dart';
import 'package:taxes/Widgets/net_or_gross.dart';
import 'package:taxes/Widgets/result_items.dart';
import 'package:taxes/Widgets/social_insurance.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Future<void> _launchMap() async {
    const url = "https://interface-tech.net";
    var uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch';
    }
  }

  // Calculating the Tax slices
  double employeeSocialSecurity =
      (monthlySalary / 1.3 > 10900) ? 1199 : (monthlySalary / 1.3) * 0.11;
  double get taxes {
    double salaryAfterSocial = monthlySalary - employeeSocialSecurity;
    double taxBasis = salaryAfterSocial - 1250 - exemptions;
    double taxAnnual = taxBasis * 12;
    double taxesSum = 0;
    if (taxAnnual <= 600000) {
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
    } else if (taxAnnual > 600000 && taxAnnual <= 700000) {
      if (taxAnnual <= 30000) {
        taxesSum += taxAnnual * 0.025;
      } else if ((taxAnnual > 30000) && (taxAnnual <= 45000)) {
        taxesSum += (30000) * 0.025 + (taxAnnual - 30000) * 0.1;
      } else if ((taxAnnual > 450000) && (taxAnnual <= 60000)) {
        taxesSum +=
            (30000) * 0.025 + (15000) * 0.1 + (taxAnnual - 45000) * 0.15;
      } else if ((taxAnnual > 60000) && (taxAnnual <= 200000)) {
        taxesSum += (30000) * 0.025 +
            (15000) * 0.1 +
            (15000) * 0.15 +
            (taxAnnual - 60000) * 0.2;
      } else if ((taxAnnual > 200000) && (taxAnnual <= 400000)) {
        taxesSum += (30000) * 0.025 +
            (15000) * 0.1 +
            (15000) * 0.15 +
            (140000) * 0.2 +
            (taxAnnual - 200000) * 0.225;
      } else {
        taxesSum += (30000) * 0.025 +
            (15000) * 0.1 +
            (15000) * 0.15 +
            (140000) * 0.2 +
            200000 * 0.225 +
            (taxAnnual - 400000) * 0.25;
      }
    } else if (taxAnnual > 700000 && taxAnnual <= 800000) {
      if (taxAnnual <= 45000) {
        taxesSum += taxAnnual * 0.1;
      } else if ((taxAnnual > 45000) && (taxAnnual <= 60000)) {
        taxesSum += (45000) * 0.1 + (taxAnnual - 45000) * 0.15;
      } else if ((taxAnnual > 60000) && (taxAnnual <= 200000)) {
        taxesSum += (45000) * 0.1 + (15000) * 0.15 + (taxAnnual - 60000) * 0.2;
      } else if ((taxAnnual > 200000) && (taxAnnual <= 400000)) {
        taxesSum += (45000) * 0.1 +
            (15000) * 0.15 +
            (140000) * 0.2 +
            (taxAnnual - 200000) * 0.225;
      } else {
        taxesSum += (45000) * 0.1 +
            (15000) * 0.15 +
            (140000) * 0.2 +
            (200000) * 0.225 +
            (taxAnnual - 400000) * 0.25;
      }
    } else if (taxAnnual > 800000 && taxAnnual < 900000) {
      if (taxAnnual <= 60000) {
        taxesSum += taxAnnual * 0.15;
      } else if ((taxAnnual > 60000) && (taxAnnual <= 200000)) {
        taxesSum += (60000) * 0.15 + (taxAnnual - 60000) * 0.2;
      } else if ((taxAnnual > 200000) && (taxAnnual <= 400000)) {
        taxesSum +=
            (60000) * 0.15 + (140000) * 0.2 + (taxAnnual - 200000) * 0.225;
      } else {
        taxesSum += (60000) * 0.15 +
            (140000) * 0.2 +
            (200000) * 0.225 +
            (taxAnnual - 400000) * 0.25;
      }
    } else if (taxAnnual > 900000 && taxAnnual <= 1200000) {
      if (taxAnnual <= 200000) {
        taxesSum += taxAnnual * 0.2;
      } else if ((taxAnnual > 200000) && (taxAnnual <= 400000)) {
        taxesSum += (200000) * 0.2 + (taxAnnual - 200000) * 0.225;
      } else {
        taxesSum +=
            (200000) * 0.2 + (200000) * 0.225 + (taxAnnual - 400000) * 0.25;
      }
    } else {
      if (taxAnnual <= 1200000) {
        taxesSum += taxAnnual * 0.25;
      } else {
        taxesSum += 1200000 * 0.25 + (taxAnnual - 1200000) * 0.275;
      }
    }
    double mothlyTax = taxesSum / 12;
    return mothlyTax;
  }

  double martyrsFund = monthlySalary * 0.0005;

  late double totalDeduction =
      deductions + employeeSocialSecurity + taxes + martyrsFund;

  late double netSalary = monthlySalary - totalDeduction;

  double get taxGrossUp {
    double taxAnnual = ((monthlySalary + martyrsFund) * 12) - 15000;
    double grossingUp = 0;
    if (taxAnnual <= 21000) {
      grossingUp += 0;
    } else if (taxAnnual > 21000 && taxAnnual <= 29775) {
      grossingUp += (taxAnnual * 100 / 97.5) - 525 - 13.461538461539;
    } else if (taxAnnual > 29775 && taxAnnual <= 43275) {
      grossingUp += (taxAnnual * 100 / 90) - 2775 - 308.333333333336;
    } else if (taxAnnual > 43275 && taxAnnual <= 56025) {
      grossingUp += (taxAnnual * 100 / 85) - 5025 - 886.76470588235;
    } else if (taxAnnual > 56025 && taxAnnual <= 168025) {
      grossingUp += (taxAnnual * 100 / 80) - 8025 - 2006.25;
    } else if (taxAnnual > 168025 && taxAnnual <= 323025) {
      grossingUp += (taxAnnual * 100 / 77.5) - 13025 - 3781.45161290321;
    } else if (taxAnnual > 323025 && taxAnnual <= 473025) {
      grossingUp += (taxAnnual * 100 / 75) - 23025 - 7675;
    } else if (taxAnnual > 473025 && taxAnnual <= 547500) {
      grossingUp += (taxAnnual * 100 / 75) - 22500 - 7500;
    } else if (taxAnnual > 547500 && taxAnnual <= 620250) {
      grossingUp += (taxAnnual * 100 / 75) - 20250 - 6750;
    } else if (taxAnnual > 620250 && taxAnnual <= 693000) {
      grossingUp += (taxAnnual * 100 / 75) - 18000 - 6000;
    } else if (taxAnnual > 693000) {
      grossingUp += (taxAnnual * 100 / 75) - 15000 - 5000;
    }
    double grossing = (grossingUp - taxAnnual) / 12;
    if (monthlySalary <= 3000) {
      grossing = 0;
    }

    return grossing;
  }

  late double martyrsFund2 =
      (monthlySalary + taxGrossUp + employeeSocialSecurity) * 0.0005;

  late double grossingUpTaxAndSocial =
      (taxGrossUp + employeeSocialSecurity) + martyrsFund2;

  // late double martyrsFund2 = 0.0005 * grossingUpTaxAndSocial;

  @override
  Widget build(BuildContext context) {
    // Screen of result scaaffold
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(
            'Egypt Taxes',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          actions: [
            IconButton(
                onPressed: _launchMap,
                icon: Icon(
                  Icons.input,
                  color: Theme.of(context).colorScheme.primary,
                ))
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: isGross
            ? ResultItems(
                employeeSocialSecurity: employeeSocialSecurity,
                taxes: taxes,
                martyrsFund: martyrsFund,
                totalDeduction: totalDeduction,
                netSalary: netSalary,
                grossUp: 0,
              )
            : ResultItems(
                employeeSocialSecurity: employeeSocialSecurity,
                taxes: taxGrossUp,
                martyrsFund: martyrsFund2,
                totalDeduction: totalDeduction,
                netSalary: netSalary,
                grossUp: grossingUpTaxAndSocial,
              ));
  }
}
