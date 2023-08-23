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
	<Svg width="80" height="80" viewBox="-16 -16 544 544">
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
    <img src="./image-svg-plus.png"/>
</p>
