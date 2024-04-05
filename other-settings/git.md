# Cosas de Git
## Para que te pida la contraseña solo una ves:
```bash
git config --global credential.helper store
```
Después solo te pedirá la contraseña por 1 ves.

## Para eliminar archivos de GitHub:
Ejemplo: _node_modules_

* Agregar <code>**node_modules/**</code> a **.gitignore**.
* <code>**git rm -r --cache node_modules**</code>
* <code>**git commit -m 'Remove the now ignore directory node_modules'**</code>
* <code>**git push**</code>
