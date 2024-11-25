ssh-keygen -t ed25519 -C "amcgail2@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub

read -p "Enter this public key into the account which has access to discourse-PRMERS and press enter to continue"

echo "Running the standard discourse setup script."
echo "This should download and install all requirements for running discourse."
bash <(wget -qO- https://raw.githubusercontent.com/discourse/install-rails/main/linux)