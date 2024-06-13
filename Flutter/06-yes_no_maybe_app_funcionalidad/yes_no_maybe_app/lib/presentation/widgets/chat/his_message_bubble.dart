import 'package:flutter/material.dart';

class HisMessageBubble extends StatelessWidget {
  const HisMessageBubble({super.key});

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
          child: const Padding(
            padding: EdgeInsets.symmetric( horizontal: 20.0, vertical: 10 ),
            child: Text("Formula 1", style: TextStyle( color: Colors.white),),
          ),
        ),
        const SizedBox( height: 5,),
        _ImageBubble(),
        const SizedBox( height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //print( size );
    return ClipRRect(
        borderRadius: BorderRadius.circular( 20 ),
        child:  Image.network(
            'https://yesno.wtf/assets/no/10-d5ddf3f82134e781c1175614c0d2bab2.gif',
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

