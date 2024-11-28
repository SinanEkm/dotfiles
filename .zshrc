# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:~/flutter/flutter/bin
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
export PATH=/opt/homebrew/bin:$PATH 

#export CC=/opt/homebrew/opt/llvm/bin/clang
#export CXX=/opt/homebrew/opt/llvm/bin/clang++
#export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

zstyle ':omz:update' frequency 21

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(git
    zsh-syntax-highlighting
    zsh-autosuggestions
    fzf)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# python
alias python=python3

# git
alias gs="git status"

# map exa commands to normal ls commands
alias ll="exa -l -g --icons"
alias ls="exa --icons"
alias lt="exa --tree --icons -a -I '.git|__pycache__|.mypy_cache|.ipynb_checkpoints'"
# alias vim=nvim
alias vim=~/./nvim-macos/bin/nvim
# show file previews for fzf using bat
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias SSH_SIMULA="ssh -AY2C sinane@dnat.simula.no -p 60441"
alias SSH_BSC="ssh koc037305@alogin2.bsc.es"
alias SSH_ex3="ssh -i /Users/sinanekmekcibasi/.ssh/simula sinane@srl-login1.ex3.simula.no"
alias SSH_TITAN="ssh sinan@172.23.120.36"
alias SSH_Karolina="ssh -i /Users/sinanekmekcibasi/.ssh/karolina3 it4i-sinan@karolina.it4i.cz"
alias SSH_A100="ssh sekmekcibasi23@172.20.31.90"
alias SSH_AMD="ssh sekmekcibasi23@172.20.31.89"
alias SSH_LUMI="ssh -i /Users/sinanekmekcibasi/.ssh/lumi ekmekcib@lumi.csc.fi"
alias python=/opt/homebrew/bin/python3.11

autoload -Uz compinit && compinit
bindkey '^I' complete-word
zstyle -e ':completion:*' command-path 'reply=( "$PWD/bin" "$path[@]" )'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

function unzip_d () {
    zipfile="$1"
    zipdir=${1%.zip}
    unzip -d "$zipdir" "$zipfile"
}

function cppCompileFlags() {
    echo "-std=c++11\n-I\n/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include" > compile_flags.txt
}
function cpp_omp() {
    clang++ -Xpreprocessor -fopenmp -L/opt/homebrew/opt/libomp/lib -I/opt/homebrew/opt/libomp/include -lomp $1 -o $2
}
function bsc_transfer(){
    scp -r $1 koc037305@transfer1.bsc.es:/home/koc/koc037305/
}
export PATH=/Users/sinanekmekcibasi/Library/Python/3.9/bin:$PATH
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

