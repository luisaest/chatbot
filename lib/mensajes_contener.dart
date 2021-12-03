import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

class ContenedorMensajes extends StatelessWidget {
  final Message? mensajes;
  final bool MensajeUser;
  const ContenedorMensajes({Key? key,
  
  @required this.mensajes,
  this.MensajeUser = false,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MensajeUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 250),
          child: Container(
            decoration: BoxDecoration(
              color: MensajeUser ? Colors.purple[400]: Colors.blueAccent[700],
              borderRadius: BorderRadius.circular(20)
            ),
            padding: const EdgeInsets.all(10),
            child: Text(mensajes?.text?.text![0]??'',
            style: TextStyle(color: Colors.white), ), 
          ),
        )
      ],
    );
  }
}