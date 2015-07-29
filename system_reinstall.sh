#Script to reinstall all system applications

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
if hash rvm 2>/dev/null; then
    curl -sSL https://get.rvm.io | bash -s stable --ruby --rails
fi
source ~/.profile

cat <<EOT >> ~/.profile
update() {
    	local brew="brew update; brew upgrade;"
    	local gisty="gisty pull_all; gisty sync_delete"
    	local gem="gem update;"
    	local pip="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U -q"
    	local npm="npm update"
	sh -c $brew$gisty; sudo sh -c $gem$pip
}
EOT

cat <<EOT >> ~/.profile
cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}
EOT

cat <<EOT >> ~/.profile
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}
EOT

cat <<EOT >> ~/.profile
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}
EOT

echo "alias maven=\"command mvn\"" >> ~/.profile
cat <<EOT >> ~/.profile
color_maven() {
  maven $* | sed -e "s/\(\[INFO\]\ \-.*\)/[36;01m\1[m/g" \
               -e "s/\(\[INFO\]\ >>> .*\)/[32;01m\1[m/g" \
               -e "s/\(\[INFO\]\ <<< .*\)/[32;01m\1[m/g" \
               -e "s/\(\[INFO\]\ Building .*\)/[36;01m\1[m/g" \
               -e "s/\(\[INFO\]\ \[.*\)/01m\1[m/g" \
               -e "s/\(\[INFO\]\ BUILD SUCCESS\)/[01;32m\1[m/g" \
               -e "s/\(\[INFO\]\ BUILD FAILURE\)/[01;31m\1[m/g" \
               -e "s/\(\[WARNING\].*\)/[01;33m\1[m/g" \
               -e "s/\(WARN.*\)/[01;33m\1[m/g" \
               -e "s/\(DEBUG.*\)/[01;33m\1[m/g" \
               -e "s/\(\[ERROR\].*\)/[01;31m\1[m/g" \
               -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/[32mTests run: \1[m, Failures: [01;31m\2[m, Errors: [01;31m\3[m, Skipped: [01;33m\4[m/g"
}
EOT
echo "alias mvn=color_maven" >> ~/.profile

sudo easy_install pip
pip install virtualenv

#brew

brew install archey
#archy command
echo "archey --color" >> ~/.profile

brew install cask
brew install git
brew install nodejs
brew install npm
brew install mongodb
brew install flask
brew install docker
brew install vagrant
brew install virtual-box
brew install ocatave
brew install cowsay
brew install sl
brew install fortune
brew install rev
brew install factor
brew install npm
brew install toilet
brew install cmatrix
brew install espeak
brew install aafire
brew install libcurses-perl
brew install rig
brew install pyenv-virtualenv
install_animations(){
    cd /tmp
    curl http://search.cpan.org/CPAN/authors/id/K/KB/KRAUCOM/Term-Animation-2.4.tar.gz
    tar -zxvf Term-Animation-2.4/
    perl Makefile.PL && make && make test
    make install
    curl http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz
    tar -zxvf asciiquarium.tar.gz
    cd asciiquarium_1.1
    cp asciiquarium /usr/local/bin
    chmod 0755 /usr/local/bin/asciiquarium
}
install_animations()
brew install funny-manpages


curl https://install.meteor.com/ | sh
curl https://bootstrap.pypa.io/get-pip.py | python && rm -f get-pip/py
pip install virtualenv
pip install requests
pip install scrappy
pip install nltk
pip install numpy
pip install scipy
pip install nose
pip install sympy

gem install rainbow
gem install lolcat
sudo gem install cocoapods

#brewcask
brew cask install airmail-beta
brew cask install google-chrome
brew cask install steam
brew cask install iterm2
brew cask install istat-menus
brew cask install atom
brew cask install android-studio
brew cask install android-file-transfer
brew cask install brackets
brew cask install daisydisk
brew cask install gimp
brew cask install evernote
brew cask install github
brew cask install julia
brew cask install music-manager
brew cask install the-unarchiver
#Julia command
echo "alias julia=\"exec '/opt/homebrew-cask/Caskroom/julia/0.3.9/Julia-0.3.9.app/Contents/Resources/julia/bin/julia'\"" >> ~/.profile
brew cask install totalterminal
brew cask install postgres
#psql command
echo "PATH=$PATH:$HOME/.rvm/bin:/Applications/Postgres.app/Contents/Versions/9.4/bin" >> ~/.profile
brew cask install r
brew cask install spotify
brew cask install skype
brew cask install sublime-text-3
brew cask install visual-studio-code

npm install -g bower
npm install -g mongodb
npm install -g express

#curl
airmail(){
    cd /Applications
    curl https://rink.hockeyapp.net/api/2/apps/84be85c3331ee1d222fd7f0b59e41b04/app_versions/195?format=zip&avtoken=aab73fd00c42ba0d6669e8efe059b7dcee231cc5 | unzip
    rm -f Airmail_Beta.app.zip
    cd
}
airmail()

goofy(){
    cd /Applications
    curl https://dani.taurus.uberspace.de/goofyapp/download.php | unzip
    rm -f Airmail_Beta.app.zip
    cd
}
goofy()


echo "alias ews=\"ssh -XC -c blowfish-cbc,arcfour sivagna2@remlnx.ews.illinois.edu\""
echo "alias gg=\":(){ :|:& }:\""
echo "alias ls='ls -FG'" >> ~/.profile
echo "export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx" >> ~/.profile
echo "source ~/.profile" >> ~/.bash_profile
echo "toilet -f mono12 -F metal  \"Welcome to your Mac OS X install Naren\"" >> ~/.profile
