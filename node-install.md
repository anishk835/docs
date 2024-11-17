## Install `nvm` (Node Version Manager) 
Node Version Manager (nvm) is a tool for managing multiple Node.js installations on a single machine.
- brew install nvm
- After installation follow the steps, provided by `brew`
- `mkdir ~/.nvm`
- `export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion`
- Check installation `nvm --version`

## Install node version using `nvm`
- You can now ask NVM which Node versions are available and proceed with the installation steps for Node.js based on the latest version `nvm list-remote`
- nvm install {node version}
