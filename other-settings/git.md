# Cosas de Git
## Para que te pida la contraseña solo una ves:
```bash
git config --global credential.helper store
```
Despues solo te pedira la contraseña por 1 ves.

## Para eliminar archivos de GitHub:
Ejemplo: **node_modules**
* Agregar <code>**node_modules/**</code> a **.gitignore**.
* <code>**git rm -r --cache node_modules**</code>
* <code>**git commit -m 'Remove the now ignore directory node_modules'**</code>
* <code>**git push**</code>
