import 'package:flutter/material.dart';

class AssignedSexButton extends StatelessWidget {
  const AssignedSexButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: DropdownButtonFormField(
            itemHeight: 50.0,
            isExpanded: true,
            borderRadius: BorderRadius.circular(20),
            decoration: InputDecoration(
              hintText: "assigned sex",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
            ),
            items: [
              DropdownMenuItem(
                enabled: true,
                child: Text(
                  'Male',
                ),
                value: 1,
              ),
              DropdownMenuItem(
                enabled: true,
                child: Text('Female'),
                value: 2,
              ),
            ].toList(),
            onChanged: (dynamic value) {},
            value: 1,
          ),
        ),
      ],
    );
  }
}
