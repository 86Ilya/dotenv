# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/ilya/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# My aliases
alias gnome-terminal="gnome-terminal --hide-menu-bari"
alias lcalc='libreoffice --calc'
alias cddoc='cd /home/ilya/Documents'
alias cdp='cd /home/ilya/projects'
alias tailf='tail -f'

alias _vundleinstall='git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
alias restartvpn='sudo /etc/init.d/openvpn restart'

alias tmux='tmux -2'
alias activate='[[ -d env ]] && source env/bin/activate 2>/dev/null || [[ -d .venv ]] && source .venv/bin/activate 2>/dev/null'
alias dprune='docker system prune -f; docker volume prune -f; docker container prune -f'
alias mvideo='ssh iaurov@10.192.2.75'
alias mip='echo 10.192.2.75'
alias curltime="curl -w \"@$HOME/.curl_format.txt\" -o NUL -s "

alias pgadmin='sudo chown -R 5050:5050 /home/ilya/.local/pgadmin_data/ \
		&& docker run -p 5051:80 \
		-e "PGADMIN_DEFAULT_EMAIL=ilya.aurov@gmail.com" \
		-e "PGADMIN_DEFAULT_PASSWORD=SuperSecret" \
		--name pgadmin \
		-v /home/ilya/.local/pgadmin_data/servers.json:/pgadmin4/servers.json \
		-v /home/ilya/.local/pgadmin_data/pgadmin:/var/lib/pgadmin \
		-d --rm dpage/pgadmin4 \
		&& sleep 3 && sudo chmod -R g+r+x /home/ilya/.local/pgadmin_data'
alias swagger='docker run -d -p 8011:8080 swaggerapi/swagger-editor'
#alias psql='docker run -it --rm psql psql'
alias python='python3.8'
alias _vundleinstall='git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'

# my exports

# export TERM=gnome-256color # fix https://vi.stackexchange.com/questions/27399/whats-t-te-and-t-ti-added-by-vim-8
export TERM=xterm-256color
export PSQL_EDITOR='vim'
export PATH=$PATH:/home/ilya/.local/bin:/home/ilya/node_modules/.bin/

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker git-flow postgres tmux)

source $ZSH/oh-my-zsh.sh

# Enable colors and change prompt:
autoload -U colors && colors
autoload -Uz vcs_info
precmd () { vcs_info }
setopt prompt_subst
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
PS1="\$vcs_info_msg_0_$PS1"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/home/ilya/yandex-cloud/path.bash.inc' ]; then source '/home/ilya/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/home/ilya/yandex-cloud/completion.zsh.inc' ]; then source '/home/ilya/yandex-cloud/completion.zsh.inc'; fi

