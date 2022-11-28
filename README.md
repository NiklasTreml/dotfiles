# Dotfiles

## Requirements
- `git installed`
## Usage
`git clone https://github.com/NiklasTreml/dotfiles.git ~/.bootstrap && cd ~/.bootstrap && ./bootstrap.sh`
## Fonts

### Meslo Nerd font
`brew install --cask homebrew/cask-fonts/font-meslo-lg-nerd-font`
OR [Manually](https://github.com/romkatv/powerlevel10k#manual-font-installation)
### [FiraCode NF](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip)

## Setup nvim
```bash
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync
```