## Install in Debian.

* sudo su
* apt-get update
* apt-get install texlive-full
   - Esto podria tardar como media hora o mas.
* apt-get install zathura latexmk
   - zathura es un visualizador de pdf y latexmk es para la sintaxys y manejo de errores(creo).
* xdg-mime query default application/pdf
   - Es para ver el visualizador por default de pdf
* xdg-mime default zathura.desktop application/pdf
   - Para poner por default a zathura como visualizador de pdf.
* mkdir /.config/latexmk
   - Creamos un directorio vacio dentro de /.config
* cd /.config/latexmk
   - Ingresamos al directorio creado
* touch latexmkrc
* $pdf_previewer = 'zathura';
   - Escribimos y guardamos esta informacion dentro del archivo recien creado.
* chown gabriel:gabriel -R latexmk
   - Asignamos los permisos de usuario y grupo gabriel como admin
* cd /root
* cd .config/
* mkdir latexmk
* cd !$
* ln -s -f /home/gabriel/.config/latexmk/latexmkrc latexmkrc
   - Esto es para crear un enlace simbolico desde el archivo home/gabriel/.config/latexmk/latexmkrc.
