# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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

# --- PROMPT ---
function theme_precmd {
    local TERMWIDTH=$(( COLUMNS - ${ZLE_RPROMPT_INDENT:-1} ))

    PR_FILLBAR=""
    
    local promptsize=${#${(%):---(%n@%m)---()--}}
    local timesize=8
    local pwdsize=${#${(%):-%~}} #no se usa pero lo dejo por si acaso
    local venvpromptsize=$((${#$(virtualenv_prompt_info)})) #no se usa pero lo dejo por si acaso

    PR_FILLBAR="\${(l:$(( TERMWIDTH - (promptsize + timesize) ))::${PR_HBAR}:)}"
}
autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
# Set the prompt
# Need this so the prompt will work.
setopt prompt_subst
# See if we can use colors.
autoload zsh/terminfo
for color in red green yellow blue magenta cyan white grey; do
    typeset -g PR_${color:u}="%F{$color}%B"
    typeset -g PR_LIGHT_${color:u}="%F{$color}"
done
PR_NO_COLOUR="%f%b"
# Use extended characters to look nicer.
PR_SET_CHARSET=""
PR_HBAR="─"
PR_ULCORNER="┌"
PR_LLCORNER="└"
PR_LRCORNER="┘"
PR_URCORNER="┐"
# información de control de versiones (git)
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats " [%{$fg[red]%}%b%{$reset_color%}]"
# entorno virtual de python (si está activo)
prompt_venv() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo "%{$fg[white]%}(${VIRTUAL_ENV:t}) %{$reset_color%}"
    fi
}
# Finally, the prompt.
# PROMPT='${PR_SET_CHARSET}${PR_STITLE}${(e)PR_TITLEBAR}\
# ${PR_CYAN}${PR_ULCORNER}${PR_HBAR}${PR_GREY}(\
# ${PR_GREEN}%n@%m%<...<%<<${PR_GREY})\
# ${PR_CYAN}${PR_HBAR}${PR_HBAR}${(e)PR_FILLBAR}${PR_HBAR}\
# ${PR_GREY}(${PR_GREEN}%D{%H:%M:%S}\
# ${PR_GREY})${PR_CYAN}${PR_HBAR}\

# ${PR_CYAN}${PR_LLCORNER}${PR_CYAN}${PR_HBAR}\
# ${PR_WHITE}$(prompt_venv)${PR_MAGENTA}%~ ${PR_MAGENTA}♡\
# ${PR_NO_COLOUR} '

# # display exitcode on the right when > 0
# return_code="%(?..%{$fg[red]%}%? ↵ %{$reset_color%})"
# RPROMPT=' $return_code${PR_CYAN}${PR_HBAR}${PR_BLUE}${PR_HBAR}\
# (${PR_YELLOW}%D{%a,%b%d}${PR_BLUE})${PR_HBAR}${PR_CYAN}${PR_LRCORNER}${PR_NO_COLOUR}'

# PS2='${PR_CYAN}${PR_HBAR}\
# ${PR_BLUE}${PR_HBAR}(\
# ${PR_LIGHT_GREEN}%_${PR_BLUE})${PR_HBAR}\
# ${PR_CYAN}${PR_HBAR}${PR_NO_COLOUR} '

PROMPT='%{$fg[cyan]%}%T%{$reset_color%} $(prompt_venv)%{$fg[green]%}%n@%m%{$reset_color%}${vcs_info_msg_0_} %{$fg[magenta]%}%~ %{$fg[magenta]%}♡%{$reset_color%} '


typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]="fg=white"
ZSH_HIGHLIGHT_STYLES[command]="fg=white"
ZSH_HIGHLIGHT_STYLES[builtin]='fg=white'
ZSH_HIGHLIGHT_STYLES[alias]='fg=white'
ZSH_HIGHLIGHT_STYLES[path]="fg=white"
ZSH_HIGHLIGHT_STYLES[arg]="fg=blue"
ZSH_HIGHLIGHT_STYLES[string]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=white"
ZSH_HIGHLIGHT_STYLES[function]='fg=green'


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor
export EDITOR='nvim'
export VISUAL='nvim'

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# inicializa fastfetch solo en shell interactiva
if [[ -o INTERACTIVE ]]; then
    clear
    fastfetch
fi