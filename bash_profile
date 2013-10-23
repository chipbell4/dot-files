#!/bin/bash

function git-branch-name {
 git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3,4
}

function git-branch-prompt {
 local branch=`git-branch-name`
 if [ $branch ]; then printf " [%s]" $branch; fi
}

function push-key {
	ssh $1 "echo '`cat ~/.ssh/id_rsa.pub`' >> ~/.ssh/authorized_keys"
}

function serve {
	# specify the port as the first argument
	# if no argument is specified, use 1337
	local port="$1"
	if [ -z "$port" ]; then
		port="1337"
	fi

	if [ -z "$(php -v | grep 5.4)" ]; then 
		# Don't have PHP 5.4 installed, so we use the Python server instead
		python -m SimpleHTTPServer $port
	else 
		php -S localhost:$port
	fi
}

PS1="\[\033[0;36m\]\W\[\033[0m\]\[\033[0;32m\]\$(git-branch-prompt)\[\033[0m\] \$ "

# if i've defined a extra profile file, source that as well
if [ -f ~/.profile ]; then
	source ~/.profile
fi
