void main(){
  print( 'Inicio del programa' );
  
  // then rescata el valor retornado despues del tiempo asignado y trata
  httpGet( 'https://hola-mundo.com/home' )
    .then( ( value ){ print( value ); 
      } )
    .catchError( ( err ) { print( 'Error: $err' ); // ATRAPA LA EXCEPCION Y MUESTRA EL ERROR
      } );
    
  print( 'Fin del programa' );
  
}


// Funcion Future
Future<String> httpGet( String url ){
  // RETARDO DE UN SEGUNDO
  return Future.delayed( const Duration( seconds: 1), () {
    // GENERAMOS UNA EXCEPCION
    throw 'Error en la peticion http';
    // return 'Respuesta de la peticion http';
  } ); 
}