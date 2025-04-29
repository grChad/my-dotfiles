# -----------------------------[ cursor a modo insertar ]-----------------------------
function zle-line-init zle-keymap-select {
   if [ $KEYMAP = vicmd ]; then
      echo -ne "\033]12;deepskyblue\x7\e[1 q"
   else  # the insert mode for vicmd
      echo -ne "\033]12;199\x7\e[5 q"
   fi
   zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

