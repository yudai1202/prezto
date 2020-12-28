dir_path="${ZDOTDIR:-$HOME}/.zprezto/runcoms/functions"
for file in $(find $dir_path -maxdepth 1 -name "*.zsh" -type f); do
  source $file
done
