To rename the branch we're currently on, we use the command `git branch -m new-name`. For example, to rename the current branch we're on to `updated-login-feature`, we run:

```bash
git branch -m updated-login-feature
```

To rename a branch that we're not currently on, we can specify the current branch name as the first argument and the new one as the second argument. For example, to rename the branch `fix-header-issue` to `header-fix`, we run:

```bash
git branch -m fix-header-issue header-fix
```
