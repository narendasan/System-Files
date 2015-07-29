update() {
    	local brew="brew update; brew upgrade;"
    	local gisty="gisty pull_all; gisty sync_delete"
    	local gem="gem update;"
    	local pip="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U -q"
    	local npm="npm update"
	sh -c $brew$gisty; sudo sh -c $gem$pip
}
cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}
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
alias maven="command mvn"
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
alias mvn=color_maven
alias ls='ls -FG'
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias startApache="sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist"

source /etc/profile.d/autojump.sh
export PATH="$PATH:$HOME/.rvm/bin:usr/local/bin:usr/bin" # Add RVM to PATH for scripting

archey --color
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias julia="exec '/opt/homebrew-cask/Caskroom/julia/0.3.9/Julia-0.3.9.app/Contents/Resources/julia/bin/julia'"
alias ews="ssh -XC -c blowfish-cbc,arcfour sivagna2@remlnx.ews.illinois.edu"
PATH=/Users/naren/.rvm/gems/ruby-2.2.1/bin:/Users/naren/.rvm/gems/ruby-2.2.1@global/bin:/Users/naren/.rvm/rubies/ruby-2.2.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/naren/.rvm/bin:/Users/naren/.rvm/bin:/Applications/Postgres.app/Contents/Versions/9.4/bin
