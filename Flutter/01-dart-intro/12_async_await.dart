void main() async {
  print( 'Inicio del programa' );
  
  // then rescata el valor retornado despues del tiempo asignado y trata
  // httpGet( 'https://hola-mundo.com/home' )
  //  .then( ( value ){ print( value ); 
  //    } )
  //  .catchError( ( err ) { print( 'Error: $err' ); // ATRAPA LA EXCEPCION Y MUESTRA EL ERROR
  //    } );
  
  // LAS LINEAS 5-9 ES IGUAL A 12-17
  try{
    final value = await httpGet( 'https://hola-mundo.com/home' );
    print( value );
  }catch( err ){
    print( 'Tenemos un error: $err' );
  }
   
  print( 'Fin del programa' );
  
}


// Funcion Asincrona, siempre es Future
Future<String> httpGet( String url ) async {
  // RETARDO DE UN SEGUNDO
  await Future.delayed( const Duration( seconds: 1 ) );
  // GENERAMOS UNA EXCEPCION
  throw 'Error en la peticion http';
  // return 'Respuesta de la peticion http';
}

