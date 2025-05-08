################################################################
####### Function to show the branch name on the terminal #######
################################################################
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

setopt PROMPT_SUBST
export PROMPT='%F{grey}%n%f %F{cyan}%~%f %F{green}$(parse_git_branch)%f %F{normal}$%f '

################################################################
# Git history (https://martinheinz.dev/blog/110?ref=dailydev)
################################################################

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000

HISTORY_IGNORE="ls:cd:pwd:exit:clear:history"
HIST_STAMPS="yyyy-mm-dd"

# https://zsh.sourceforge.io/Doc/Release/Options.html (16.2.4 History)

setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY        # append to history file (Default)
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.

# https://zsh.sourceforge.io/Doc/Release/Options.html (16.2.5 History Expansion)

plugin=(git fzf)

export FZF_DEFAULT_COMMAND='ag --hidden -g ""'

################################################################
# For jenv to change the java home from the command line
################################################################
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"

################################################################
# Manage Node version
################################################################
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


