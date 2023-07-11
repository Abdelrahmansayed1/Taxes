import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String asset;
  final String title;
  final String amount;

  const ResultCard(
      {super.key,
      required this.title,
      required this.asset,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFFD2D7E3),
            ),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                asset,
                height: 50,
                fit: BoxFit.fill,
              ),
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: Text(
              "$amount",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ));
  }
}
