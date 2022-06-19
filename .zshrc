#- Intro of Temrinal
# Favoritos: standard, smmono9, smbraille, Shimrod, rustofat
figlet -f ~/.local/share/fonts/figlet-fonts-master/smmono9.tlf 'Hello Gabriel' | lolcat

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# Sistema de Terminacion moderno
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Alias para 'nvim'
alias vi='nvim'
alias vim='nvim'

# Alias para salir, apagar, dormir
alias e='exit'
alias killme='init 0'
alias rekill='init 6'
alias sleep='systemctl suspend'

# Alias para 'lsd' 'bat'
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'

alias cat='batcat'

# Alias para 'editorconfig', 'eslintrc' and 'stylelint' and 'deno.json'
# 'tsconfig.json'
alias editorconfig='cp $HOME/Documentos/configs-dev/.editorconfig .'
alias configeslint='cp $HOME/Documentos/configs-dev/.eslintrc.js .'
alias configstylelint='cp $HOME/Documentos/configs-dev/.stylelintrc.json $HOME/Documentos/configs-dev/.stylelintignore .'
alias configdeno='cp $HOME/Documentos/configs-dev/deno.json .'
alias configtsconfig="cp $HOME/Documentos/configs-dev/tsconfig.json ."

# Alias para preprocesaro 'sass' and 'web-dev-server'
alias sassApp='sass --watch style/App.scss style.css'
alias lise='web-dev-server --open --watch'

# Alias para ejecutar 'Godot', desde cualquier lugar
alias godot='/home/gabriel/Godot/Godot_v3.4.2-stable_x11.64'

# alias para git
alias gi='git init'
alias gs='git status'
alias gaa='git add .'
alias gco='git commit -m'
alias gps='git push'
alias gpl='git pull'
alias gl='git log'

# alias para 'vite'
alias runVite='npm run dev -- --host'

# alias para eliminar un puerto activo en react, 'espacio y agregas el puerto'
alias pkill='npx kill-port'

# Crear un proyecto con vite
alias newVite='npm init vite@latest'

# alias para deno
alias derun='deno run --allow-net --allow-read --allow-write'

# alias para descomprimir paquetes tar
alias tarugo='tar xzvf'

# Alias para usar el Shell Hilbish
alias hil='cd ~/.local/Hilbish/ && ./hilbish'

# Alias para neofetch
alias fetch='neofetch --kitty --source ~/.config/kitty/Nvim-TreeSiter.png'

# Plugins
source /usr/share/zsh-sudo/sudo.plugin.zsh

# Path para los complementos de 'android studio'
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Path para usar Sumneko_lua
export PATH=$PATH:$HOME/lua-language-server/bin

# Path para rust-analizer
export PATH=$PATH:$HOME/.local/bin

# Path para correr deno
export PATH=$PATH:$HOME/.deno/bin

# Path para Go
export GOPATH=$HOME/goWork
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Path para Java
export JAVA_HOME=$HOME/.local/java
export PATH=$PATH:$HOME/.local/java/bin

# Para cambiear el cursor cuando regresas de nvim a tmux, o para otra terminal(al gregresar de nvim)
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
