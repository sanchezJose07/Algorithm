# <img src=img/logo_flutter.png alt="Hola_Mundo_flutter_01" style="width:100px;height:100px;"> Sección 4: Flutter - Primeros pasos                                    

``` 
Autor: Jose Guadalupe Guerrero Sanchez
Curso: Flutter - Movil: De cero a experto
Instructor: Fernado Herrera
```

---

## Resumen

En esta sección se desarrollara una aplicación móvil desde cero, aplicando los conocimientos del leguaje de programación de dart en flutter. 

### Palabras claves ###

widgets

---

## I. Creando el primer Widget

Para todo programa de flutter, iniciaremos con la función principal main(), donde correremos nuestro widget.

```dart
void main(){
  runApp( MyApp() );
}
```

Ahora creamos nuestro widget personalizado llamado MyApp(), donde extenderemos de la clase StatelessWidget*. Creamos un WidgetBuild, donde creamos un widget de texto centrado con la etiqueta de "Hola Mundo".

```dart
// Creacion de nuestro widget
class MyApp extends StatelessWidget{
  @override
  Widget build( BuildContext context ) {
    return MaterialApp(
      home: Center( child: Text( "Hola Mundo" ) ),
    );
  }
}
```

A continuación, tenemos la aplicación ejecutada en un dispositivo android.

RESULTADO:

<img src=img/img_01.png alt="Hola_Mundo_flutter_01" style="width:240px;height:427px;">

Ahora utilizaremos el widget Stateful Widget*, el cual nos ayuda a implementar un diseño básico de material. Para esto modificaremos nuestro código anterior, para agregar este widget como se muestra a continuación:

```dart
class MyApp extends StatelessWidget{
  @override
  Widget build( BuildContext context ) {
    return MaterialApp(
      home: Scaffold(								//<---
        body: Center( child: Text( "Hola Mundo" ) ),   //<---
      )
    );
  }
}
```

donde tenemos que el Scaffold tiene la propiedad home y el body del Scaffold el texto. Con lo cual tenemos el siguiente resultado:

RESULTADO:

<img src=img/img_02.png alt="Hola_Mundo_flutter_02" style="width:240px;height:427px;">



Resolviendo los warnings del widget

- Para nuestro widget crearemos un key constructor, el cual es la inicializacion del StatelessWidget

- Al retorno de nuestra aplicación, la convertimos en constante para que el widget se cree ya estructurado, no se cree de parte por parte.

- Para quitar la etiqueta de debug, pasaremos el ModeBanner a falso 

```dart
class MyApp extends StatelessWidget{
  const MyApp({super.key});               //<---

  @override
  Widget build( BuildContext context ) {  
    return const MaterialApp(			 //<---
      debugShowCheckedModeBanner: false,  //<---
      home: Scaffold(
        body: Center( child: Text( "Hola Mundo" ) ),
      )
    );
  }
}
```

RESULTADO:

<img src=img/img_03.png alt="Hola_Mundo_flutter_03" style="width:240px;height:427px;">



---

## II. Estructura de directorios y counter screen

Para la estructura del directorios, crearemos una carpeta en nuestro lib, el cual nos permitirá guardar todo lo propiamente de flutter, como widget personalizados y creamos una carpeta para las pantallas. y como tendremos varios contadores es conveniente crear un directorio para los contadores.

- /lib/presentation
- /lib/presentation/screens
- /lib/presentation/screens

En este directorio crearemos un widget personalizado basado en el que se hizo anteriormente este widget tiene el nombre counter_screen.dart, a continuacion tenemos el contenido de este

```dart
import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget{
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center( child: Text( "Counter Screen" ) ),
        );
  }
}
```

ahora mandamos llamar este código en nuestro widget principal, importando este directorio.

```dart
import 'package:hello_world_app/presentation/screens/counter/counter_screen.dart';
...
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build( BuildContext context ) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen()				//<---
    );
  }
}
```

