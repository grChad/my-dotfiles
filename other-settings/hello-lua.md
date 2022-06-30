# Introducción basica a Lua <img style="height: 30px" src="../assets/lua-icon.png">

Lua es un lenguaje de secuencias de comando potente, eficiente, liviano e integrable. Es compatible con la programación de procedimientos, la programación orientada a objetos, la programación funcional, la programación basada en datos y la descripción de datos.

Lua combina una sintaxis de procedimiento simple con poderosas construcciones de descripción de datos basadas en matrices asociativas y semántica extensible....

## Comentarios
```lua
-- Comentarios en una linea

--[[
    Comentarios multilineas,
    es el equivalente al tempalte-string de javascript
--]]
```

## Variables
Las variables son espacios de memoria que almacenan valores. Hay 3 tipos de varibles en **lua**: variables globales, variables locales y cambos de tablas.

```lua
nombre
Edad = 30
local otro_nombre = 'Dalila'
````

* las variables declaradas, pero sin asignar tendran como valor **nil**, un equivalente a **null**.
* las variables tendran un ambito **global** siempre que no se declare explicitamente como **local**.
* Una valiable **global** se declara con mayuscula <code>**Nombre**</code>, no es obligatorio pero si tienes linter este se quejara. <code></code>

## Tipos de datos
### nil (vacio)
representa un valor no valido y equivalente a **false** en las expresiones condicionales.

### boolean
Como cualquier otro lenguaje, un boleano solo tiene 2 posibles valores: **true** (verdadero) y **false** (falso). Aunque tambien se usa **nil**.
```lua
local is_good = true
local is_hot = false
```

## number
Para **lua** solo se usa **double** (doble precisión) 64-bits y 52-bits se usan para almacenar valores enteros exactos.
```lua
local number_a = 3
local number_b = 4.5
local number_c = 3e+1
local number_d = 0.5e-1
local number_e = 3.1415-01

print(type(number_a))  -- resultado => number
```

### string (cadena de texto)
se pueden representar con cadenas simples o dobles, cuestion de gustos.
```lua
local primer_string = 'hola soy el String simple'
local segundo_string = "Eu sou a corda dupla, que fala português"
```

### array, objetos, matrices, tablas.
Es como una mezcla de todo. Por convencion la llamare tabla pero de a poco, que cuesta adaptarse.
```lua
local array = {10, 20, 30, 40, 50}

-- en lua se cuenta desde 1, no desde 0
print(array[1]) -- escribe '10'
print(#array) -- escribe '5', hasta aqui como un (array.length)
```

Hasta aqui, nada fuera de lo normal, si bienes de un lenguaje donde el indice comienza por cero podria sorprenderte algo.

```lua
local array_raro = {
  10, 'un String', 30, [16] = 600
}

print(array_raro[1])   -- escribe '10'
print(array_raro[2])   -- escribe 'un String'
print(array_raro[16])  -- escribe '600'
print(#array_raro)     -- escribe '3'????
```
Ahora ya no parece una lista, mas bien una mezcla con un objeto.

Como siempre hay una explicación, en el codigo <code>**print(array_raro[1])**</code>, se pinta o imprime por consola el **indice 1** de la tabla **array_raro** como valor de retorno <code>**10**</code>.

En el codigo <code>**print(array_raro[16])**</code>, se llama al **indice 16** que tiene valor **600**. De esto se concluye que el valor de los indices **4** al **15** son **nill**

Por ultimo, <code>**print(#array_raro)**</code> retorna **3**; por que, solo muestra la longitud de datos consecutivos con valor no nulos. Y reconoce que hay un vacio desde el indice **3** al incide **16**.

Ahora viene un twist, asi que preparate.

```lua
local pizza = {
    precio = 500,
    ['tipo'] = 'Napolitana',
    ['cantidad de queso'] = 20000
}

print(pizza.precio)       -- escribe '500'
print(pizza['precio'])    -- escribe '500', es lo mismo
print(pizza.tipo)         -- escribe 'Napolitana'
print(pizza['cantidad de queso'])   -- escribe '20000'
```

```lua
local otros = {
   nombre = 'Gabriel',
   saludar = function(self)
      return 'un saludo a ' .. self.nombre
   end
}

print(otros['saludar'](otros))
print(otros.saludar(otros))
print(otros:saludar())

-- los 3 son validas y retornan 'un saludo a Gabriel'
```
