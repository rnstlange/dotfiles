export NVM_LAZY=true

zgen () {
  source ${ZGEN_DIR}/zgen.zsh
  zgen "$@"
}

if [[ ! -s ${ZGEN_DIR}/init.zsh ]]; then
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/nvm
  zgen load romkatv/powerlevel10k powerlevel10k

  zgen save
  zcompile ${ZGEN_DIR}/init.zsh
else
  source ${ZGEN_DIR}/init.zsh
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f $POWERLEVEL9K_CONFIG_FILE ]] || source $POWERLEVEL9K_CONFIG_FILE