con lo cual se obtiene el siguiente resultado en el movil

RESULTADO

<img src=img/img_04.png alt="Hola_Mundo_flutter_04" style="width:240px;height:427px;">

Ahora modificaremos el widget partiendo de un Scaffold centrado Center, con un hijo column, ahora bien, dentro de este child crearemos dos widgets de texto para implementarlos, en este coso utilizamos los childrens y centramos estos widgets con mainAxisAlignment.

```dart
class CounterScreen extends StatelessWidget{
  const CounterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(                               //<---
      body: Center(                                      //<---
          child: Column(                                 //<---
            mainAxisAlignment: MainAxisAlignment.center, //<---
            children: [                                  //<---
              Text('10'),                                //<---
              Text('Clicks')                             //<---
            ],
          ),
      ),
    );
  }

}
```

con la modificación anterior tenemos el siguiente resultado.

RESULTADO:

<img src=img/img_05.png alt="Hola_Mundo_flutter_05" style="width:240px;height:427px;">



En el siguiente paso colocaremos el botón flotante en la aplicación de flutter. Para ello tenemos los siguientes pasos.

- Creamos un floatingActionButton el cual creara el boton en nuestra aplicacion.

  ```dart
  floatingActionButton: FloatingActionButton();
  ```

- Y ahora declaramos la propiedad onPressed, la cual nos permite presionar el botón agregado.

  ```dart
  onPressed(){},
  ```

- Finalmente definimos el icono que encontraremos dentro del widget, como tendremos un contador de +1 en la aplicación, agregamos el icono plus_one

  ```dart
  child: const Icon(Icons.plus_one),
  ```

- Donde tenemos el siguiente resultado.

  ```dart
   @override
    Widget build(BuildContext context) {
      return  Scaffold(
        body: const Center(...),
        floatingActionButton: FloatingActionButton( //<---
            onPressed: (){						//<---
            },                                      //<---
            child: const Icon(Icons.plus_one),      //<---
        ),
      );
    }
  ```

  RESULTADO:

  <img src=img/img_06.png alt="Hola_Mundo_flutter_06" style="width:240px;height:427px;">

  

  

  Ahora definimos el estilo de los textos definidos.

  - Definimos el estilo y el tamaño de los textos.
  
    ```dart
     Text('10', style: TextStyle( fontSize: 160, fontWeight: FontWeight.w100)),
     Text('Clicks', style: TextStyle( fontSize: 25 ))
    ```

  - Donde tenemos el siguiente codigo
  
    ```dart
    body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('10', style: TextStyle( fontSize: 160, fontWeight: FontWeight.w100)),//<---
                  Text('Clicks', style: TextStyle( fontSize: 25 ))						  //<---
                ],
              ),
          ),
    ```

    RESULTADO:

    <img src=img/img_07.png alt="Hola_Mundo_flutter_07" style="width:240px;height:427px;">
  
    
    
    Ahora agregaremos una barra superior, la cual tendrá un texto. Para realizar esto, tenemos que agregar el AppBar a nuestra aplicación 
    
    ```dart
    ...
    return  Scaffold(
          appBar: AppBar(                               //<---
            title: const Text( 'Counter Screen' ),      //<---
          ),										//<---
          body: const Center(
    ...
    ```
    
    RESULTADO:
    
    <img src=img/img_08.png alt="Hola_Mundo_flutter_08" style="width:240px;height:427px;">
    
    Ahora cambiaremos el tema de nuestra aplicación, para ello nos dirigimos a nuestro archivo main, donde a nuestra MaterialApp le agregaremos el tema material 3.
    
    ```dart
    ...  
    @override
      Widget build( BuildContext context ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(					//<---
            useMaterial3: true                //<---
          ),                                  //<---
          home: const CounterScreen()
        );
      }
    ...
    ```
    
    RESULTADO:
    
    <img src=img/img_09.png alt="Hola_Mundo_flutter_09" style="width:240px;height:427px;">
    
    Agregamos una paleta de colores, para ello colocamos el siguiente comando
    
    ```dart
    ...
    theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.red     //<--- 
    ),
    ...
    ```
    
    Esto lo que hace, es que a partir del color que introdujiste, en este caso el rojo, convierte toda la paleta de colores de la aplicación en base a esta.
    
    RESULTADO: 
    
    <img src=img/img_10.png alt="Hola_Mundo_flutter_10" style="width:240px;height:427px;">

