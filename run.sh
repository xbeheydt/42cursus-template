#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    run.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xbeheydt <xbeheydt@42lausanne.ch>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/29 12:46:55 by xbeheydt          #+#    #+#              #
#    Updated: 2022/03/29 12:46:55 by xbeheydt         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# Global variables =============================================================
GITHUB="https://github.com/xbeheydt"
REPO="${GITHUB}/42cursus-template.git"
PROJECT_TYPE=$1
PROJECT_NAME_LOWER=$2
PROJECT_NAME_UPPER=${PROJECT_NAME_LOWER^^}
PROJECT_NAME="42cursus-${PROJECT_NAME_LOWER}"
MODE=$3

# Functions ====================================================================
download () {
	if [[ "$MODE" == "--local" ]]
	then
		mkdir ${PROJECT_NAME}
		cp -R * ${PROJECT_NAME}
	else
    	git clone https://github.com/xbeheydt/42cursus-template ${PROJECT_NAME}
	fi
    rm -rf ${PROJECT_NAME}/.git
}

renamer () {
    FILES=$(find ${PROJECT_NAME} -type f)
    for file in ${FILES}
    do
        sed -i "s/{{project_name}}/${PROJECT_NAME_LOWER}/g" $file
        sed -i "s/{{PROJECT_NAME}}/${PROJECT_NAME_UPPER}/g" $file
    done
    mv "./${PROJECT_NAME}/src/{{project_name}}.c" "${PROJECT_NAME}/src/${PROJECT_NAME_LOWER}.c"
    mv "./${PROJECT_NAME}/include/{{project_name}}.h" "${PROJECT_NAME}/include/${PROJECT_NAME_LOWER}.h"
}

cleaner () {
    rm ${PROJECT_NAME}/run.sh
    rm ${PROJECT_NAME}/README.md
    rm -rf ${PROJECT_NAME}/.git
    if [[ "$PROJECT_TYPE" == "lib" ]]
    then
        rm "${PROJECT_NAME}/Makefile.exe"
        mv "${PROJECT_NAME}/Makefile.lib" "${PROJECT_NAME}/Makefile"
    fi
    if [[ "$PROJECT_TYPE" == "exe" ]]
    then
        rm "${PROJECT_NAME}/Makefile.lib"
        mv "${PROJECT_NAME}/Makefile.exe" "${PROJECT_NAME}/Makefile"
    fi
    mv ${PROJECT_NAME}/README.template ${PROJECT_NAME}/README.md
}

init-repo () {
    cd ${PROJECT_NAME}
    git init
    git remote add origin "${GITHUB}/${PROJECT_NAME}.git"
    git add .
    git commit -m "Initial commit"
    #git push --set-upstream origin master
}

# Main =========================================================================
download
renamer
cleaner
init-repo