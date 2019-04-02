# dotfiles


## configs

### global

```
cd ~/.config/nvim/
ln -s ../../.vimrc init.vim

ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf -f
ln -s "$(pwd)/.vimrc" ~/.vimrc -f
ln -s "$(pwd)/.bash_aliases" ~/.bash_aliases -f
ln -s "$(pwd)/.gitconfig" ~/.gitconfig -f
```

### per project

```
ln -s "$(pwd)/.ctags" .ctags -f
```
