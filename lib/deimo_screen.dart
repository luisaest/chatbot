import 'package:chatbot/messages_list.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

class DeimosAppHome extends StatefulWidget {
  DeimosAppHome({Key? key}) : super(key: key);

  @override
  _DeimosAppHomeState createState() => _DeimosAppHomeState();
}

class _DeimosAppHomeState extends State<DeimosAppHome> {

  final TextEditingController _controladorUser = TextEditingController();
  //Lista tipo Message
  List<Map<String, dynamic>> listmensajes =  [];
  //Función para manejar la lógica de los mensajes
  Future<void> enviarMensaje(String texto) async {
    if(texto.isEmpty) return;
    //Si hay texto entonces, actualiza el widget con el texto
    setState(() {
      Message MensajeUser = Message(text: DialogText(text: [texto]));
      addMensaje(MensajeUser, true);
    });

    QueryInput consul = QueryInput(text: TextInput(text: texto));

    DialogAuthCredentials credentials = await DialogAuthCredentials.fromFile('assets/dialog_flow_auth.json');

    final DialogFlowtter _dialogFlowtter = DialogFlowtter(credentials: credentials);

    DetectIntentResponse response = await _dialogFlowtter.detectIntent(queryInput: consul);

    if(response.message == null) return;

    setState(() {
      addMensaje(response.message!);
    });
  }

  void addMensaje(Message mensajes, [bool MensajeUser = false]){ listmensajes.add({
      'mensajes' : mensajes,
      'MensajeUser': MensajeUser
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink[300],
      title: Text('ChatbotLu', style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Expanded(child: ListaMensajes(messages: listmensajes,)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.pink,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    controller: _controladorUser,
                  )
                ),
                IconButton(
                  onPressed: (){
                    enviarMensaje(_controladorUser.text);
                    _controladorUser.clear();
                  }, 
                  icon: Icon(Icons.send), 
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}