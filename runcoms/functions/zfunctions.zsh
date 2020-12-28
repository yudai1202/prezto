# GitHub
function ghcr() {
  gh repo create -y --private "$@" && rm -rf "./$1"
  ghq get "$1"
  cd $(ghq list --full-path -e "$1") && code .
}
