# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

# Created by newuser for 5.9

# NOTE: =================================[ ALIASES ]==================================
# -------------------------------[ Alias para 'nvim' ]--------------------------------
alias vi='nvim'
alias vim='nvim'
alias vimc='cd ~/.config/nvim/'

alias lvi='NVIM_APPNAME=LazyVim nvim'
alias cvi='NVIM_APPNAME=NVChad nvim'

function vims() {
  items=("default" "LazyVim" "NvChad")
  msm=" Configuraciones de Neovim:  "

  config=$(
    printf "%s\n" "${items[@]}" |
    fzf --prompt="${msm}" --height=~50% --layout=reverse --border --exit-0
  )

  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi

  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "vims\n"

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

# -----------------------[ Eliminar con confirmación "rm -rf" ]----------------------
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

# NOTE: ===================================[ PATH ]===================================
# --------------------------------[ para Android Studio ]-----------------------------
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# ------------------------[ JDK compatible con React Native ]-------------------------
export PATH="$HOME/Escritorio/localUser/jdk-17/bin:$PATH"

# ---------------------------------------[ fnm ]--------------------------------------
export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env`"
eval "$(fnm env --use-on-cd)"

# NOTE: ==================================[ OTHER ]===================================
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

# --------------------------------------[ pnpm ]--------------------------------------
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
