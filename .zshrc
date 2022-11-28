source ~/.env
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

LS_COLORS="ow=01;36;40" && export LS_COLORS

autoload -Uz compinit
compinit

# fix the kubectl and helm plugin
mkdir -p $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/cache/completions

source $(brew --prefix)/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh


# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle docker 
antigen bundle docker-compose 
antigen bundle dotenv 
antigen bundle gh 
antigen bundle helm 
antigen bundle jsontools 
antigen bundle npm 
antigen bundle nvm 
antigen bundle rust 
antigen bundle kubectl 
antigen bundle sunlei/zsh-ssh
antigen bundle brew
antigen bundle reegnz/jq-zsh-plugin
antigen bundle go/rancher-zsh-completion


source <(kubectl krew completion zsh)

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting


# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
