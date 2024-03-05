void main(){
  
  // CREACION DEL OBJETO
  final mySquare = Square( side: -10 );
  
  mySquare.side = -5;
  
  print( 'area: ${ mySquare.area }' );

}


// CLASE SQUARE
class Square{
  // ATRIBUTOS
  double _side;
  
  // CONSTRUCTORS CON ATRIBUTOS OBLIGATORIOS
  Square( { required double side } )
    // ASSERCIONES: OBLIGA A LOS ATRIBUTOS A CUMPLIR CONDICIONES
    : assert( side >= 0, 'side must be >= 0' ),
      _side = side;  
  
  //  GETTER
  double get area{
    return _side * _side;
  }
  
  // SETTER
  set side( double value ){
    print( 'setting new value $value' );
    if( value < 0 ) throw 'Value must be >= 0'; // VALORES MAYORES DE 0
    
    _side = value;
  }
  
  
  // METODO PARA EL CALCULO DEL AREA
  double calculateArea(){
    return _side * _side;
  }
  
}
