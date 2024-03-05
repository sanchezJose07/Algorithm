void main(){
  
  print( greetEveryone() );
  
  print( 'Suma: ${ addTwoNumbers( 32, 18 ) }');
  
  print( addTwoNumbersOptional( 4 ) ); 
  
  print( greetPerson( name: 'JOSE' ) );
  
}

String greetEveryone() => 'Hello everyone!'; // FUNCION STRING

int addTwoNumbers( int a, int b ) => a + b; // RETORNO DE FLECHA

// ESTA FUNCION NOS PERMITE, ENVIAR PARAMETROS DE FORMA OPCIONAL
int addTwoNumbersOptional( int a, [ int b = 0 ] ){  // FUNCION CON PARAMETROS OPCIONALES
  return a + b;
}

String greetPerson( { required String name, String message = 'Hola,' } ){
  return '$message $name';
}

