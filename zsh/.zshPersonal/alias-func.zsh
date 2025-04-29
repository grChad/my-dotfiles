# --------------------------------[ Llamar a 'nvim' ]---------------------------------
alias vi='nvim'
alias vim='nvim'
alias lvi='NVIM_APPNAME=LazyVim nvim'
alias cvi='NVIM_APPNAME=NvChad nvim'
alias kvi='NVIM_APPNAME=kickstart-nvim nvim'
alias clean-nvim='rm ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim ~/.config/nvim/lazy-lock.json'
alias clean-lvim='rm ~/.local/share/LazyVim ~/.local/state/LazyVim ~/.cache/LazyVim ~/.config/LazyVim/lazy-lock.json'
alias clean-cvim='rm ~/.local/share/NvChad ~/.local/state/NvChad ~/.cache/NvChad ~/.config/NvChad/lazy-lock.json'
alias clean-kvim='rm ~/.local/share/kickstart-nvim ~/.local/state/kickstart-nvim ~/.cache/kickstart-nvim ~/.config/kickstart-nvim/lazy-lock.json'

function vims() {
  local items=("1. Default" "2. LazyVim" "3. NvChad" "4. kickstart")
  local msm=" Elija una configuración:  "
  local config

  config=$(
    printf "%s\n" "${items[@]}" |
    fzf --prompt="${msm}" --height=~50% --layout=reverse --border --exit-0
  )

  if [[ $config == "1. Default" ]]; then
    config=""
  elif [[ $config == "2. LazyVim" ]]; then
    config="LazyVim"
  elif [[ $config == "3. NvChad" ]]; then
    config="NvChad"
  elif [[ $config == "4. kickstart" ]]; then
    config="kickstart-nvim"
  else
    echo "No has seleccionado ninguna configuración"
    return 0
  fi

  NVIM_APPNAME=$config nvim $@
}
alias vims='vims'

# ------------------------------[ Directorio de 'Nvim' ]------------------------------
function vimc() {
  local items=("1. Default" "2. LazyVim" "3. NvChad" "4. kickstart")
  local msm=" Directorio de configuración:  "
  local config

  config=$(
    printf "%s\n" "${items[@]}" |
    fzf --prompt="${msm}" --height=~50% --layout=reverse --border --exit-0
  )

  if [[ $config == "1. Default" ]]; then
    config="nvim"
  elif [[ $config == "2. LazyVim" ]]; then
    config="LazyVim"
  elif [[ $config == "3. NvChad" ]]; then
    config="NvChad"
  elif [[ $config == "4. kickstart" ]]; then
    config="kickstart-nvim"
  else
    echo "No has seleccionado ningun directorio"
    return 0
  fi

  cd $HOME/.config/$config
}
alias vimc='vimc'

# -------------------------[ Llamar a archivos estaticos ]----------------------------
function file_statics() {
  local items=("prettierrc" "stylelintrc" "biome" "stylua")
  local msm="Importar archivo de configuracion:  "
  local config

  config=$(
    printf "%s\n" "${items[@]}" |
    fzf --prompt="${msm}" --height=~50% --layout=reverse --border --exit-0
  )

  if [[ $config == "prettierrc" ]]; then
    config=".prettierrc.json"
  elif [[ $config == "stylelintrc" ]]; then
    config=".stylelintrc.json"
  elif [[ $config == "biome" ]]; then
    config="biome.json"
  elif [[ $config == "stylua" ]]; then
    config=".stylua.toml"
  else
    echo "No has seleccionado ningun archivo"
    return 0
  fi

  # Obtener el directorio actual
  local current_dir=$(pwd)

  # cd $config
  cp $HOME/Escritorio/dotfiles/static/$config $current_dir/.

  echo "Se ha importado el archivo $(tput setab 0)$(tput setaf 6) $config "
}
alias setfile='file_statics'

# TODO: desabilitar se se esta usando 'One Thing'
# --------------------------[ Extension Simple message ]------------------------------
# DCONF_WRITE_COMMAND="dconf write /org/gnome/shell/extensions/simple-message/message"
# function show_message() {
#   local message="$1"
#
#   if [ -n "$message" ] && [ "$message" != "ms" ]; then
#     eval "$DCONF_WRITE_COMMAND \"\\\"$message\\\"\""
#     echo "Se ha agregado el mensaje $(tput setab 0)$(tput setaf 6) $message "
#   else
#     # Borrar el mensaje
#     eval "$DCONF_WRITE_COMMAND \"\\\"\\\"\""
#     echo "Mensaje eliminado"
#   fi
# }
# alias ms='show_message'

# ---------------------------[ Icat for kitty terminal ]------------------------------
alias icat='kitten icat'

# ---------------------------------[ Para LazyGit ]-----------------------------------
alias lg='lazygit'

# ----------------------[ Alias para: salir, apagar, dormir... ]----------------------
alias e='exit'
alias killme='init 0'
alias rekill='init 6'
alias upgrade='sudo dnf upgrade'
alias sleep='systemctl suspend'

# ----------------------------[ Alias para 'lsd' y 'bat' ]----------------------------
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='bat'

# ---------------------------------[ alias para git ]---------------------------------
alias gi='git init'
alias gs='git status'
alias gaa='git add .'
alias gco='git commit -m'
alias gps='git push'
alias gpl='git pull'
alias gl='git log'

# -----------------------[ Eliminar un puerto activo en React ]-----------------------
alias pkill='npx kill-port'

# ----------------------------[ Descomprimir paquetes tar ]---------------------------
alias tarugo='tar xzvf'

# ---------------------------------[ web-dev-server ]---------------------------------
alias lise="web-dev-server --node-resolve --open --watch"

# -----------------------[ Eliminar con confirmación "rm -rf" ]-----------------------
function confirm_rm() {
  local response

  # Mostrar mensaje de confirmación y obtener respuesta
  echo ""
  read -k "?¿Estás seguro que quieres eliminar? $(tput setab 0)$(tput setaf 6) $* $(tput sgr0) (s/n): " response

  echo

  # Verificar la respuesta
  case "$response" in
    [sS]*)
      # Ejecutar 'rm -rf' si la respuesta comienza con 's' o 'S'
      rm -rf "$@"
      echo ""
      echo "Se eliminó $(tput setab 0)$(tput setaf 6) $* "
      ;;
    [nN]*)
      # Mostrar mensaje de cancelación si la respuesta comienza con 'n' o 'N'
      echo ""
      echo "No se eliminó $(tput setab 0)$(tput setaf 6) $* "
      ;;
    *)
      # Mostrar mensaje de respuesta no válida para otras respuestas
      echo ""
      echo "Respuesta no válida. No se eliminó $(tput setab 0)$(tput setaf 6) $* "
      ;;
  esac
}
alias rm='confirm_rm'

# ----------------------------[ Diminutivo para user latexmk]-------------------------
alias texmk='latexmk -pdf -pvc'

# -----------------------[ Compile apk para React Native ]----------------------------
alias rncompile="./gradlew assembleRelease"

# ------------------------------------[ editor Zed] ----------------------------------
alias upgrade_zed="curl -f https://zed.dev/install.sh | sh"
