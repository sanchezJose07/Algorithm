void main (){
  
  final numbers = [1,2,2,3,3,3,4,4,5,6,7,7,8,9,9,10]; //LIST
  
  print( 'List original: $numbers' );
  print( 'Legth ${ numbers.length }' );
  print( 'Index 0; ${ numbers[0] }');
  print( 'First: ${ numbers.first }' );
  print( 'Reversed: ${ numbers.reversed }' ); //ITERABLE
  
  final reversedNumbers = numbers.reversed; //ITERABLE
  print( 'Iterable: $reversedNumbers' );      
  print( 'List: ${ reversedNumbers.toList() }' ); //LIST
  print( 'Set: ${ reversedNumbers.toSet() }' ); // SET
   
  final numbersGreaterThan5 = numbers.where( ( int num ) { 
      return num > 5;   // true
  });
  
  print( '>5 iterable: $numbersGreaterThan5' );
  print( '>5 Set: ${ numbersGreaterThan5.toSet() }' );
  
  
}