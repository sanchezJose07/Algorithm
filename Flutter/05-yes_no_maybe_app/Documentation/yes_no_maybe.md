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
            backgroundImage: NetworkImage("https://scontent.fqro3-1.fna.fbcdn.net/v/t39.30808-6/284948868_570259974455087_7903694349108941066_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=5f2048&_nc_ohc=z822PzC31noAb5wdiyL&_nc_ht=scontent.fqro3-1.fna&oh=00_AfD8jHuZaV7NARJ030Tf_JEk-DBnLnoGMSYXmIQaeHeGXw&oe=662A2E80"
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
          backgroundImage: NetworkImage("https://scontent.fqro3-1.fna.fbcdn.net/v/t39.30808-6/284948868_570259974455087_7903694349108941066_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=5f2048&_nc_ohc=z822PzC31noAb5wdiyL&_nc_ht=scontent.fqro3-1.fna&oh=00_AfD8jHuZaV7NARJ030Tf_JEk-DBnLnoGMSYXmIQaeHeGXw&oe=662A2E80"
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

<img src=img/img_06.png alt="yesNoMaybeApp" style="width:240px;height:427px;">



MIS MENSAJES - BURBUJA DE CHAT

Para empezar con esta seccion, agregaremos un widget para nuestras burbujas, para esto crearemos un nuevo repositorio para guardar esto widgets, esto en la siguiente direccion, lib/presentation/widgets, la idea de esto es que en este directorio guardemos los widgets muy especificos que podemos reutilizar. Creamos un nuevo directorio en nuestro directorio de widget, el cual tendra el nombre de chat. 

Crear widget de MyMessageBubble

1. En el directorio de chat mensionado anteriormente crearemos nuestro widget con el nombre de "my_message_bubble.dart".

2.  Importamos la libreria de material.dart
3. Creamos nuestro widget Stateless
4. Definimos el nombre como MyMessageBubble
5. Retornamos un texto, esto por el momento\

A continuacion, se muestra el codigo de nuestro my_message_bubble.dart

```dar
import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text( "My Message" );
  }
}
```

**NOTA: Para este punto se hizo el cambio de la carpeta chat, es decir la de la pantalla a un nuevo directorio, el cual tiene la siguiente direccion, lib/presentation/screens, con lo cual tendriamos el siguiente directorio actualizado para importar en nuestro programa main.dart, lib/presentation/screens/chat/chat_screen.dart**

Ahora agregamos nuestro widget a nuestro chat_screen.dart, para ser mas especificos en nuestro widget _ChatView, En la parte donde retornamos un texto. 

```dart
...
   Expanded(
    child: ListView.builder(
      itemCount: 100,
      itemBuilder: ( context, index ){
        return const MyMessageBubble(); //<---
      }
    ),
  ),
...
```

RESULTADO:

<img src=img/img_07.png alt="yesNoMaybeApp" style="width:260px;height:507px;">

Como siguiente paso, en nuestro codigo de nuestro archivo my_message_bubble.dart, cambiaremos el valor a retornar, que anteriormente era un texto, ahora sera una Column, con un Container dentro, y con la siguiente configuracion

```dart
...
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
            ),
            child: const Text("Viejo Sabroso", style: TextStyle( color: Colors.white),),
          )
        ],
    );
  }
...
```

Donde agregamos una decoracion con color pinkAccent, y un child de texto.

RESULTADO:

<img src=img/img_08.png alt="yesNoMaybeApp" style="width:260px;height:507px;">

A continuacion, definiremos un padding en nuestro texto, ademas de que a nuestra columna le agregaremos un SizeBox, esto para tener una mejor distribucion y separacion de cada uno de nuestros mensajes.

```dart
...
return Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
            ),
            // AGREGAMOS EL PADDING AL TEXTO
            child: const Padding(
              padding: EdgeInsets.symmetric( horizontal: 20.0, vertical: 10 ),
              child: Text("Viejo Sabroso", style: TextStyle( color: Colors.white),),
            ),
          ),
          const SizedBox( height: 10,) //<--- Separacion
        ],
    );
...
```

RESULTADO:

<img src=img/img_09.png alt="yesNoMaybeApp" style="width:260px;height:507px;">

Posteriormente definimos los mensajes a la parte derecha, esto lo logramos definiendo en la columna la siguiente  linea.

```dart
crossAxisAlignment: CrossAxisAlignment.end, //<---1
```

y redondeamos nuestros mensajes, configurando la decoracion, agregando el BorderRadius

```dart
borderRadius: BorderRadius.circular(20) //<---2
```

Ahora definiremos el color de nuestro mensajes dependiendo del contexto de nuestra aplicacion, esto con la siguiente lineal al iniciar nuestro widget

```dart
final colors = Theme.of(context).colorScheme; //<---3
```

y la definimos en el color de nuestra decoration de nuestro mensaje, esto definira el color de nuestro mensajes como el color por defecto de nuestra aplicacion, este valor se toma del archivo app_theme.dart

```dart
color:colors.primary,	//<---4
```

finalmente tenemos el siguiente codigo.

```dart

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme; //<---3
 
    return Column(
        crossAxisAlignment: CrossAxisAlignment.end,//<---1
        children: [
          Container(
            decoration: BoxDecoration(
              color: colors.primary,			//<---4
              borderRadius: BorderRadius.circular( 20 ) //<---2
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric( horizontal: 20.0, vertical: 10 ),
              child: Text("Viejo Sabroso", style: TextStyle( color: Colors.white),),
            ),
          ),
          const SizedBox( height: 10,)
        ],
    );
  }
}
```

RESULTADO:

<img src=img/img_10.png alt="yesNoMaybeApp" style="width:260px;height:507px;">



MENSAJES DE EL - BURBUJA DE CHAT

Ahora que ya tenemos los mensajes para la parte del usuario, crearemos la parte del la persona externa, para ello crearemos un nuevo archivo en nuestro directorio de chat con el nombre de his_message_bubble.dart, donde copiaremos el codigo del archivo my_message_bubble.dart, solo que cambiaremos el nombre de la clase. 

1. Cambiaremos el texto que se muestra en el mensaje, por "Formula 1"
2. Cambiaremos el CrossAxisAlignment a start
3. Cambiaremos el tamano de SizeBox a 5
4. Cambiaremos el color a secundary.

```dart
import 'package:flutter/material.dart';

class HisMessageBubble extends StatelessWidget {
  const HisMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,	//<---2
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, //<---4
              borderRadius: BorderRadius.circular( 20 )
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric( horizontal: 20.0, vertical: 10 ),
            child: Text("Formula 1", style: TextStyle( color: Colors.white),), //<--1
          ),
        ),
        const SizedBox( height: 5,)		//<---3
      ],
    );
  }
}
```

ya teniendo los cambios establecidos, los agregaremos a nuestro archivo chat_screen.dart para verlos reflejados en la aplicacion.

Para ello, definiremos en el _ChatView, donde alternaremos cada uno de los mensajes del usuario con el tercero. Para este caso, utilizaremos el index que tenemos como iteracion para definir cuales son los valores pares e impares para definir cuando alternar de texto, donde tenemos el siguiente codigo.

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
                    return ( index % 2 == 0 )	//<---PAR
                      ? const HisMessageBubble() //<---TRUE
                      : const MyMessageBubble(); //<---FALSE
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

<img src=img/img_11.png alt="yesNoMaybeApp" style="width:260px;height:507px;">

Ahora nuestro objetivo es que la persona externa pueda tener imagenes, para ello creremos una clase en nuestro archivo his_messege_bubble.dart llamada _ImageBuble, donde podemos ver que es una clase privada, ya que este solo se utilizara en el codigo local. Esta clase es de tipo Stateless, la cual retornara un Placeholder. como tenemos a continuacion.

```dart
...
		const SizedBox( height: 5,),
        _ImageBubble(),		//<---
      ],
    );
  }
}

//CLASE PARA LA IMAGEN
class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

RESULTADO:

<img src=img/img_12.png alt="yesNoMaybeApp" style="width:260px;height:507px;">

Por el momento borraremos el Placeholder() del codigo, en su caso agregamos el siguiente link el cual es un gif https://yesno.wtf/api, este url lo agregaremos al programa Postman, donde pegaremos el link y enviaremos, esto nos generara un link con extension gif y lo pegamos en nuestro widget.

<img src=img/img_13.png alt="yesNoMaybeApp" style="width:855px;height:507px;">

```dart
class _ImageBubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Image.network( 'https://yesno.wtf/assets/no/10-d5ddf3f82134e781c1175614c0d2bab2.gif' );	//<---
  }
}
```

RESULTADO:

<img src=img/img_14.png alt="yesNoMaybeApp" style="width:260px;height:507px;">

Ahora envolvemos nuestro widget de imagen en una ClipRRect

```dart
return  ClipRRect(  child:  Image.network( 'https://yesno.wtf/assets/no/10-d5ddf3f82134e781c1175614c0d2bab2.gif' ) );	//<---1
```

Continuando con hacerle un borderRadius a nuestra imagen, con un valor circular de 20.

```dart
borderRadius: BorderRadius.circular( 20 ), //<---2
```

A continuacion, agregamos un SizedBox entre nuestro widget de nuestra imagen, con lo cual tenemos dos SizedBox para nuestra funcion

```dart
const SizedBox( height: 5,),
_ImageBubble(),
const SizedBox( height: 10),	//<---3
```

Como siguiente punto reduciremos al 70% neustra imagen para que abarque toda nuestra pantalla, es por ello que agregaremos una MediaQuery, para saber cual es el tamano de nuestro dispositivo, y asi definir el limite de nuestra imagen. y despues imprimimos los valores obtenidos en consola.

```dart
final size = MediaQuery.of(context).size;	//<---4.1
print( size );								//<---4.2
```

```cmd
I/flutter (12453): Size(392.7, 783.3)		
```

Conociendo el tamano de nuestro dispositivo, restringimos el tamano de nuestra imagen al 70% en lo ancho y en la altura la definimos como 150, ademas de que agregamos un fit, que admite widgets de tipo BoxFit, en este caso lo definiremos como cover, ya que nuestra imagen pierde el redondeo impuesto anteriormente, esto por redimencioar nuestra imagen.

```dart
child:  Image.network(
    'https://yesno.wtf/assets/no/10-d5ddf3f82134e781c1175614c0d2bab2.gif',
    width: size.width * 0.70,	//<---5.1
	height: 150,				//<---5.2
    fit: BoxFit.cover,			//<---5.3
) );
```

CODIGO:

```DART
...  
		const SizedBox( height: 5,),
        _ImageBubble(),
        const SizedBox( height: 10),				//<---3
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;		//<---4.1
    print( size );									//<---4.2
    return ClipRRect(
        borderRadius: BorderRadius.circular( 20 ),	//<---2
        child:  Image.network(
            'https://yesno.wtf/assets/no/10-d5ddf3f82134e781c1175614c0d2bab2.gif', //<---1
            width: size.width * 0.70,				//<---5.1
            height: 150,							//<---5.2
            fit: BoxFit.cover,						//<---5.3
        ) );
  }
} 
```



RESULTADO:

<img src=img/img_15.png alt="yesNoMaybeApp" style="width:260px;height:507px;">

  

72. MOSTRAR MENSAJES MIENTRAS SE CARGA LA IMAGEN

El objetivo de esta leccion, es mostrar algun mensaje mientras nuestra imagen esta cargandose, ya que al cargar esta pantalla tiene un pequeno retardo la imagen. Definiremos un loadingBuilder en la imagen el cual es algo que se va a crear en tiempo de ejecucion. En este widget definiremos si ya se ha cargado la imagen, si es asi, retonamos la imagen, es decir, el children, caso contrario retornaremos un contenedor con los tamanos ya definidos anteriormente, con un padding simetrico y con el texto que se mostrara.

```dart
child:  Image.network(
    'https://yesno.wtf/assets/no/10-d5ddf3f82134e781c1175614c0d2bab2.gif',
    width: size.width * 0.70,
    height: 150,
    fit: BoxFit.cover,
    loadingBuilder: ( context, child, loadingProgress){ 						//<---1.1
        if( loadingProgress == null ) return child;								//<---1.2
        return Container(														//<---1.3
          width: size.width * 0.70,												//<---1.4
          height: 150,															//<---1.5
          padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5 ),	//<---1.6
          child: const Text( "Checo Perez esta enviando un mensaje" ),			//<---1.7
        );
    },
) );
```

RESULTADO:

<img src=img/img_16.png alt="yesNoMaybeApp" style="width:260px;height:507px;">



73. TEXT FORM FIELD

    Para este capitulo crearemos una caja de texto, el cual nos permitira introducir texto. Para ello crearemos un nuevo directorio en nuestra carpeta widget, con lo cual tendremos el directorio con la siguiente direccion lib/presentation/widget/shared, donde crearemos un widget, con el nombre de message_field_box.dart

    Entonces definimos el contenido de nuestra clase.

    ```dart
    import 'package:flutter/material.dart';
    
    class MessegeFielBox extends StatelessWidget {
      const MessegeFielBox({super.key});
    
      @override
      Widget build(BuildContext context) {
        return  const Text( 'hola mundo' );
      }
    }
    ```

    y la agregamos a nuestra chat_screen.dart. 

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
                        return ( index % 2 == 0 )
                          ? const HisMessageBubble()
                          : const MyMessageBubble();
                      }
                    ),
                  ),
                  const MessegeFielBox(),		//<---NEW ADD
                ],
    ...
    ```

    Con esto tendremos como resultado un texto de hola mundo en la parte inferior, para diferenciarlos de la configuracion anterior, tenemos que nuestro hola mundo esta en minusculas contrario a las mayusculas anteriores.

    RESULTADO:

    <img src=img/img_17.png alt="yesNoMaybeApp" style="width:260px;height:507px;">

ya manana le sigo ;)



---



## Apéndice

**WIDGET (FLUTTER)**

- 

















---