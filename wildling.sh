#!/bin/bash

projectname="$1"
deviceport="/dev/ttyUSB3"

BASETEMPLATE="http://192.168.1.59:3002/jdowning/wildbits-basic-template.git"

wildbits_banner() {
    local -a art=(
        '█   █ █████ █     ████  ████  █████ █████  ████'
        '█   █   █   █     █   █ █   █   █     █   █'
        '█ █ █   █   █     █   █ ████    █     █    ███'
        '██ ██   █   █     █   █ █   █   █     █       █'
        '█   █ █████ █████ ████  ████  █████   █   ████'
    )

    local -a colors=(196 208 226 82 51)
    local i

    printf '\n'

    for i in "${!art[@]}"; do
        if [[ -t 1 && ${TERM:-dumb} != dumb && ! -v NO_COLOR ]]; then
            printf '\033[1;38;5;%sm%s\033[0m\n' \
                "${colors[i]}" "${art[i]}"
            sleep 0.06
        else
            printf '%s\n' "${art[i]}"
        fi
    done

    printf '\n'
}

wildbits_banner

printf 'Creating your Wildbits starter project...\n'


if [ -z "$projectname" ]; then
	echo "Error: You must specific a project name." >&2
	exit 1
fi

echo "Creating project: $projectname"

if [ -d "./$projectname" ]; then
	echo "Directory already exists. Applying changes to existing dir."
	cd $projectname
	git pull
	cd ..
else
	echo "Writing basic starting template to $projectname"
	git clone "$BASETEMPLATE" "$projectname"
fi

cd "$projectname"

python3 fnxmgr.zip --list-ports

output=""

until [[ -n $output ]]; do
	echo "I need to see what port the device is on, if I ask again assume I couldn't reach it...."
	read -e -p "While device port should I use? [$deviceport]:" -i "$deviceport" deviceport
	echo "Trying to communicate with port...."
	output=$(timeout 5 python3 fnxmgr.zip --port "$deviceport" --revision)
done


echo "Received: $output"
echo "Device is on $deviceport. Setting up your foenixmgr.ini"

sed -i "s#^port=.*#port=${deviceport}#" foenixmgr.ini

echo "Configuring build script for project name"

sed -i "s#projectname=.*#projectname=${projectname}#" build.sh

wildbits_banner

echo "You are all setup! Enter your $projectname dir and run build.sh to test!"

