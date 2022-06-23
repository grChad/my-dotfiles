## Para tener mis datos de git sincronizados
- git config --global user.name 'Gabriel'
- git config --global user.email jgrcreations@gmail.com
- git config --global user.password 'pass**'

## para verificar la informacion gravada:
- cat: /home/user/.gitconfig
   * name = Gabriel
   * password = pass**
   * email = jgrcreations@gmail.com

## Para que se comunique con la rama main y que ya no te pida el usuario y la contraseña:
- git config --global credential.helper store
- Despues solo te pedira la contraseña por 1 ves.

## Para eliminar archivos de GitHub. 'node_modules'
- add node_modules/ => .gitignore
- git rm -r --cache node_modules
- git commit -m 'Remove the now ignore directory node_modules'
- git push origin **branch-name**
