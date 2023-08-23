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
