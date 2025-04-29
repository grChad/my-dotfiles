# --------------------------------[ Variables Criticas ]-----------------------------
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"         # Neovim (recomendado)

# --------------------------------[ para Android Studio ]-----------------------------
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# ------------------------[ JDK compatible con React Native ]-------------------------
# Crear un directorio localUser en /home/gabriel/Escritorio/
# Renombrar el directorio descargado a 'jsk-17' o el recomendado por 'React Native'
export PATH="$HOME/Escritorio/localUser/jdk-17/bin:$PATH"

# ------------------------------------[ editor Helix] ----------------------------------
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

# ---------------------------------------[ fnm ]--------------------------------------
FNM_PATH="/home/gabriel/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/gabriel/.local/share/fnm:$PATH"
  eval "$(fnm env --use-on-cd)"
fi

# --------------------------------------[ pnpm ]--------------------------------------
export PNPM_HOME="/home/gabriel/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
