import 'package:flutter/material.dart';


class InfoModal extends StatelessWidget {
  const InfoModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final configAppRate = Provider.of<ConfigAppProvider>(context, listen: true);
    // double ratingValue = configAppRate.rate;
    return AlertDialog(
      title: const Text(
        'Informações',
        textAlign: TextAlign.center,
      ),
      content: const SizedBox(
        height: 220,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: Edilson Morais Brito'),
              Text('Email: edilsonmoraisbrito@aluno.uespi'),
              Text('Registration code: 1078234'),
              Divider(color: Colors.green),
              Text('Francisco Mendes Magalhães'),
              Text('Email: fmmagalhaesfilho@aluno.uespi'),
              Text('Registration code: 1078256'),
              Divider(color: Colors.green),
              Text('Name: Tiago da Silva Carvalho'),
              Text('Email: tdasilvacarvalho@aluno.uespi'),
              Text('Registration code: 1078249')
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Colors.green)),
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],      
    );
  }
}
