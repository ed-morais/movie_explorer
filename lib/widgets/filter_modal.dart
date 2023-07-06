import 'package:flutter/material.dart';


class FilterModal extends StatelessWidget {
  const FilterModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final configAppRate = Provider.of<ConfigAppProvider>(context, listen: true);
    // double ratingValue = configAppRate.rate;
    return AlertDialog(
      title: const Text(
        'Rate the app!',
        textAlign: TextAlign.center,
      ),

      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: TextStyle(
                color: Theme.of(context).primaryColor, fontSize: 15.0),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Theme.of(context).primaryColor)),
          onPressed: () {
            // configAppRate.changeRate(ratingValue);
            Navigator.of(context).pop();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
