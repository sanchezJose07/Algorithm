import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app_v2/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_maybe_app_v2/domain/entities/message.dart';


class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController(); //ATRIBUTO PARA CONTROLAR EL SCROL
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer(); // VARIABLE PARA DETECTAR UNA PREGUNTA

  List<Message> messageList = [
    Message(text: "Hola checo!", fromWho: FromWho.me ),
    Message(text: "Que tal te ha ido compa?", fromWho: FromWho.me ),
  ];

  Future<void> sendMessage( String text ) async{
    if( text.isEmpty ) return; //SI NO SE HA ESCRIBIDO NINGUN MENSAJE NO ENVIAR NADA

    final newMessage = Message( text: text, fromWho: FromWho.me ); // CREAMOS EL OBJETO
    messageList.add( newMessage );  // AGREGAMOS EL MENSAJE A LA LISTA DE MENSAJES

    if( text.endsWith('?') ){ //SE CONDICIONA LA RESPUESTA PARA QUE SE DETECTE SI SE ENVIO UN SIGNO DE INTERROGACION
      hisReplay();
    }

    notifyListeners(); //LE DECIMOS A FLUTTER QUE EL PROVIDER CAMBIO, NOTIFICA A TODOS LOS QUE ESPERAN EL CAMBIOB
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async{ //FUNCION PARA SCROL AUTOMATICO AL ENVIAR UN MENSAJE
    await Future.delayed(const Duration( milliseconds: 100 ) ); // RETARDO PARA EMPEZAR LA ANIMACION

    chatScrollController.animateTo( //ANIMACION
        chatScrollController.position.maxScrollExtent,
        duration: const Duration( milliseconds: 300 ),
        curve: Curves.easeIn                            //TIPO DE ANIMACION
    );
  }

  Future<void> hisReplay() async{ //METODO PARA GENERAR LA RESPUESTA  EN TIEMPO REAL
    final hisMessage = await getYesNoAnswer.getAnswer(); //LLAMAMOS EL METODO QUE ESTA EN LA CLASE
    messageList.add(hisMessage);  //AGREGAR EL MENSAJE A LA LISTA DE SUS MENSAJES
    notifyListeners();    //NOTIFICAR QUE EL CAMBIO SE HA REALIZADO EN LA APLICACION

    moveScrollToBottom(); //HACER SCROL SI EL MENSAJE SUPERA EL LIMITE DE LA PANTALLA
  }
}