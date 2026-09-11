# 📘 Git Commands Reference
This repository contains a curated list of essential `git` commands for managing code versioning efficiently. Useful for daily reference and quick lookups.

---

## 🧱 Useful Commands

```bash
# 1. Config Management
git version # Check the installed git version.
git config --global user.name "Your Name" # To save your name globally for git.
git config --global user.email "your.work@company.com" # To save the user email in global config.
git config --list # displays all active Git configuration properties and their assigned values across your system.
git config --list --global # displays all active global Git configuration properties.
git config alias.st status # Add an alias for a command

# 2. Core Git Workflow
git init # Start versioning a new repo.
git clone <url> # Clone an existing repo.

git add . # Stages all changes in the current directory and its subdirectories (new, modified, and deleted files). It is a quick blanket command to prepare everything at once.
git add <file01> <file02> # Stages only the specific files you list.

git branch <branch name> # Create a Branch Without Switching. If you want to create a new branch but remain on your current branch.
git checkout -b <new-branch-name> # If you want to create and switch to a new branch in one go.

git checkout <branch name> # Switches your working directory to the specified branch.
git switch <branch name> # To switch to a branch in modern Git.

git branch -a # Lists all branches available in your project, both local and remote.
git branch -d <branch-name> # Deletes a local branch once you are finished with it and have merged it into main, else use -f flag to delete forcefully.
git push origin -d <branch-name> # To delete the branch from remote repository.

# Branch Naming conventions:
# Stick to lowercase letters, numbers, and hyphens (-) or forward slashes (/). Avoid spaces.
# Good examples: feature/kzb01-1009-01, bugfix/issue-404, hotfix-api-crash

git commit -m "commit_message" # Creates a new commit with a descriptive message.
git commit --amend -m "new_commit_message" # Modifies the most recent commit instead of creating a new one. It replaces the last commit with a new message.
# Warning: Only use --amend if you haven't pushed the commit to a shared remote repository yet.

git push origin <branch name> # Sends your local commits to the specified branch on the remote server (origin).
git push origin # Sends commits to the remote server using Git's default behavior (usually pushing the current branch to its matching tracking branch on origin).
git pull origin <branch name> # Fetches the latest changes from the remote branch and automatically merges them into your current local branch. It keeps your local workspace up to date with your or team's changes.

git status # The most important command in Git. It shows you exactly what branch you are on, which files are modified but unstaged, and what is ready to be committed. Run this constantly.
git log --oneline # Displays a clean, one-line-per-commit history of your project. It is much easier to read than the standard `git log`.
git log --oneline -n 5 # Displays the last 5 commit messages

# 3. Remote Management
git remote -v # Displays a list of all connected remote repositories along with their URLs.
git remote add origin <remote url> # Links your local repository to a remote server (like GitHub, GitLab, or Bitbucket) and names that connection origin.
git remote remove origin # Deletes the link to the remote repository named origin from your local settings.

git fetch origin # Fetches from only the remote named origin, it fetches from only the remote named origin.
git fetch --all # Fetches from all configured remotes. Suppose you git git remote -v and your repository has: origin and upstream.
# So you'll update:
# origin/main
# origin/develop
# ...
# upstream/main
# upstream/develop

git fetch --all --prune # when I want to refresh every remote and clean up stale remote-tracking branches.


# Usecase-01: The "Save My Work Safely" Commands (Stashing)
# Imagine you are in the middle of writing half-broken code on a feature, and your boss asks you to fix a critical bug on main immediately. You aren't ready to commit your broken code, but you can't switch branches while your workspace is messy.

git stash # Temporarily shelves all your current uncommitted changes and clears your workspace, giving you a clean slate to switch branches.
git stash pop # Brings your stashed changes back to life exactly where you left off when you switch back to your feature branch.

# Usecase-02: How to merge main into your branch
## Way-01
git checkout main
git pull origin main

git checkout my-feature
git merge main

git push origin my-feature

## Way-02, more directly: This is preferred because you don't need to modify your local main.
git fetch origin
git checkout my-feature
git merge origin/main # Merges the local remote-tracking branch origin/main into your current local branch my-feature
git push origin my-feature

# Usecase-03: Undo a git commit
## 1. git revert (The Safe "Undo" Button)
# When you run git revert, Git calculates the changes made in a specific bad commit and applies a new commit that reverses those changes (like adding a line if the bad commit deleted one). The Result: Your history looks like this: Commit A → Bad Commit B → Revert Commit C (Fixes B).

git revert <commit-id> # <commit-id> is the commit you want to undo (the bad commit).

# 2. git reset (The Time Machine)
# When you run git reset, you are rewriting history by moving the branch pointer backward to an older commit. It has three modes -

git reset --soft <commit-id> # With git reset, you specify the commit you want HEAD to move to, not necessarily the bad commit itself. Give the last commit you want to keep.
# Moves the history back. It keeps all changes from the erased commits staged and ready in your code editor. (Perfect for rewriting your last local commit).
git reset --mixed <commit-id> # Give the last commit you want to keep.
# (Default) Moves the history back. It keeps all your changes but unstages them.
git reset --hard <commit-id> # Give the last commit you want to keep.
# Dangerous. Destroys the commits and completely wipes out all your uncommitted code. Your project will look exactly as it did at that specific past moment.

## Important Files
# Local git config: .git/config
# Global git config: ~/.gitconfig
# List of files to ignore: .gitignore
```

## 📌 How to Contribute
Feel free to fork this repo and add your favorite git commands!

## References
- https://git-scm.com/cheat-sheet
- https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet
