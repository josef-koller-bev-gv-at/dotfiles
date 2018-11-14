# dotfiles

## Installation
To download and install the dotfiles run the following command in your terminal:
```sh
bash <(curl -s https://raw.githubusercontent.com/Christof/dotfiles/master/install_tools.sh)
```

This installs:
- git
- zsh
- oh-my-zsh
- vim

Afterwards it downloads the `dotfiles` repository and calls `install.sh` to create aliases to the config files. Restart the system.
If password-error occurs then restart the system and rerun script. 

### Special Installation Instructions for KDE
If there is no USERNAME variable set, run:
```sh
USERNAME=user123 bash <(curl -s https://raw.githubusercontent.com/Christof/dotfiles/master/install_tools.sh)
```
The zsh installer may tell you to reopen your terminal and `install_tools.sh` stops at this point. The command ...
```sh
chsh -s /bin/zsh user123
```
... changes the login shell for the user user123 to zsh. To finish this adjustment of the user configuration it is necessary to stop the current session and login again. Remove or move your `~/.zshrc` file because it will be replaced by a symbolic link to the local clone of the dotfiles repository. Put your user specific configurations to `~/.zshrc.user` or run
```
cat .bashrc >> .zshrc.user
```

Check the `~/.installed` folder and rerun the installation script using the zsh. 

### Vim
Get all vim plugins by executing (in vim):
```
:PluginInstall
```

To use powerline fonts, execute `~/Documents/sources/dotfiles/install-powerline-fonts.sh` and
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

(do later)
For YouCompleteMe with JavaScript support run:
```
cd ~/.vundle/tern_for_vim
npm install
```

### Git
The `.gitconfig` file loads a `~/.gitconfig.user` file which must 
be created manually and should user specific settings like:
```
[user]
  name = Username
  email = username@example.com
[github]
  user = username
```
You can check this modification with
```
git config user.name
```

#### Gnome Keyring

If you use Github's two factor authentication and want to store the personal access token in the gnome keyring,
install it using the package manager:

```bash
sudo apt-get install libgnome-keyring-dev
```

Afterwards go into the git installation directory `~/Documents/sources/git-.../`. The execute the following commands:

```bash
cd contrib/credential/gnome-keyring
sudo make
sudo cp git-credential-gnome-keyring /usr/local/bin
```

### Zsh
The zsh settings can be customized in the `.zshrc.user` file
where further paths can be added to PATH.

### Tmux (Optional)

Use `install_tmux.sh` script or the package manager, if it contains the same or a newer version:
```
sudo apt-get install tmux tmuxinator 
```
