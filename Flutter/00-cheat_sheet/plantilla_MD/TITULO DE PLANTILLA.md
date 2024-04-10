# <img src=img/logo_flutter.png alt="Hola_Mundo_flutter_01" style="width:100px;height:100px;"> Sección x: Flutter     

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



## Apéndice

**WIDGET (FLUTTER)**

- En Flutter, un widget es un componente básico de la interfaz de usuario (UI) que se utiliza para construir la estructura visual de la aplicación. Los widgets son los bloques de construcción fundamentales de cualquier aplicación Flutter y pueden ser desde simples elementos como texto o iconos, hasta elementos más complejos como botones interactivos o listas desplazables.



















---

