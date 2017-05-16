alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias grao="git remote add origin"
alias gphm="git push heroku master"
alias gpom="git push origin master"
alias gpgm="git push origin Gregs"
alias gco="git checkout"
alias gcob="git checkout -b"
alias teapot="echo I'm a teapot!"
alias gedit='setsid gedit'
alias l5='cd ~/Projects/line5'
alias vim='vim -c :NERDTree'
alias prune='for a in $(git branch --merged | sed "s/..//;/master/d"); do echo branch_name: $a; git branch -d "$a"; done'
alias ss='rails s thin --binding 127.0.0.1'
alias fn='find . -name'
alias fixtestdb='rails db:environment:set RAILS_ENV=test; rake db:drop RAILS_ENV=test; rake db:create RAILS_ENV=test; rake db:migrate RAILS_ENV=test'
source ~/.local_aliases
alias killthepostmaster='rm ~/Library/Application Support/Postgres/var-9.6/postmaster.pid'
