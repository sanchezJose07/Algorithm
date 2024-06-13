# <img src=img/logo_flutter.png alt="Hola_Mundo_flutter_01" style="width:100px;height:100px;"> Sección 6: Yes No - Maybe App - Funcionalidad     

``` 
Autor: Jose Guadalupe Guerrero Sanchez
Curso: Flutter - Movil: De cero a experto
Instructor: Fernado Herrera
```

---

## Resumen

En esta sección 6 nos enfocaremos en trabajar la lógica de negocio de nuestra aplicación, en pocas palabras haremos funcionar el diseño hecho en la sección aterior.

Puntualmente veremos:

- Gestores de estado
- Mappers
- Peticiones HTTP
- Dio
- Paquetes
- Funciones que retornan valores como callbacks
- Scroll
- Provider
- Y más cosas

Al finalizar la sección tendremos una buena base de como alojar el estado fuera de los widgets y que los widgets se actualicen y tomen la información que necesitan del gestor de estado.

### Palabras claves ###

---

## 80. Entidad - Message

Como primer paso de nuestra leccion es crear un directorio en la carpeta lib de nuestro proyecto, esto siguiendo los principios de la arquitectura limpia. En nuestro directorio creado crearemos la carpeta entities. En este directorio crearemos el archivos message.dart, donde cabe mencionar que estos directorios estaran programados propiamente con dart, por lo que no agregaremos widgets.

 Entonces crearemos 3 variables de las cuales 2 seran requeridas, lo cual se especifica en el constructor como se muestra en el codigo siguiente.

```dart
enum FromWho { mine, his }

class Message{
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho
  });
}
```



## 81. Provider - Gestor de estados

 



```dart
void main(){
  runApp( MyApp() );
}
```

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

A continuación, tenemos la aplicación ejecutada en un dispositivo android 

<img src=img/img_01.png alt="Hola_Mundo_flutter_01" style="width:240px;height:427px;">

- Listado

---

## II. Segundo punto

Descripcion

``` jar
{
	"nombre":"Jose Guerra",
	"CODIGO":"EJEMPLO"
}
```

---

 	  
