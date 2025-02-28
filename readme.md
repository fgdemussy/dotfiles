# Setup with stow

## First, install programs with homebrew

Store currently installed brew packages in a file.

```bash
brew leaves > homebrew/leaves.txt
```

Install packages in leaves.txt.

```bash
xargs brew install < homebrew/leaves.txt
```

## Then use stow to symlink dotfiles

```bash
# run inside dotfiles directory
stow lazygit kitty nvim ssh starship

# if you want to specify target directory
stow [package] -t ~/.config
```
