void main(){
  
  final windPlant = WindPlant( initialEnergy: 100 );
  final nuclearPlant = NuclearPlant( energyLeft: 1000 );
  
  print( windPlant );
  print( 'wind: ${ chargePhone( windPlant ) }' );
  print( 'Nuclear: ${ chargePhone( nuclearPlant ) }' );
    
}


// EJEMPLO DE LAS VENTAJAS DE LA CLASE ABSTRACTA EN UNA FUNCION 
double chargePhone( EnergyPlant plant ){
  if( plant.energyLeft < 10 ){
    throw Exception( 'Not enough energy' );
  }
  
  return plant.energyLeft - 10;
}


// Enumeracion personalizada a cumplir
enum PlantType{ nuclear, wind, water }

// CLASE ABSTRACTA 
abstract class EnergyPlant{
  double energyLeft;
  final PlantType type; // nuclear. wind, water
  
  // CONSTRUCTOR
  EnergyPlant( { required this.energyLeft, required this.type } );
  
  void consumeEnergy( double amount );
 
}

// EXTEND
class WindPlant extends EnergyPlant{
  // CONSTRUCTOR
  WindPlant( { required double initialEnergy } )
    : super( energyLeft: initialEnergy, type: PlantType.wind );
  
  // IMPLEMENTACION DEL METODO DE LA CLASE ABSTRACTA
  @override
  void consumeEnergy( double amount ){
    energyLeft -= amount;
  }
 
}

// IMPLEMENTS
class NuclearPlant implements EnergyPlant{
  @override 
  double energyLeft;
  @override 
  final PlantType type = PlantType.nuclear;
  
  // CONSTRUCTOR
  NuclearPlant( { required this.energyLeft } );
  
  @override 
  void consumeEnergy( double amount ){
    energyLeft -= ( amount * 0.5 );
  }
}




























