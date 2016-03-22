#dotfiles
## Installation
First download and install the `install_tools.sh` script:
```sh
sh -c "$(wget https://raw.githubusercontent.com/Christof/dotfiles/master/install_tools.sh)"
```
This installs:
- git
- zsh
- oh-my-zsh
- vim

Afterwards it downloads the `dotfiles` repository and calls `install.sh` to create aliases to the config files.

### Vim
Get all vim plugins by executing (in vim):
```
:PluginInstall
```

To use powerline fonts, execute `install-powerline-fonts.sh` and
select a powerline font in the terminal preferences (for example
`Droid Sans Mono for Powerline`).


There are two scripts to customize the settings:
 - `before.vimrc` in which the leader should be defined
 - `after.vimrc` to change user specific settings like the colorscheme


For YouCompleteMe with C/C++ support run:
```
cd ~/.vundle/YouCompleteMe
./install.py --clang-completer --system-libclang --system-boost
```

For YouCompleteMe with JavaScript support run:
```
cd ~/.vundle/tern_for_vim
npm install
```

### Git
The `.gitconfig` file loads a `.gitconfig.user` file which must 
be created manually and should user specific settings like:
```
[user]
  name = Username
  email = username@example.com
[github]
  user = username
```

### Zsh
The zsh settings can be customized in the `.zshrc.user` file
where further paths can be added to PATH.
