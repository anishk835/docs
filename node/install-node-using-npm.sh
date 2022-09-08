#!/bin/bash

function install_node_stable() {
  _init
  sudo n stable
}

function install_node_latest() {
  _init
  sudo n latest
}

function install_node_specific_version() {
  _init
  sudo n $1
}

function _init() {
  npm cache clean -f
  npm install -g n
}
