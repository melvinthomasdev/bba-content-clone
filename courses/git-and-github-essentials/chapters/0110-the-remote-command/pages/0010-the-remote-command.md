The `git remote` command lets us manage our set of tracked repositories. Here's how we use it:

1. **List Remote Repositories**: To see a list of our remote repositories, we use `git remote -v`.

2. **Add a remote repository**: We can add a remote repository with git remote add <name> <url>. For example, to add a remote repository named `origin`.

```bash
git remote add origin <url>
```

3. **Remove a remote repository**: To remove a remote repository, we use `git remote remove <name>`. For example, to remove the remote repository named `origin`.

```bash
git remote remove origin
```

4. **Rename a remote repository**: To rename a remote repository, we use `git remote rename <old-name> <new-name>`. For example, to rename the remote repository named `origin` to `production`.

```bash
git remote rename origin production
```
