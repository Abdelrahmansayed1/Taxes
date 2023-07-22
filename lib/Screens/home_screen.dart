import 'package:flutter/material.dart';
import 'package:taxes/Widgets/form.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _launchMap() async {
    const url = "https://interface-tech.net/";
    var uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      // Appbar and it's component

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'lib/assets/45ae405a-e7e0-4f32-9d3d-c74e03f7e713.png',
              fit: BoxFit.contain,
              height: 18,
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Text(
                  'Egypt Taxes',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ))
          ],
        ),
        actions: [
          IconButton(
              onPressed: _launchMap,
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
