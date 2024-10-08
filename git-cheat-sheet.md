# Git cheat sheet

#### Delete local branches which are deleted or merged to the main
```sh
git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
```

#### Decorate git logs
```sh
git log --all --decorate --oneline –graph
git log --graph --pretty="%C(yellow) Hash: %h %C(blue)Date: %ad %C(red) Message: %s " --date=human 
git log --graph --pretty="%ad" --date=short
git log --graph --pretty="%C(yellow) %s"
git log --graph --pretty="%C(bold green) %(ar)"
git log --graph --pretty="%C(bold blue)%h" --decorate –all
```

#### Add function in the bashrc or zshrc to show the branch name on the repo directory
```sh
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

setopt PROMPT_SUBST
export PROMPT='%F{grey}%n%f %F{cyan}%~%f %F{green}$(parse_git_branch)%f %F{normal}$%f '
```
