# dotfiles
This repository contains all my configuration files, also known as dotfiles.

![screenshot](https://user-images.githubusercontent.com/119128146/209169687-9c094c84-cf0e-4ae8-a2c0-a38bf554356c.png)

# What are dotfiles?
Dotfiles are files in Unix-based systems that start with a dot (.) and contain configuration settings for various tools and applications. These files are hidden by default, but can be made visible by changing the settings in your file manager or terminal.

# Why use a repository for dotfiles?
Having a repository for your dotfiles makes it easier to manage, backup and transfer your configurations between different systems. It also makes it easier to share your configurations with others and collaborate on improving them.

# What's included in this repository?
This repository includes configuration files for various tools and applications such as:
- Shell (e.g. .bashrc, .zshrc)
- Terminal emulator (e.g. .hyper.js)
- Text editor (e.g. .vimrc, .nvimrc)
- Window manager (e.g. .i3/config, .xinitrc)
- And more!

# How to use this repository?
1. Clone the repository to your local system using `git clone https://github.com/ziotonak/dotfiles.git`.
2. Navigate to the repository directory using `cd dotfiles`.
3. Create symlinks for the configuration files in your home directory using `ln -s [dotfiles repository path]/[file] [home directory path]/[file]`.
4. Reload your shell or restart the application to apply the changes.

Note: Before creating the symlinks, it's a good idea to backup your existing configuration files in case you want to revert to the previous settings.

# Contributions
Feel free to fork this repository, make changes, and submit a pull request.
