void main(){
  
  final Map<String, dynamic> rawJson = { 
    'name': 'Tony Stark', 
    'power': 'Money', 
    'isAlive': false 
    };
  
  // 02
  final Hero iroman = Hero.fromJason( rawJson );  
  
  // 01 
  // final Hero iroman = Hero ( name: 'Tony Stark', power: 'Money', isAlive: false );
  
  print( iroman );
  
}

class Hero{
  String name;
  String power;
  bool isAlive;
  
  Hero ( { required this.name, required this.power, required this.isAlive } );
  
  Hero.fromJason( Map<String,dynamic> json )
    : name = json['name'] ?? 'No name found',
      power = json['power'] ?? 'No power found',
      isAlive = json['isAlive'] ?? 'No isAlive found';
  
  @override
  String toString(){ 
    return 'Name: $name, Power: $power, isAlive ${ isAlive ? 'YES':'Nope'}';
  } 
  
}