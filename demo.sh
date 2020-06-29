
# Reset
export Color_Off='\033[0m'       # Text Reset
export NC='\033[0m'              # Text Reset

export # Regular Colors
export Black='\033[0;30m'        # Black
export Red='\033[0;31m'          # Red
export Green='\033[0;32m'        # Green
export Yellow='\033[0;33m'       # Yellow
export Blue='\033[0;34m'         # Blue
export Purple='\033[0;35m'       # Purple
export Cyan='\033[0;36m'         # Cyan
export White='\033[0;37m'        # White

export # Bold
export BBlack='\033[1;30m'       # Black
export BRed='\033[1;31m'         # Red
export BGreen='\033[1;32m'       # Green
export BYellow='\033[1;33m'      # Yellow
export BBlue='\033[1;34m'        # Blue
export BPurple='\033[1;35m'      # Purple
export BCyan='\033[1;36m'        # Cyan
export BWhite='\033[1;37m'       # White

export # Underline
export UBlack='\033[4;30m'       # Black
export URed='\033[4;31m'         # Red
export UGreen='\033[4;32m'       # Green
export UYellow='\033[4;33m'      # Yellow
export UBlue='\033[4;34m'        # Blue
export UPurple='\033[4;35m'      # Purple
export UCyan='\033[4;36m'        # Cyan
export UWhite='\033[4;37m'       # White

export # Background
export On_Black='\033[40m'       # Black
export On_Red='\033[41m'         # Red
export On_Green='\033[42m'       # Green
export On_Yellow='\033[43m'      # Yellow
export On_Blue='\033[44m'        # Blue
export On_Purple='\033[45m'      # Purple
export On_Cyan='\033[46m'        # Cyan
export On_White='\033[47m'       # White

export # High Intensity
export IBlack='\033[0;90m'       # Black
export IRed='\033[0;91m'         # Red
export IGreen='\033[0;92m'       # Green
export IYellow='\033[0;93m'      # Yellow
export IBlue='\033[0;94m'        # Blue
export IPurple='\033[0;95m'      # Purple
export ICyan='\033[0;96m'        # Cyan
export IWhite='\033[0;97m'       # White

export # Bold High Intensity
export BIBlack='\033[1;90m'      # Black
export BIRed='\033[1;91m'        # Red
export BIGreen='\033[1;92m'      # Green
export BIYellow='\033[1;93m'     # Yellow
export BIBlue='\033[1;94m'       # Blue
export BIPurple='\033[1;95m'     # Purple
export BICyan='\033[1;96m'       # Cyan
export BIWhite='\033[1;97m'      # White

export # High Intensity backgrounds
export On_IBlack='\033[0;100m'   # Black
export On_IRed='\033[0;101m'     # Red
export On_IGreen='\033[0;102m'   # Green
export On_IYellow='\033[0;103m'  # Yellow
export On_IBlue='\033[0;104m'    # Blue
export On_IPurple='\033[0;105m'  # Purple
export On_ICyan='\033[0;106m'    # Cyan
export On_IWhite='\033[0;107m'   # White

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
run tree
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
run tree

info "now freeze and lock the modules' versions"
run up mod lock
read
cls

info "probe cmd lists all modules, including the main direct modules and the all indirect modules"
up mod probe

cls
info "task execution to run a module call provided by others"
up ngo
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
