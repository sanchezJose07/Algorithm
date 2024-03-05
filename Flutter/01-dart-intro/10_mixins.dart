abstract class Animal{}

abstract class Mamifero extends Animal{}
abstract class Ave extends Animal{}
abstract class Pez extends Animal{}


//MIXINS
abstract class Volador{
  void volar() => print( 'Estoy volando!' );
}
abstract class Caminante{
  void caminar() => print( 'Estoy caminador!' );
}
abstract class Nadador{
  void nadar() => print( 'Estoy nadando!' );
}


class Delfin extends Mamifero with Nadador {}
class Murcielago extends Mamifero with Volardor, Caminante{}  
class Gato extends Mamifero with Caminante{}

class Paloma extends Ave with Volador, Caminante{}
class Pato extends Ave with Volador, Nadador, Caminante{}

class Tiburon extends Pez with Nadador{}
class PezVolador extends Pez with Volador, Nadador{}






