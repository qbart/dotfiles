# dotfiles


## configs

### global

```
cd ~/.config/nvim/
ln -s ../../.vimrc init.vim

ln -s ~/projects/dotfiles/.tmux.conf ~/.tmux.conf -f
ln -s ~/projects/dotfiles/.vimrc ~/.vimrc -f
ln -s ~/projects/dotfiles/.bash_aliases ~/.bash_aliases -f
```

### per project

```
ln -s ~/projects/dotfiles/.ctags .ctags -f
```
