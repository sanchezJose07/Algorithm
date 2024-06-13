import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_maybe_app_v2/domain/entities/message.dart';
import 'package:yes_no_maybe_app_v2/presentation/widgets/chat/his_message_bubble.dart';
import 'package:yes_no_maybe_app_v2/presentation/widgets/shared/message_field_box.dart';
import '../../provider/chat_provider.dart';
import '../../widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _ChatBar(),
      body: _ChatView(),
    );
  }
}

class _ChatBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Size get preferredSize => const Size.fromHeight( kToolbarHeight );
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(4.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://i.pinimg.com/736x/07/4a/10/074a102d64bae755d750775a20401089.jpg"
          ),
        ),
      ),
      title: const Text( "Checo Perez" ),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final chatProvider =  context.watch<ChatProvider>();

    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 10 ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: ( context, index ){
                    final message = chatProvider.messageList[index];
                    return ( message.fromWho == FromWho.his )
                      ? HisMessageBubble( message: message )
                      : MyMessageBubble( message: message );
                  }
                ),
              ),
              MessegeFielBox(
                onValue: (value) => chatProvider.sendMessage(value), // COLUMNA DE MENSAJES, Y ACTUALIZACION DE ESTE
              )
            ],
          ),
        )
    );
  }
}
