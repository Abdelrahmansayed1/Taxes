import 'package:flutter/material.dart';
import 'package:taxes/Widgets/form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      // Appbar and it's component

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
                Icons.more_horiz,
                color: Theme.of(context).colorScheme.onPrimary,
              ))
        ],
        centerTitle: false,
        elevation: 0,
      ),

      // Going to taxes form that validate user input

      body: const TaxesForm(),
    );
  }
}
