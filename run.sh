#!/bin/bash


debug_str="import pydevd;pydevd.settrace('localhost', port=8081, stdoutToServer=True, stderrToServer=True)"
# pydevd module path
export PYTHONPATH=/home/shhs/Desktop/user/soft/pycharm-2018.1.4/debug-eggs/pycharm-debug-py3k.egg_FILES

insert_debug_string()
{
    file=$1
    line=$2
    debug_string=$3

    value=`sed -n ${line}p "$file"`

    if [ "$value" != "$debug_string" ]
    then
    echo "++Insert $debug_string in line_${line}++"

    sed "${line}s/^/\n/" -i $file
    sed -i "${line}s:^:${debug_string}:" "$file"
    fi
}

delete_debug_string()
{
    file=$1
    line=$2
    debug_string=$3

    value=`sed -n ${line}p "$file"`
    if [ "$value" = "$debug_string" ]
    then
    echo "--Delete $debug_string in line_${line}--"
    sed "${line}d" -i "$file"
    fi
}

rebuild_POT()
{
    cd POT
    rm -rf build
    python setup.py build_ext --inplace
}

# python3.6 tf_1_6
source $HOME/anaconda3/bin/activate tf_1_6
export LD_LIBRARY_PATH=/usr/local/cudnn-9.0-v7.1/lib64:/usr/local/cuda-9.0/lib64:$LD_LIBRARY_PATH
export PYTHONPATH=POT:$PYTHONPATH

if [ "$1" = build ]
then
#   ./run.sh build
    rebuild_POT

elif [ "$1" = "0_Intro_OT.ipynb" ]
then
#    ./run.sh "0_Intro_OT.ipynb" debug
#    ./run.sh "0_Intro_OT.ipynb" jupyter

    file="0_Intro_OT.py"
    line=22
    if [ $2 = debug ]
    then
        insert_debug_string "$file" $line "$debug_str"
        python "$file"
        delete_debug_string "$file" $line "$debug_str"

    elif [ $2 = jupyter ]
    then
        jupyter notebook --browser google-chrome

    else
        python $file
    fi

elif [ "$1" = "1_DomainAdaptation_sol.ipynb" ]
then
#    ./run.sh "1_DomainAdaptation_sol.ipynb" debug
#    ./run.sh "1_DomainAdaptation_sol.ipynb" jupyter

    file="1_DomainAdaptation_sol.py"
    line=22
    if [ $2 = debug ]
    then
        insert_debug_string "$file" $line "$debug_str"
        python "$file"
        delete_debug_string "$file" $line "$debug_str"

    elif [ $2 = jupyter ]
    then
        jupyter notebook --browser google-chrome

    else
        python $file
    fi

elif [ "$1" = "2_ColorGrading_sol.ipynb" ]
then
#    ./run.sh "2_ColorGrading_sol.ipynb" debug
#    ./run.sh "2_ColorGrading_sol.ipynb" jupyter

    file="2_ColorGrading_sol.py"
    line=20
    if [ $2 = debug ]
    then
        insert_debug_string "$file" $line "$debug_str"
        python "$file"
        delete_debug_string "$file" $line "$debug_str"

    elif [ $2 = jupyter ]
    then
        jupyter notebook --browser google-chrome

    else
        python $file
    fi

elif [ "$1" = "3_WGAN_sol.ipynb" ]
then
#    ./run.sh "3_WGAN_sol.ipynb" debug
#    ./run.sh "3_WGAN_sol.ipynb" jupyter

    file="3_WGAN_sol.py"
    line=40
    if [ $2 = debug ]
    then
        insert_debug_string "$file" $line "$debug_str"
        python "$file"
        delete_debug_string "$file" $line "$debug_str"

    elif [ $2 = jupyter ]
    then
        jupyter notebook --browser google-chrome

    else
        python $file
    fi

elif [ "$1" = "4_WMD_sol.ipynb" ]
then
#    ./run.sh "4_WMD_sol.ipynb" debug
#    ./run.sh "4_WMD_sol.ipynb" jupyter

    file="4_WMD_sol.py"
    line=20
    if [ $2 = debug ]
    then
        insert_debug_string "$file" $line "$debug_str"
        python "$file"
        delete_debug_string "$file" $line "$debug_str"

    elif [ $2 = jupyter ]
    then
        jupyter notebook --browser google-chrome

    else
        python $file
    fi

fi