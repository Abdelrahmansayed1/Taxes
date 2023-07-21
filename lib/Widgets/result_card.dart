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
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFe2e2f0),
            ),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                asset,
                height: 40,
                fit: BoxFit.fill,
              ),
            ),
            title: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black54),
            ),
            trailing: Text(
              amount,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black54),
            ),
          ),
        ));
  }
}
