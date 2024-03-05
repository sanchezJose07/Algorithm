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
    print( 'Exito: $value' );
  }on Exception catch( err ){ // ON ATRAPA EXCEPTIONS ESPECIFICAS
    print( 'Tenemos una Exception $err' );
  }catch( err ){
    print( 'OPPS!! algo terrible paso: $err' );
  }finally{ // FINALLY SE EJECUTA INDEPENDIENTEMENTE SI HUBO TRY O CATCH
    print( 'Fin del try y catch');
  }
   
  print( 'Fin del programa' );
  
}


// Funcion Asincrona, siempre es Future
Future<String> httpGet( String url ) async {
  // RETARDO DE UN SEGUNDO
  await Future.delayed( const Duration( seconds: 1 ) );
  // GENERAMOS UNA EXCEPCION
  throw Exception( 'No hay parametros en el URL' ); 
  //throw 'Error en la peticion http';
  // return 'Respuesta de la peticion http';
}

