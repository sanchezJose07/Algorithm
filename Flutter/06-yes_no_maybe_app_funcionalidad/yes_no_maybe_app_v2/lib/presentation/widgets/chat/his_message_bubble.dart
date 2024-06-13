import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app_v2/domain/entities/message.dart';

class HisMessageBubble extends StatelessWidget {
  final Message message;  //INSTANCIAMOS UN MESSAGE DEL TIPO MESSAGE

  const HisMessageBubble({
    super.key,
    required this.message
  });


  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary,
              borderRadius: BorderRadius.circular( 20 )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 20.0, vertical: 10 ),
            child: Text( message.text, style: const TextStyle( color: Colors.white),),
          ),
        ),
        const SizedBox( height: 5,),
        _ImageBubble( message.imageUrl! ), //ENVIAMOS EL URL DEL URL DEL YESNOMAYBE
        const SizedBox( height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;      //url del yes no model

  const _ImageBubble( this.imageUrl);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //print( size );
    return ClipRRect(
        borderRadius: BorderRadius.circular( 20 ),
        child:  Image.network(
            imageUrl, //IMPRIMIMOS LA IMAGEN RECIBIDA POR EL YESNOMODEL
            width: size.width * 0.70,
            height: 150,
            fit: BoxFit.cover,
            loadingBuilder: ( context, child, loadingProgress){
                if( loadingProgress == null ) return child;
                return Container(
                  width: size.width * 0.70,
                  height: 150,
                  padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5 ),
                  child: const Text( "Checo Perez esta enviando un mensaje" ),
                );
            },
        ) );
  }
} 

