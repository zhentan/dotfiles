POWERLEVEL9K_INSTALLATION_PATH=~/.zim/modules/prompt/external-themes/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history rbenv)
#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

#exports
export PATH=~/Library/Python/2.7/bin:$PATH
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
. "/usr/local/opt/nvm/nvm.sh"

#rbevn
eval "$(rbenv init -)"

#alias
alias ls='gls --color=auto'
