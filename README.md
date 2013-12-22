#dotfiles
## Installation
Link `.vimrc` to `~/.vimrc` with:
```
ln -s ~/dotfiles/.vimrc ~/.vimrc
```

Install [vundle](https://github.com/gmarik/vundle):
```
$ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

Get all vim plugins by executing (in vim):
```
:BundleInstall
```

To use powerline fonts, execute `install-powerline-fonts.sh` and
select a powerline font in the terminal preferences (for example
`Droid Sans Mono for Powerline`).
