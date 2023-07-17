import 'package:flutter/material.dart';

bool isGross = true;

class NetOrGross extends StatefulWidget {
  const NetOrGross({super.key});

  @override
  State<NetOrGross> createState() => _NetOrGrossState();
}

class _NetOrGrossState extends State<NetOrGross> {
  bool _switch1 = true;
  bool _switch2 = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Switch.adaptive(
              value: _switch1,
              onChanged: (newValue) async {
                setState(() {
                  _switch1 = !_switch1;
                  _switch2 = !_switch2;
                  isGross = true;
                });
              },
              activeColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
            child: Text(
              'Gross',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontFamily: 'Outfit',
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 15,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Switch.adaptive(
              value: _switch2,
              onChanged: (newValue) async {
                setState(() {
                  _switch1 = !_switch1;
                  _switch2 = !_switch2;
                  isGross = false;
                });
              },
              activeColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
            child: Text(
              'Net',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontFamily: 'Outfit',
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 15,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
