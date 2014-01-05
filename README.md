#dotfiles
## Installation
Call the `install.sh` script.

Get all vim plugins by executing (in vim):
```
:BundleInstall
```

To use powerline fonts, execute `install-powerline-fonts.sh` and
select a powerline font in the terminal preferences (for example
`Droid Sans Mono for Powerline`).

For YouCompleteMe with C/C++ support run:
```
cd ~/.vundle/YouCompleteMe
./install.sh --clang-completer --system-libclang
```
