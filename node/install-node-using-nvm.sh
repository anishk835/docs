#!/bin/bash

function install_node_version_manager() {
  sudo apt update
  curl -o- https://github.com/nvm-sh/nvm/blob/master/install.sh | bash
  source ~/.bashrc
  nvm --version
}

function get_node_version {
  nvm ls
}

function get_node_version_remote() {
  nvm ls-remote
}

function install_node() {
  nvm install $1
}