En esta ocasión veremos al llamado ESTADO DE MIS WIDGETS, la cual nos ayudara a modificar el funcionamiento de nuestro botón.

Como tal no podemos, crear variables en nuestra aplicación debido a que esta es StatelessWidget, entonces la cambiamos para que sea StatefulWidget, esto nos permitirá hacer mas modificaciones a nuestros widgets. Entones tenemos el siguiente código.

```dart
class CounterScreen extends StatefulWidget {                   //<---
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState(); //<---
}
```

```dart
@override
  State<CounterScreen> createState() => _CounterScreenState();
```

Al crear nuestra clase StatefulWidget, esta automáticamente nos creara un State, la cual no es mas que la invocación de nuestra clase principal.

Por lo tanto, tenemos que nuestro widget de trabajo a cambiado de la siguiente manera.

```dart
...
class _CounterScreenState extends State<CounterScreen>{   //<---
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
 ...
```

Ahora podemos agregar nuestra variable entera a nuestro codigo y agregarlo a nuestro texto. Para ello tenemos que que quitar la constante global del Center, y especificarla a los que son necesarios. Esto por que estamos agregando una variable, por lo cual no puede ser variable

```dart
...
body: Center(																	                   //<---
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCounter', style: const TextStyle( fontSize: 160, fontWeight: FontWeight.w100)), //<---                         
              const Text('Clicks', style: TextStyle( fontSize: 25 ))                                      //<---
            ],
          ),
      ),
...
```

RESULTADO:

<img src=img/img_11.png alt="Hola_Mundo_flutter_11" style="width:240px;height:427px;">

Ahora realizaremos el cambio del estado de nuestro widget, esto para que nuestro botón tenga funcionalidad e incremente el contador. Para ello realizamos cambios en el onPressed, que ya habíamos mencionado antes. 

```dart
...
),// Center
floatingActionButton: FloatingActionButton(
          onPressed: (){
            clickCounter++;						//<---
          },
          child: const Icon(Icons.plus_one),
      ),// Column
    );// Scaffold
  }
```

Esto aumenta nuestro contador, pero no lo aumenta en tiempo real, en nuestra aplicacion, para ello tenemos que agregar un setState. Del codigo anterior tenemos el siguiente cambio:

```dart
...
onPressed: (){
    clickCounter++;
    setState(() {});		//<---
},
...
```

RESULTADO:

<img src=img/img_12.png alt="Hola_Mundo_flutter_12" style="width:240px;height:427px;">



CAMBIAR LA PALABRA CLICKS

Ahora cambiaremos la palabra clicks para cuando el contador sea 1, la cual será click.

Para lograr esto tenemos que evaluar la variable click counter, en este caso se evaluara dentro del widget texto para hacer la asignación de la s o sin la s, además de que tenemos que quitar la condicionante const al texto, ya que esta esta influida por una variable, sin embargo a style no es requerido, por lo que tenemos el siguiente resultado.

```dart
body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCounter', style: const TextStyle( fontSize: 160, fontWeight: FontWeight.w100)),
              Text('Click${ clickCounter == 1 ? '':'s' }', style: const TextStyle( fontSize: 25 ))       //<---
            ],
          ),
      ),// Center
```

RESULTADO:

<img src=img/img_13.png alt="Hola_Mundo_flutter_13" style="width:240px;height:427px;">

---

## III. appBar y Acciones

