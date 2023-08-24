<h1 align="center">Como usar React Native (CLI)</h1>

## Fuentes

En react native (Expo) se requiere de _expo-font_ y escribir algo de código en la App de inicio. Pero en React Native (CLI) es mas sencillo:

1. Creas el directorio `assets/fonts/` en la ruta de tu proyecto y agregas dentro todas las fuentes que usaras. Preferiblemente optimizadas.
2. Creas un archivo `react-native.config.js` también en la misma ruta del proyecto y agregas lo siguiente dentro:
   ```javascript
   module.exports = {
   	project: {
   		ios: {},
   		android: {}
   	},
   	assets: ['./assets/fonts/']
   }
   ```
3. para **react native 0.69** o superior ejecutas `npx react-native-asset` y vuelves a iniciar el Proyecto.

Algo importante!. Dentro de `assets/`. Los archivos de las fuentes `fuente.fft` tendrán que ser usados con el mismo nombre:

Ejemplo: si tienes una fuente llamada `Fuente-genial-bold.fft`, para el código tendrá que ser igual.

```javascript
export const styles = StyleSheet.create({
	title: {
		fontFamily: 'Fuente-genial-bold'
	}
})
```

Y si le cambias el nombre al archivo, para que haga efecto regresa al paso numero Nº3.

## SVG

Usar algún SVGs no es tan fácil como la web, se requiere de una librería para ello. Felizmente existe `react-native-svg` tango para React Native (Expo o CLI).

En el caso de **CLI**:

1. instalar con npm o yarn, mi ejemplo es con **npm**: `npm install react-native-svg`
2. Eso es todo, Usar.

Ejemplo de un símbolo '+':

```js
import React from 'react'
import Svg, { Rect, Path } from 'react-native-svg'

import { StyleSheet, View } from 'react-native'

export const SvgPlus = () => (
	<Svg width="300" height="300" viewBox="0 0 448 512">
		<Path
			d="M256 80a32 32 0 10-64 0v144H48a32 32 0 100 64h144v144a32 32 0 1064 0V288h144a32 32 0 100-64H256V80z"
			strokeWidth="5"
			stroke="black"
			fill="#FA8072"
		/>
	</Svg>
)
```

El resultado seria este:

<p align="center">
    <svg xmlns="http://www.w3.org/2000/svg" width="300px" height="300px" viewBox="0 0 448 512" style="background-color: white">
        <path d="M256 80a32 32 0 10-64 0v144H48a32 32 0 100 64h144v144a32 32 0 1064 0V288h144a32 32 0 100-64H256V80z" fill="#FA8072" stroke="black" stroke-width="5"/>
    </svg>
</p>

## Usar Gradientes

Nuevamente, esto es nativo y fácil en la Web, pero para React Native (expo o CLI) se requieren de librerías. Para CLI usaremos `react-native-linear-gradient`

1. Instalar `react-native-linear-gradient` en el proyecto:

   ```shell
    npm install react-native-linear-gradient
   ```

2. Reiniciar el proyecto.
3. Importamos la biblioteca donde lo queramos usar:

   ```js
   import { Text } from 'react-native'
   import LinearGradient from 'react-native-linear-gradient'
   ```

4. Dentro del **Return()**, puedes agregar un algo como esto:

   ```js
    return (
           <LinearGradient
               colors={[ '#98b9b1', '#6c8c88', '#4a6b67', '#3c5754' ]}
               start={{ x: 0.4, y: 0.5 }}
               end={{ x: 0.4, y: 0.7 }}
               style={{......}}
           >
               <Text>Hello World</Text>
           </LinearGradient>
    )
   ```
