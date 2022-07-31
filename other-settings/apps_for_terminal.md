 # Programas para la Terminal <img style="height:25px" src="../assets/shell-icon.png">

## Grex: <img style="height: 17px" src="../assets/image-grex.png">
grex es una biblioteca, así como una utilidad de línea de comandos que pretende simplificar la tarea a menudo complicada y tediosa de crear expresiones regulares. Lo hace generando automáticamente una única expresión regular a partir de casos de prueba proporcionados por el usuario. Se garantiza que la expresión resultante coincida con los casos de prueba a partir de los cuales se generó.

### Install
```bash
cargo install grex
```

Aunque también funciona con:

<code>**(brew | cargo | choco | huber | scoop) install grex**</code>

### usar
Tan facil como  colocar en la **_terminal_**, <code>**grex hola mola**</code> y obtendrias algo como <code>**^\[hl]ola$**</code>, que es la expresion regular.

<img src="../assets/image-grex-terminal.png">

También podrías tener las coincidencias en un archivo y buscar a través de ellas:
<code>**grex -f file.txt**</code> y obtener el mismo resultado.

<img src="../assets/image-grex-file.png">

Para mas informacion en el **_GitHub_** de [**grex**](https://github.com/pemistahl/grex).
