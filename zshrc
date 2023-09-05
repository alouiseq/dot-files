PROMPT="%F{green}%n@%m%f:%F{blue}%~%f$ "

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git

precmd() { 
    vcs_info
    PROMPT="%F{green}%n@%m:%F{blue}%~%f ${vcs_info_msg_0_} $ "
}

ZSH_THEME="agnoster"

plugins=( [plugins...] zsh-syntax-highlighting)
plugins=( [plugins...] zsh-autosuggestions)

alias ll="ls -l"
alias la="ls -a"

