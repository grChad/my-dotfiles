# Install:
* sudo apt install zsh => **debian**
* sudo dnf install zsh => **fedora**

## solucion de problemas
* me daba un error de compilacion en **zsh**, siempre que ingresaba al modo super me salia un mensaje molesto de compilar:
* eso lo solucione con el comando
   cd /usr/local/share/
   sudo chmod -R 755 zsh
   sudo chown -R root:g4briel zsh
* eso fue la solucion......end...........

## Para llamar a la patela de colores de 'PowerLevel10K'
* for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
