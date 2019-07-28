#!/bin/bash
set -e

force_flag=''

print_usage() {
  printf "Usage: Only -f(=force) option is allowed."
}

while getopts 'f' flag; do
  case "${flag}" in
    f) force_flag='true' ;;
    *) print_usage
       exit 1 ;;
  esac
done

# install softwares
brew update
brew bundle --file=../Brewfile

# fish
if [ ! -z ${force_flag} ] || [ ! -f ~/.config/fish/functions/fisher.fish ];then
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fi

# aws
## official tools
if [ ! -z ${force_flag} ] || [ ! -f ~/.aws/cli/alias ];then
    awscli_aliases_temp_dir=$(mktemp -d)
    git clone https://github.com/awslabs/awscli-aliases.git ${awscli_aliases_temp_dir}
    mkdir -p ~/.aws/cli
    cp ${awscli_aliases_temp_dir}/alias ~/.aws/cli/alias
fi

if [ ! -z ${force_flag} ] || [ ! -f /usr/local/bin/ecs-cli ];then
    sudo curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-darwin-amd64-latest
    sudo chmod +x /usr/local/bin/ecs-cli
fi

## 3rd party tools
if [ ! -z ${force_flag} ] || [ ! -f /usr/local/bin/chamber ];then
    CHAMBER_VERSION=v2.3.3
    curl -o /usr/local/bin/chamber -LOs https://github.com/segmentio/chamber/releases/download/${CHAMBER_VERSION}/chamber-${CHAMBER_VERSION}-darwin-amd64
    chmod +x /usr/local/bin/chamber
fi

## docker
ln -Fs /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion /usr/local/etc/bash_completion.d/docker
ln -Fs /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion /usr/local/etc/bash_completion.d/docker-machine
ln -Fs /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion /usr/local/etc/bash_completion.d/docker-compose

## gcloud
gcloud components update --quiet
gcloud components install beta --quiet

## git
git config --global user.name "Hiroaki Ogasawara"
git config --global user.email hiroga1030@gmail.com
git config --global push.default current
if [ ! -z ${force_flag} ] || [ ! -f ~/.git-prompt.sh ];then
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi
if [ ! -z ${force_flag} ] || [ ! -f ~/.git-completion.bash ];then
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi

# node
npm install -g base64-url-cli

## OneDrive
mkdir -p ~/OneDrive\ -\ hiroga/Images/Screenshots/$(uname -n)
defaults write com.apple.screencapture location ~/OneDrive\ -\ hiroga/Images/Screenshots/$(uname -n)

## vim
if [ ! -e ~/vimrc ];then
    git clone https://gist.github.com/1e7ae56f94ea301e9b585663d275ccc4.git ~/vimrc
fi

## VSCode
if [ -e ~/Library/Application\ Support/Code/User ];then
    mv ~/Library/Application\ Support/Code/User ~/Library/Application\ Support/Code/User_$(date "+%Y%m%d%H%M%S")
    git clone https://github.com/hiroga-cc/code_user_settings ~/Library/Application\ Support/Code/User
fi

# private settings
ln -f ./.bash_profile ~/.bash_profile
ln -f ./.bashrc ~/.bashrc
ln -f ./.dockeralias ~/.dockeralias
if [ -e ./.localprofile ];then
    ln -f ./.localprofile ~/.localprofile
fi
