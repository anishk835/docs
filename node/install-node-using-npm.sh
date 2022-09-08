#!/bin/bash

function install_node_stable() {
  npm cache clean -f
  npm install -g n
  sudo n stable
}

function install_node_latest() {
  npm cache clean -f
  npm install -g n
  sudo n latest
}

function install_node_specific_version() {
  npm cache clean -f
  npm install -g n
  sudo n $1
}