Para esta seccion crearemos un nuevo archivo dart, para ello copiamos todo nuestro proyecto de counter_screen.dart y lo pegamos en el nuevo archivo con nombre counter_functions_screen.dart y renombramos las referencias del nombre de CounterScreen a CounterFunctionScreen.

```dart
class CounterFunctionsScreen extends StatefulWidget {						   //<---	
  const CounterFunctionsScreen({super.key});								  //<---
  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState(); //<---
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen>{       //<---
...
    appBar: AppBar(
        title: const Text( 'Counter Functions' ),							 //<---
      ),
 ...
```

Para implementar estos cambios, tenemos que hacer la referencia a esta pantalla en nuestra funcion main, como tenemos a continuación.

```dart
void main(){
  ...
}

class MyApp extends StatelessWidget{
  ...
    return MaterialApp(
   ...
      home: const CounterFunctionsScreen()	//<---
    );
  ...
}
```

RESULTADO: 

<img src=img/img_14.png alt="Hola_Mundo_flutter_14" style="width:240px;height:427px;">



A continuación, agregaremos un botón que nos regrese nuestro contador a cero. Para ello agregaremos un Action en nuestro appBar, el cual recibe una lista de widgets. Para nuestro caso agregaremos un IconButton con un botón de refresh rounded, que al presionarse regrese a su estado 0. Por lo tanto, tenemos:

```dart
appBar: AppBar(
	...
    actions: [                                         //<---
      IconButton(                                      //<---
          onPressed: (){                               //<---
            setState(() {                              //<---
              clickCounter = 0;                        //<---
            });                                        //<---
          },                                           //<---
          icon: const Icon(Icons.refresh_rounded))     //<---
    ],                                                 //<---
),
```

RESULTADO:

<img src=img/img_15.png alt="Hola_Mundo_flutter_15" style="width:240px;height:427px;">



Ahora agregaremos un botón adicional para que nuestro contador descienda, y que al llegar a cero o menor, este sea cero, para ello crearemos una columna en nuestro floatingActionButton, en nuestra columna definimos el mainAxisAlingment en la esquina inferior, y dentro del children de nuestra columna incorporaremos nuestro botón de +1, y pegamos uno similar pero con la condición ya mencionada anteriormente, y con el icono tipo Icon.exposure_minus_1_ountlined, que es le símbolo -1, al realizar este cambio nuestros wigets quedara pegados, para realizar la separación de esto agregaremos un SizeBox() de 10 de altura, este debe de ser constante ya que no cambiara de valor. 

```dart
...
//COLUMN
floatingActionButton: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      //BUTTON_PLUS_ONE
      FloatingActionButton(
        onPressed: (){
          clickCounter++;
          setState(() {});
        },
        child: const Icon(Icons.plus_one),
      ),
      //SIZEDBOX
      const SizedBox(height: 10,),
      //BUTTON_EXPOSURE_NIMUS_1_OUTLINED
      FloatingActionButton(
        onPressed: (){
          clickCounter <= 0 ? clickCounter = 0 : clickCounter--;  //CONDITION
          setState(() {});
        },
        child: const Icon(Icons.exposure_minus_1_outlined),
      ),
    ],
  )
 ...
```

RESULTADO:

<img src=img/img_16.png alt="Hola_Mundo_flutter_16" style="width:240px;height:427px;">

como tenemos widgets que son iguales, en este caso los botones, realizamos una extracción de este para poder enviar la información requerida para crearla correctamente, esto se realiza para evitar duplicar código que tenga un fin similar.

Así que, colocamos el cursor en el widget a extraer, click derecho>Refactor>Extract Flutter Widget... y colocamos el nombre de la clase

```dart
...
	CustomButton(),
...

//CLASE CREADA AL EXTRAER EL WIDGET BUTTON
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){},
      child: const Icon(Icons.exposure_minus_1_outlined), //Icon -1
    );
  }
}
```

