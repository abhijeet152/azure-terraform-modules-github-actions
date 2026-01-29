# Terraform-githubactions-diff-env

# Setup vscode and github.

1. Check if you have an SSH key. Run the following in your terminal: `ls -al ~/.ssh`

2. Add your ssh key to the ssh-agent
        
        # Start the ssh-agent
        eval "$(ssh-agent -s)"

        # Add your key
        ssh-add ~/.ssh/id_rsa  # or id_rsa if using RSA
        

3. Add SSH key to GitHub. Copy the public key to your clipboard: `cat ~/.ssh/id_ed25519.pub`

4. Test ssh connection: `ssh -T git@github.com`

5. Correct the remote URL. Ensure your repository remote uses SSH:

        git remote -v
        git remote set-url origin git@github.com:username/repository.git
    

6. Push to repository. Now try pushing again: `git push --set-upstream origin main`
