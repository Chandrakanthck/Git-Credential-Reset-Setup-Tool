#!/bin/bash

git credential-cache exit 2>/dev/null
rm -f ~/.git-credentials
git config --global --unset credential.helper

rm -f ~/.ssh/id_rsa ~/.ssh/id_rsa.pub
read -p "Enter your email for the SSH key: " email
ssh-keygen -t rsa -b 4096 -C "$email" -f ~/.ssh/id_rsa -N ""

echo "public SSH key:"
cat ~/.ssh/id_rsa.pub
read -p "Press Enter after you have added the SSH key to your Git hosting service..."

echo "Testing SSH connection..."
ssh -T git@github.com || ssh -T git@gitlab.com || true

read -p "Enter your Git username: " username
read -p "Enter your Git email: " email
read -p "Enter your Git remote repository URL : " repo_url

git config --global user.name "$username"
git config --global user.email "$email"
echo "Git global config updated with usrnme: $username and email: $email"

read -p "Do you want to store your Git password for HTTPS authentication? (y/n): " store_credentials
if [ "$store_credentials" = "y" ] || [ "$store_credentials" = "Y" ]; then
    git config --global credential.helper store
    echo "Git credential helper set to store passwords."
fi

echo "Adding remote repo,,,"
git remote set-url origin "$repo_url" 2>/dev/null || git remote add origin "$repo_url"
echo "Remote repository set to $repo_url"

echo "Verifying Git configuration..."
echo "Current Git username: $(git config --global user.name)"
echo "Current Git email: $(git config --global user.email)"
echo "Current remote origin URL: $(git remote get-url origin 2>/dev/null || echo 'Not set')"

echo "Setup complete! You can now use Git with your new credentials."
echo "If you use SSH, ensure your SSH agent is running with: eval \$(ssh-agent) && ssh-add ~/.ssh/id_rsa"