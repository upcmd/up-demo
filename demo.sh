. ./color.rc

run() {
  echo "$Yellow--demo run >>${NC}$BIGreen $@ ${NC}"
  sleep 0.5
  $@
  echo "$Blue--step completed--${NC}"
  read
}


runcat() {
  echo "$Yellow--demo run >>${NC}$Green $@ ${NC}"
  echo "-----------------------------"
  $@
  echo "-----------------------------"
  echo "$Blue--step completed--${NC}"
  read
}


info() {
	msg=$1
	echo "$Green $msg ${NC}\n"
}

pause(){
sleep 1000
}

alias l='ls -alrtG'
# alias cls='clear'
alias cls='printf "\033c"'
cls
info "demo1: create upcmd task skeleton using init command"
info "upcmd usage"
run 'up'
run 'mkdir -p demo'
# sleep 0.2
run cd demo
# sleep 0.2
info "use init command to create a skeleton task and configuration as a start"
run up init
echo "."
l
cls
info "upcmd configuration file(optional)"
runcat highlight upconfig.yml
# sleep 1
info "the skeleton task file"
runcat highlight up.yml
# sleep 0.6
info "hello world! skeleton task execution"
run up ngo
# sleep 1
# pause

# sleep 100
run cd ..
rm -rf ./demo

cls
info "demo2: show the intro demo code and execution"
info "task configuration:"
read
runcat highlight demo.yml
run cp demo.yml up.yml
info "Main task execution"
read
cls
run up ngo
read
# sleep 2
info "run task in verbose levle: vvv to reveal more information"
read
cls
up ngo -v vvv
read
# sleep 2


cls
info "list all task"
run up list
# sleep 2

info "inspect a task"
run up list Main
# sleep 2
echo ".."

cls
info "validate a task will make a dry run without actual execution"
read
up validate Main
# sleep 2
read


cls
info "demo3: use module"
read
cd module-demo
run tree -I .git -a
info "task refers to external module call"
read
runcat highlight up.yml

info "the config with required module settings"
run highlight upconfig.yml
read
cls
info "module sub command as mod"
run up mod --help

info "list all modules"
run up mod list

info "pull defined modules"
run up mod pull
run tree -I .git -a

info "now freeze and lock the modules' versions"
run up mod lock
read
cls

info "probe cmd lists all modules, including the main direct modules and the all indirect modules"
up mod probe

cls
info "task execution to run a module call provided by others"
up ngo

rm -rf ./.upmodules
rm ./modlock.yml

cd ..
read
cls

info "demo4: color print and test driven ..."
run cp assert.yml up.yml
info "task configuration"
runcat highlight up.yml
cls
info "task execution"
run up ngo

info "demo n: please refer to the documentation site for more information"

info "Thank you!"