Para utilizar nuestro widget correctamente obligaremos a solicitar un icon, para que este se muestre correctamente. por lo que, agramarnos un parámetro final  a nuestra clase y la colocamos en el constructor de nuestro widget, además de que mandamos llamar a este icon en la parte de icon de nuestro FloatingActionButton().

```dart
...	
	CustomButton( icon: Icons.exposure_minus_1_outlined ), //LLAMADA DEL WIDGET CON EL PARAMETRO
...
    
class CustomButton extends StatelessWidget {
  final IconData icon;						             //PARAMETRO TIPO ICONDATA

  const CustomButton({						             //CONSTRUCTOR
    super.key,
    required this.icon,						             //PARAMETRO REQUERIDO
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){},
      child: Icon(icon),					             //PARAMETRO ESTABLECIDO
    );
  }
}
```

Como ya tenemos nuestro widget extraído y genérico, podemos crear mas en nuestro widget principal y definir los parámetros requeridos.

```dart
...
	floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton( icon: Icons.refresh_rounded ),             //BOTON REFRESH
          const SizedBox(height: 10,),
          CustomButton( icon: Icons.plus_one ),					 //BOTON +1
          const SizedBox(height: 10,),
          CustomButton( icon: Icons.exposure_minus_1_outlined ),   //BOTON -1
        ],
      )
...
class CustomButton extends StatelessWidget {
...
   return FloatingActionButton(
      shape: const StadiumBorder(),							   //REDONDEO DE LOS BOTONES
...
```

RESULTADO:

<img src=img/img_17.png alt="Hola_Mundo_flutter_17" style="width:240px;height:427px;">

Ahora tenemos que agregar nuestro onPress a nuestra clase creada, con la intensión de que cada botón tenga su funcionalidad, para ello tenemos que saber que tipo de dato es, indagando en el código del onPress, vemos que el onPress es de tipo VoidCallback?, entonces la agregamos a nuestra función.

```dart
class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;			       //<--- Atributo

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,								//Asignacion en el contructor
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,						//Llamada de la variable
      child: Icon(icon),
    );
  }
}
```

Finalmente agregamos las funcionalidades a nuestros botones.

```dart
floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //BOTON REFRESH
          CustomButton(							
              icon: Icons.refresh_rounded,
              onPressed: (){				      //ONPRESSED
                clickCounter = 0;			      //RESETEAR COUNTER
                setState(() {});
              },
          ),
          const SizedBox(height: 10,),
          //BOTON +1
          CustomButton(
              icon: Icons.plus_one,
              onPressed: (){
                clickCounter++;					//SUMADOR COUNTER
                setState(() {});
              },
          ),
          const SizedBox(height: 10,),
          //BOTON -1
          CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              onPressed: (){
                if( clickCounter == 0) return;	//EVITAR LOS NEGATIVOS
                clickCounter--;				   //REDUCIR EL CONTADOR
                setState(() {});
              },
          ),
        ],
      )
```

RESULTADO:

<img src=img/img_18.png alt="Hola_Mundo_flutter_18" style="width:240px;height:427px;">






---


## Apéndice

**WIDGET (FLUTTER)**

- En Flutter, un widget es un componente básico de la interfaz de usuario (UI) que se utiliza para construir la estructura visual de la aplicación. Los widgets son los bloques de construcción fundamentales de cualquier aplicación Flutter y pueden ser desde simples elementos como texto o iconos, hasta elementos más complejos como botones interactivos o listas desplazables.

**Stateless Widget**

- Es una pieza de lego que se construye muy rápido y no mantiene el estado por si mismo. Flutter sabe cuando se de be de volver a dibujar, es recomendado que en lugar de crear funciones y métodos que retornan Widget, es mejor crear Clases que extiendan de estos StatelesWidgets. 

**Scaffold** 

- Implementa un diseño básico de material, y da las bases para colocar un menú lateral, snack-bars, appbars, bottom sheets y más elementos.















---

