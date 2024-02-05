alias ..='cd ..'

alias vim=nvim

alias ll='ls -lahF'
alias la='ls -A'
alias l='ls -CF'

_load_dotenv() {
    if [ -f .env ]; then
        set -a
        . .env
        set +a
    fi
}

alias de='_load_dotenv'

