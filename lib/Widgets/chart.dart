import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:taxes/Widgets/monthly_salary.dart';
import 'dart:math';

class Pie extends StatefulWidget {
  final double netSalary;
  final double socialInsurance;
  final double deductions;
  final double taxes;
  const Pie(
      {super.key,
      required this.netSalary,
      required this.socialInsurance,
      required this.deductions,
      required this.taxes});

  @override
  State<Pie> createState() => _PieState();
}

class _PieState extends State<Pie> {
  late List<GDPData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: const Legend(
        isVisible: true,
      ),
      series: <CircularSeries>[
        PieSeries<GDPData, String>(
            dataSource: _chartData,
            xValueMapper: (GDPData data, _) => data.title,
            yValueMapper: (GDPData data, _) => roundDouble(data.gdp, 2),
            dataLabelSettings: const DataLabelSettings(
                isVisible: true, textStyle: TextStyle(color: Colors.black54)))
      ],
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData("Net Salary", widget.netSalary / monthlySalary),
      GDPData("Social Insurance", widget.socialInsurance / monthlySalary),
      GDPData("Deductions", widget.deductions / monthlySalary),
      GDPData("Taxes", widget.taxes / monthlySalary)
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.title, this.gdp);
  final String title;
  final double gdp;
}
