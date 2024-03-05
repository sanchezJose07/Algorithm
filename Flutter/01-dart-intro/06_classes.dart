void main(){
  
  final Hero wolverine = Hero( name: 'Logan', power: 'Regeneracion' );
  
  print( wolverine );
  print( wolverine.name );
  print( wolverine.power );

}



class Hero{ 
  String name;
  String power;
  
  // CONTRUCTOR CON PARAMETROS 
  Hero( { required this.name, this.power = 'Sin poder' } );
  
  // CONSTRUCTOR CON PARAMETROS CONTROLADOS
  //Hero( String pName, String pPower )
  //  : name = pName,
  //    power = pPower ;
  
  String toString(){
    return 'Nombre: $name - Poder: $power';
  }
  
  
}
