void main(){
  
  // LLAMADA DE LA FUNCION STREAM
  emitNumbers().listen( ( value ) {
    print( 'Stream value: $value' );
  });
  
}

// FUNCION STREAM PERIODICA
Stream<int> emitNumbers(){
  // Esta funcion es periodica de 1s
  return Stream.periodic( const Duration( seconds: 1 ), ( value ){
    // Regresa el valor periodico
    return value;
  // Limita el STREAM a solo 5 ( 0 - 4 )
  }).take( 5 );
}