#!/bin/zsh


print -P "%SRunning bootstrap script%s\n"

if (( $+commands[brew] )); then
    print -P "%F{yellow}Brew already installed%f\n"
else
    print -P "%F{green}Installing brew%f\n"
    /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

print -P "%SInstalling packages from brew%s\n"

brew bundle check || brew bundle 

print -P "\n"

if [ -d "$ZSH" ]; then
    print -P "%S Oh-my-zsh already installed%s\n"
else
    print -P "%SInstalling oh-my-zsh%s\n"
    /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if (( $+commands[sdk] )); then
    print -P "%SDKMAN! Already installed%s\n"
else
    print -P "%SInstalling SDKMAN!%s\n"
    curl -s "https://get.sdkman.io" | zsh
fi

