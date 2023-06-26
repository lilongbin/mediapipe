#! /bin/bash
#
####################################################
# Author      : user
# Created date: 2023-06-20 21:58:48
####################################################

build_dir=build
graph_path=mediapipe/graphs/hand_tracking/hand_tracking_desktop_live.pbtxt
graph_path=mediapipe/graphs/hand_tracking/hand_detection_desktop_live.pbtxt
app_name=hand_tracking_cpu
app_path=${build_dir}/${app_name}

function build()
{
    if [ ! -f ${app_path} ] ;then
        [ -d ${build_dir} ] || mkdir -p ${build_dir}
        bash build_desktop_examples.sh -d ${build_dir} -b
    fi
}

function run()
{
    export GLOG_logtostderr=1
    ${app_path} --calculator_graph_config_file=${graph_path}
}

build
run

