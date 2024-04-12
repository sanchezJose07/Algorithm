# <img src=img/logo_flutter.png alt="Hola_Mundo_flutter_01" style="width:100px;height:100px;"> Sección 5: Yes No - Maybe App     

``` 
Autor: Jose Guadalupe Guerrero Sanchez
Curso: Flutter - Movil: De cero a experto
Instructor: Fernado Herrera
```

---

## Resumen

En esta sección haremos el diseño de la aplicación de YesNo, la cual eventualmente responderá nuestras presuntas (siempre y cuando sean de si o no). La sección esta llena de contenido para construir este pequeño chat, pero la funcionalidad la haremos en la siguiente sección.  

### Palabras claves  ###

TextEditingControllers, Focus Nodes, ThemeData

Widgets como: Containers, SizeBox, ListViews, CustomWidgets, Expanded, Padding, Image(desde internet), ClipRRect (bordes redondeados)

---

## I. Inicio App

Como primer punto de nuestro código, crearemos un nuevo proyecto de flutter, el cual tendrá como nombre yesNoMaybeApp. Cuando creamos un proyecto en flutter nos crea una plantillas por defecto, para este caso eliminaremos todo el código que hay dentro de este, después ejecutaremos el snippet "mateApp", el cual nos creara una plantilla con un main y un StatelessWidget.  

Después de esto haremos una modificación al código para colocar un botón en el centro, esto integrando un botón en el widget child.

```dart
import 'package:flutter/material.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp( { super.key } );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No Maybe App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: FilledButton.tonal(
              onPressed: (){ },
              child: const Text( 'Click me' )
          ),
        ),
      ),
    );
  }
}
```

RESULTADO:

<img src=img/img_01.png alt="yesNoMaybeApp" style="width:240px;height:427px;">

Ahora crearemos un archivo dart para la configuración del tema de la app, este archivo se define como "app_theme.dart", y se establece el el directorio "yes_no_maybe_app/lib/config/theme". En este archivo se crea una clase con un método que retorna un dato de tipo **ThemeData**. 

```dart
class AppTheme{

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true
    );
  }
}
```

En dicho archivo crearemos una lista de colores para el tema, ademas de una constante de tipo Color, ambas de tipo privado, recordando que esto se logra poniendo un gion bajo al inicio de la variable.

```dart
const Color _customColor = Color(0xCDB40798);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];
```

Teniendo lo anterior, agregaremos el ColorSchemaSeed a nuestro widget que se retorna en el método theme del tipo ThemeData. Ademas agregamos una variable para seleccionar el color de tipo final, y lo pedimos en el constructor de nuestra clase. También agregaremos **aserciones** para condicionar a nuestra variable del constructor. Obteniendo lo siguiente

```dart
class AppTheme{
  late final int selectedColor;
  AppTheme({
    selectedColor = 0
  }):assert( selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
          "Color entre 0 y 7" );
  ThemeData theme(){
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorThemes[ selectedColor ]
    );
  }
}
```

Ya teniendo configurado nuestro código, lo podemos modificar desde nuestro archivo main para poder agregar el color.

```dart
...
	debugShowCheckedModeBanner: false,
	theme: AppTheme( selectedColor: 0 ).theme(),	//<---
	home: Scaffold(
...
```

RESULTADO:

<img src=img/img_02.png alt="yesNoMaybeApp" style="width:240px;height:427px;">

Si quisieramos tener el **tema oscuro** en nuestra aplicacion de manera global, bastaria con agregar brightness: Brightness.dart en nuestro widget de colorSchema de nuestra clase AppTheme

```dart
...
	colorSchemeSeed: _colorThemes[ selectedColor ],
                         brightness: Brightness.dark  //<---
	);
...
```

RESULTADO:

<img src=img/img_03.png alt="yesNoMaybeApp" style="width:240px;height:427px;">



---

## II. Chat bot

Ahora crearemos el chatbot, para ello crearemos una clase llamada ChatScreen en el directorio "yesNoMaybeApp/lib/presentation/chat" con en nombre "chat_screen.dart". Hay que tener en cuenta que si nosotros creamos un Screen, tentemos que retornar un Saffold, donde colocaremos el appBar y el titulo.

```dart
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Checo Perez" ),
        centerTitle: true
      ),
    );
  }
}

```

Ahora nos dirigimos a nuestro archivo main(), donde agregaremos nuestro ChatScreen() creado a nuestra App

```dart
...  
	theme: AppTheme( selectedColor: 5 ).theme(),
      home: const ChatScreen()		//<---
    );
...
```

RESULTADO:

<img src=img/img_04.png alt="yesNoMaybeApp" style="width:240px;height:427px;">

A nuestra clase ChatScreen, le agregaremos un leading, el cual incluirá un circle avatar y le agregamos un padding para poder configurar la posición, ademas de que incluiremos un backgroundImage para poder poner una imagen a nuestro avatar, en este caso se realizara tomando una imagen desde internet.

```dart
...
	appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://i.pinimg.com/564x/a1/c0/3d/a1c03d2c9b83a95bb8e6689892786102.jpg"
            ),
          ),
        ),
        title: const Text( "Checo Perez" ),
      ),
...
```

RESULTADO:

<img src=img/img_05.png alt="yesNoMaybeApp" style="width:240px;height:427px;">

Para tener una mejor presentación de nuestro código, extraeremos nuestro widget appBar de nuestra clase principal, para ello en la clase extraída implementaremos la clase PreferredSizeWidget, para que este pueda tener las propiedades del appBar, ademas de agregar el Size. Teniendo el siguiente resultado. 

```dart
...
return Scaffold(
      appBar: _ChatBar(),	//<---
    );
...
    
class _ChatBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Size get preferredSize => const Size.fromHeight( kToolbarHeight );
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(4.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://i.pinimg.com/564x/a1/c0/3d/a1c03d2c9b83a95bb8e6689892786102.jpg"
          ),
        ),
      ),
      title: const Text( "Checo Perez" ),
    );
  }
}
```

LIST VIEW

Para continuar, crearemos el body de nuestra aplicación, donde colocaremos un Container el cual extraeremos del código para trabajar en el. 

```dart
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: _ChatBar(),
      body: _ChatView(),	//<---
    );
```

En el widget extraído retornaremos una SafeArea el cual nos evitara que nuestros widget se pasen a zonas de control del teléfono. A este mismo widget, le crearemos dos columnas una para mostrar la informacion que se desplazara en la aplicación y la otra estática. que se diferencia por el "HOLA MUNDO".

A esta columna, le agregaremos un padding para restringir el limite horizontal a 10u de nuestro contenedor. A continuación, agregaremos un Expanded el cual le agregaremos un ListView, y seleccionaremos el constructor builder el cual es una función que hará que el widget se cree cuando inmediatamente se ingrese a la pantalla y no cuando se llame. Donde retornaremos un texto con el numero del indice. Limitamos nuestros textos a 100 de la listview

 ```dart
 class _ChatView extends StatelessWidget { 
   @override
   Widget build(BuildContext context) {
     return SafeArea(
         child: Padding(
           padding: const EdgeInsets.symmetric( horizontal: 10 ),
           child: Column(
             children: [
               Expanded(
                 child: ListView.builder(
                   itemCount: 100,
                   itemBuilder: ( context, index ){
                     return Text( "Indice: $index" );
                   }
                 ),
               ),
               const Text("HOLA MUNDO")
             ],
           ),
         )
     );
   }
 }
 
 ```

RESULTADO: 



---



## Apéndice

**WIDGET (FLUTTER)**

- 

















---