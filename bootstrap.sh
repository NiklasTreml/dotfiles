# Exit on error
set -e


if [ -z ${GIT_EMAIL+x} ]; then read -p "Enter email (for git): " GIT_EMAIL; else echo "Read GIT_EMAIL from environment"; fi
if [ -z ${GIT_NAME+x} ]; then read -p "Enter name (for git): " GIT_NAME; else echo "Read GIT_NAME from environment"; fi


cd ~

git config --global user.name $GIT_NAME
git config --global user.email $GIT_EMAIL

echo "Installing brew..."
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo '# Set PATH, MANPATH, etc., for Homebrew.' >> $HOME/.bash_profile
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bash_profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


echo "Installing packages..."
brew bundle install

echo "Changing login shell for $USER"
chsh -s /home/linuxbrew/.linuxbrew/bin/zsh $USER

echo "Backing up nvim config..."
echo "Backing up ~/.config/nvim to ~/.config/nvim.bak"
mv ~/.config/nvim ~/.config/nvim.bak
echo "Backing up ~/.local/share/nvim to ~/.local/share/nvim.bak "

mv ~/.local/share/nvim ~/.local/share/nvim.bak
echo "Setting up AstroNvim..."
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim



# Generate ssh key?

echo "All done!"
echo "Please setup your secrets in ~/.env.secrets.example"
zsh