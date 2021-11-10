alias sudo="sudo "

if [ -x "$(command -v exa)" ]; then
  alias ls="exa -F"
  alias la='exa -aF'
  alias ll="exa -lF --color-scale"
  alias lla="exa -alF --color-scale"
  alias tree="exa --tree"
else
  alias ls="ls -F --color=auto"
  alias la="ls -AF"
  alias ll="ls -hlF"
  alias lla="ls -AhlF"
fi

if [ -x "$(command -v batcat)" ]; then
  alias cat="batcat"
fi

if [ -x "$(command -v nvim)" ]; then
  alias vim="nvim"
fi

if [ -x "$(command -v tldr)" ]; then
  alias tldr="tldr -t base16"
fi

alias grep="grep --color"
alias egrep="egrep --color"
alias fgrep="fgrep --color"
alias diff="diff --color"

alias python="python3"
alias ipython="ipython3"
alias pip="pip3"
alias pypy="pypy3"
