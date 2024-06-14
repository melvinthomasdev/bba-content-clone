Pulling changes from GitHub involves a few steps:

**Fetch Changes**: First, we fetch the changes from the remote repository with the command `git fetch origin`. This command gets the latest changes from the 'origin' remote, but it doesn't merge them into our local branch.

**Check Changes**: We can check what changes have been made on the remote repository by using the command `git diff main origin/main`. This command shows the differences between our local 'main' branch and the 'main' branch on the remote repository.

**Pull Changes**: If we're happy with the changes, we can merge them into our local branch with the command `git pull origin main`. This command fetches the changes from the 'origin' remote and merges them into our local 'main' branch.

## Pull from a specific branch

If we want to pull from a specific branch, we can do so with the command

```bash
git pull origin <branch-name>
```

where <branch-name> is the name of the branch we want to pull from.

## Pull all branches

If we want to pull all branches from the remote repository, we can use the command

```bash
git pull origin
```

And that's it! We've successfully pulled the latest changes from GitHub into our local repository. Now, our local code is up-to-date with the code on GitHub.
