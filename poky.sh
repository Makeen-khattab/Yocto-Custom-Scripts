#!/usr/bin/bash

# function to open work directory of recipe.

function go_recipe(){

    if (( $# != 1 )); then
        echo "Please Enter recipe name"
        return 1
    fi

    # 1. run bitbake.
    declare RECIPE_WD_PATH
    RECIPE_WD_PATH=`bitbake -e "$1" | grep "^WORKDIR="`

    RECIPE_WD_PATH="${RECIPE_WD_PATH#*=}"
    RECIPE_WD_PATH="${RECIPE_WD_PATH#*\"}"
    RECIPE_WD_PATH="${RECIPE_WD_PATH%\"*}"

    echo "----------- Now you are in '$1' recipe WORKDIR -----------"

    cd "$RECIPE_WD_PATH"
    
    return 0
}


function go_dev(){

    if (( $# != 1 )); then
        echo "Please add recipe name"
        return 1
    fi


    RECIPE_NAME="$1"


    bitbake -c devshell "$RECIPE_NAME"

    return 0    
}


function bblog()
{

    if (( $# != 2 )); then
        echo "Please Enter recipe name and Please Enter task name correctly"
        return 1
    fi

    # 1. run bitbake.
    declare RECIPE_WD_PATH
    RECIPE_WD_PATH=`bitbake -e "$1" | grep "^WORKDIR="`

    RECIPE_WD_PATH="${RECIPE_WD_PATH#*=}" # Remove everything up to and including the first '=' from WORKDIR path
    RECIPE_WD_PATH="${RECIPE_WD_PATH#*\"}" # Remove the leading quote character (") from the path
    RECIPE_WD_PATH="${RECIPE_WD_PATH%\"*}"  # Remove the trailing quote character (") from the path

    echo "----------- Now you are in '$2' log file of recipe '$1' -----------"

    cd "$RECIPE_WD_PATH/temp"

    declare TASK_NAME
    TASK_NAME="$2"    

    gedit log.do*${TASK_NAME}

}

function bbrun()
{

    if (( $# != 2 )); then
        echo "Please Enter recipe name and Please Enter task name correctly"
        return 1
    fi

    # 1. run bitbake.
    declare RECIPE_WD_PATH
    RECIPE_WD_PATH=`bitbake -e "$1" | grep "^WORKDIR="`

    RECIPE_WD_PATH="${RECIPE_WD_PATH#*=}" # Remove everything up to and including the first '=' from WORKDIR path
    RECIPE_WD_PATH="${RECIPE_WD_PATH#*\"}" # Remove the leading quote character (") from the path
    RECIPE_WD_PATH="${RECIPE_WD_PATH%\"*}"  # Remove the trailing quote character (") from the path

    echo "----------- Now you are in '$2' log file of recipe '$1' -----------"

    cd "$RECIPE_WD_PATH/temp"

    declare TASK_NAME
    TASK_NAME="$2"    

    gedit run.do*${TASK_NAME}

}
