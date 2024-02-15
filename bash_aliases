alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias rc="bundle exec pry -r ./config/environment"
alias grao="git remote add origin"
alias gphm="git push heroku master"
alias gpom="git push origin master"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcp="git cherry-pick"
alias l5='cd ~/Projects/line5'
alias csp='cd ~/Projects/customer_portal'
# alias prune='for a in $(git branch --merged | sed "s/..//;/master/d"); do echo branch_name: $a; git branch -d "$a"; done'
alias ss='rails server --binding 0.0.0.0'
alias fn='find . -name'
alias wipit="git add .; gc -m 'WIP commit (via wipit)';"
alias unwipit="git reset HEAD^"
alias hrc='heroku run "pry -r ./config/environment" -a'
alias tmux='~/Downloads/tmux-2.5/tmux'
alias bex='bundle exec'
alias dc='docker-compose'
alias megamigrate='rake db:migrate; rake db:rollback; rake db:migrate'
alias grc='git rebase --continue'
alias fixschema='ruby ~/configs/fixschemaver.rb'
alias cuke="ulimit -n 1024; bex cucumber features/quote_wizard && bex rake parallel:features\['admin|customer|shared|dealer'\]"
alias cukeparallel="bex rake parallel:features\['admin|customer|shared|dealer'\]"
alias echoserver="ruby ~/Projects/echo/lib/app.rb"
alias jrdebug="JRUBY_OPTS='-Xcext.enabled=true --debug'"
alias bpr="cd ~/Projects/bumper"
alias sfsv="cd ~/Projects/self-service"
alias ss2='rails server --binding=127.0.0.1 --port=3001'
alias ss3='rails server --binding=127.0.0.1 --port=3002'
alias cucumber='ulimit -n 1024; bundle exec cucumber'
alias rspec='ulimit -n 1024; bundle exec rspec'
alias wpc='NODE_ENV=test RAILS_ENV=test ./bin/rails webpacker:clobber; NODE_ENV=test RAILS_ENV=test ./bin/rails webpacker:compile'
alias fms='foreman start -f Procfile.dev'
alias rake='bundle exec rake'
source ~/.local_aliases
