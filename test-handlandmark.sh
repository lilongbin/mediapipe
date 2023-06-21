#! /bin/bash
#
####################################################
# Author      : user
# Created date: 2023-06-20 21:58:48
####################################################

if [ ! -f build/hand_tracking_cpu ] ;then
    [ -d build ] || mkdir -p build
    bash build_desktop_examples.sh -d build -b
fi

export GLOG_logtostderr=1
./build/hand_tracking_cpu \
    --calculator_graph_config_file=mediapipe/graphs/hand_tracking/hand_tracking_desktop_live.pbtxt

