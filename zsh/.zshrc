#--------------------------------------------------------------------------
# Oh My Zsh
#--------------------------------------------------------------------------

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
	git
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#--------------------------------------------------------------------------
# Configuration
#--------------------------------------------------------------------------

path(
	$HOME/.composer/vendor/bin
	/usr/local/sbin,
	$HOME/Library/Application Support/fnm
)

eval "`fnm env`"

#--------------------------------------------------------------------------
# Aliases
#--------------------------------------------------------------------------

alias vim=nvm

# Laravel
alias a="php artisan"
alias mfs="php artisan migrate:fresh --seed"

# Git
alias wip='git add .;git commit -m "wip";git push'
alias nah='git reset --hard && git clean -df'

#--------------------------------------------------------------------------
# Miscellaneous
#--------------------------------------------------------------------------

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes
