void main(){
  
  // LLAMADA DE LA FUNCION DE IMITIR UN NUMERO
  emitNumber().listen( ( int value ) {
    // IMPRIMIMOS EL VALOR EMITIDO
    print( 'Stream value: $value');
    
  }); 
}

// FUNCION STREAM CON ASINC*
Stream<int> emitNumber() async*{
  // NUMEROS A EMITIR
  final valuesToEmit = [1,2,3,4,5];
  
  for( int i in valuesToEmit ){
    // LLAMA EL FUTURE CON UN RETARDO DE 1S
    await Future.delayed( const Duration( seconds: 1 ));
    // VALOR ENTREGADO 
    yield i;
  }
}