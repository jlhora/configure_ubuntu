sudo apt-get update

echo 'installing curl' 
sudo apt install curl -y

echo 'installing git' 
sudo apt install git -y

echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"jlhora\""
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear 

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"joaao_luiz@hotmail.com\""
read git_config_user_email
git config --global user.email $git_config_user_email
clear

echo "Can I set VIM as your default GIT editor for you? (y/n)"
read git_core_editor_to_vim
if echo "$git_core_editor_to_vim" | grep -iq "^y" ;then
	git config --global core.editor vim
else
	echo "Okay, no problem. :) Let's move on!"
fi

echo 'enabling workspaces for both screens' 
gsettings set org.gnome.mutter workspaces-only-on-primary false

echo 'installing tool to handle clipboard via CLI'
sudo apt-get install xclip -y

export alias pbcopy='xclip -selection clipboard'
export alias pbpaste='xclip -selection clipboard -o'
source ~/.zshrc

echo 'installing vim'
sudo apt install vim -y
clear

echo 'installing code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiders

echo 'installing extensions'
code --install-extension dbaeumer.vscode-eslint
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension dracula-theme.theme-dracula
code --install-extension esbenp.prettier-vscode
code --install-extension foxundermoon.shell-format
code --install-extension pmneo.tsimporter
code --install-extension waderyan.gitblame
code --install-extension yzhang.markdown-all-in-one

echo 'installing spotify' 
snap install spotify

echo 'installing chrome' 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'installing nvm' 
sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash)"

export NVM_DIR="$HOME/.nvm" && (
git clone https://github.com/creationix/nvm.git "$NVM_DIR"
cd "$NVM_DIR"
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source ~/.zshrc
nvm --version
nvm install 12
nvm alias default 12
node --version
npm --version

echo 'installing autosuggestions' 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
source ~/.zshrc

echo 'installing slack' 
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.8-amd64.deb
sudo apt install ./slack-desktop-*.deb -y

echo 'installing terminator'
sudo apt-get update
sudo apt-get install terminator -y

echo 'installing docker' 
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version

chmod 777 /var/run/docker.sock
docker run hello-world

echo 'installing docker-compose' 
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo 'installing aws-cli' 
sudo apt-get install awscli -y
aws --version
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
sudo dpkg -i session-manager-plugin.deb
session-manager-plugin --version

echo 'installing teamviewer'
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install -y ./teamviewer_amd64.deb

echo 'installing vnc-viewer'
sudo apt-get install -y --no-install-recommends ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal
sudo apt-get install vnc4server -y 

echo 'installing asbrú-cm'
curl -s https://packagecloud.io/install/repositories/asbru-cm/asbru-cm/script.deb.sh | sudo bash
sudo apt install asbru-cm -y

echo 'installing discord'
cd ~/Downloads 
wget -O discord-0.0.1.deb https://discordapp.com/api/download?platform=linux&format=deb
sudo dpkg -i discord-0.0.1.deb

echo 'installing mongodb'
sudo apt install -y mongodb
echo 'status mongodb'
sudo systemctl start mongodb
sudo systemctl status mongodb


echo 'installing sublime-text3'
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install sublime-text -y

echo 'installing nodejs'
sudo apt-get install nodejs -y
sudo apt-get install npm
echo 'install global packages from npm'
sudo npm i gulp -g
sudo npm i typescript -g
sudo npm i -g webpack-cli
sudo npm i -g webpack
sudo npm install -g npx
sudo npm install -g env-cmd

echo 'installing rabbitMQ'
echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list
curl http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | sudo apt-key add -
apt-get update
sudo apt-get install rabbitmq-server -y
clear

echo 'Do you want to configure RabbitMQ now?? (y|n)'
read configure_rabbitmq
if echo "$configure_rabbitmq" ;then
	echo 'plase Uncomment the limit line (i.e. remove #) before saving and exit by pressing CTRL+X followed with Y.' 
	sleep 30
	sudo nano /etc/default/rabbitmq-server

	echo 'status rabbitmq'
	service rabbitmq-server start
	service rabbitmq-server status
else
	echo "Okay!"
fi

clear 

echo 'installing mysql'
sudo apt install mysql-server -y
sudo apt install mysql-workbench -y

echo 'Do you want to configure MySQL now?? (y|n)'
read configure_mysql
if echo "$configure_mysql" ;then
	sudo mysql_secure_installation
else
	echo "Okay!"
fi


echo 'installing virtualbox'
sudo apt install virtualbox -y
echo 'Do you want to configure virtualbox now?? (y|n)'
read configure_vb
if echo "$configure_vb" ;then
	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get install mokutil
	openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=VirtualBox/"
	sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxdrv)
	sleep 5
	clear
	echo 'read more in --> https://unix.stackexchange.com/questions/327240/virtualbox-not-working-modules-not-working'
	sleep 30
else
	echo "Okay!"
fi



echo 'installing discord'
cd ~/Downloads 
wget -O workbench.deb https://cdn.mysql.com//Downloads/MySQLGUITools/mysql-workbench-community_8.0.20-1ubuntu20.04_amd64.deb
sudo dpkg -i workbench.deb 

echo 'installing SpringMail'
cd ~/Downloads 
wget -O SpringMail.deb https://updates.getmailspring.com/download?platform=linuxDeb
sudo dpkg -i SpringMail.deb 


echo 'installing Java8'
sudo apt install openjdk-8-jdk
clear
java -version
sudo update-alternatives --config java

echo 'Do you want to configure environment now?? (y|n)'
read configure_environment
if echo "$configure_environment" ;then
	echo 'set the text --> JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/bin/"'
	sleep 5
	sudo nano /etc/environment
	source /etc/environment
	clear 
	echo $JAVA_HOME
else
	echo "Okay!"
fi


echo 'installing Maven'
sudo apt update
sudo apt install maven
clear
mvn -version