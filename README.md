# Git Setup Automation Script

## Overview
This Bash script automates the setup of Git and SSH configurations for a new development environment. It clears existing Git credentials, generates a new SSH key, configures Git with user details, sets up a remote repository, and optionally enables Git credential storage for HTTPS authentication.

## Features
- Clears existing Git credentials and SSH keys.
- Generates a 4096-bit RSA SSH key with user-provided email.
- Configures global Git username and email.
- Sets up a remote repository URL.
- Optionally stores Git credentials for HTTPS authentication.
- Verifies and displays the Git configuration.

## Prerequisites
- Bash environment (Linux, macOS, or WSL on Windows).
- Git installed (`git` command available).
- SSH client installed (`ssh-keygen` and `ssh` commands available).

## Usage
1. Save the script as `git-setup.sh`.
2. Make it executable:
   ```bash
   chmod +x git-setup.sh
   ```
3. Run the script:
   ```bash
   ./git-setup.sh
   ```
4. Follow the prompts to:
   - Enter your email for the SSH key.
   - Add the generated SSH public key to your Git hosting service (e.g., GitHub, GitLab).
   - Provide your Git username, email, and remote repository URL.
   - Choose whether to store Git credentials for HTTPS authentication.

## Example
```bash
$ ./git-setup.sh
Enter your email for the SSH key: user@example.com
Generating public/private rsa key pair.
...
public SSH key:
ssh-rsa AAAAB3NzaC1yc2E... user@example.com
Press Enter after you have added the SSH key to your Git hosting service...
Testing SSH connection...
Hi username! You've successfully authenticated...
Enter your Git username: johndoe
Enter your Git email: user@example.com
Enter your Git remote repository URL: git@github.com:johndoe/my-repo.git
Do you want to store your Git password for HTTPS authentication? (y/n): y
Git credential helper set to store passwords.
Adding remote repo...
Remote repository set to git@github.com:johndoe/my-repo.git
Verifying Git configuration...
Current Git username: johndoe
Current Git email: user@example.com
Current remote origin URL: git@github.com:johndoe/my-repo.git
Setup complete! You can now use Git with your new credentials.
If you use SSH, ensure your SSH agent is running with: eval $(ssh-agent) && ssh-add ~/.ssh/id_rsa
```

## Notes
- The script assumes you have a Git hosting service account (e.g., GitHub, GitLab).
- Ensure your SSH public key is added to your Git hosting service before proceeding with the script.
- For SSH usage, start the SSH agent and add your key as prompted at the end.
- The script attempts to test SSH connections to GitHub and GitLab; it will not fail if neither succeeds.

## License
MIT License. See [LICENSE](LICENSE) for details.
