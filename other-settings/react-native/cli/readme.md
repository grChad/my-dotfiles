## generar SHA1

en el caso de React native CLI existe un comando para oberner no solo el `SHA1`, sino tambien `SHA-256, MD5` y con una vida util de mucho tiempo.

```bash
cd android
./gradlew signingReport
```

Mostrara por terminal los datos y tambien se creara un fichero secreto dentro de la ruta `~/.android/debug.keystore`, que estara sifrado.
