#! /bin/bash
#
####################################################
# Author      : longbin
# Created date: 2023-06-20 21:58:48
####################################################

# 版本要求
# Python >= 3.9.0
# Bazel >= 3.7.2, (< 4.0.0 for iOS)
# GCC/G++ >= 8.0.0 (Linux, macOS)

# 1. OpenCV3安装
# cd mediapipe
# chmod +x setup_opencv.sh
# ./setup_opencv.sh

# 如果安装libdc1394-22-dev失败，则把脚本中libdc1394-22-dev改为libdc1394-dev

# 2. 安装MediaPipe所需依赖库
# pip --default-timeout=1000 install -r requirements.txt

# 3. Bazel下载与安装
# Bazel下载地址 https://github.com/bazelbuild/bazel/tags
# 以下载 4.2.1 版本为例 https://github.com/bazelbuild/bazel/releases/tag/4.2.1

# Bazel 安装：
# bash bazel-4.2.1-installer-linux-x86_64.sh --user

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

