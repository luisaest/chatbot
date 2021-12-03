import 'package:chatbot/mensajes_contener.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

class ListaMensajes extends StatelessWidget {
  final List<Map<String, dynamic>> messages;

  const ListaMensajes({Key? key, this.messages = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: messages.length,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      separatorBuilder: (_, i) => const SizedBox(height: 10),
      itemBuilder: (context, i){
        var obj = messages[messages.length -1 -i];
        return ContenedorMensajes(
          mensajes: obj['mensajes']!,
          MensajeUser: obj['MensajeUser'],
        );
      },
      reverse: true,
    );
  }
}