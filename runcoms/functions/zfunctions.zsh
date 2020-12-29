# GitHub
function ghcr() {
  gh repo create -y --private "$@" && rm -rf "./$1"
  ghq get "$1"
  cd $(ghq list --full-path -e "$1") && code .
}

function fghc() {
  local repos
  repos=$(curl --location --silent --request GET 'https://api.github.com/user/repos?per_page=100' \
  --header 'Accept: application/vnd.github.v3+json' \
  --header 'Authorization: Basic $GITHUB_AUTH_REPO' \
  | jq -r '.[].clone_url')
  local repo 
  repo=$(echo $repos | fzf-tmux --reverse +m)
  [[ -n "$repo" ]] && ghq get $repo
}
