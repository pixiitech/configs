alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias grao="git remote add origin"
alias gphm="git push heroku master"
alias gpom="git push origin master"
alias gpgm="git push origin Gregs"
alias gco="git checkout"
alias gpr="git pull -r origin master"
alias teapot="echo I'm a teapot!"
alias gedit='setsid gedit'
alias l5='cd ~/Projects/line5'
alias vim='vim -c :NERDTree'
alias prune='for a in $(git branch --merged | sed "s/..//;/master/d"); do echo branch_name: $a; git branch -d "$a"; done'
<<<<<<< HEAD
=======
alias grit='grep -RI $1 * | head -n 20'
>>>>>>> a43a52830dbae8e9f6671e216ee16bd9ae6589ab
source ~/.local_aliases
