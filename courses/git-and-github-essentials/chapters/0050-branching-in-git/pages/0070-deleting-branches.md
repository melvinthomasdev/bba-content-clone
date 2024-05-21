To delete a branch that we no longer need, we use `git branch -d branch-name` for a safe delete, which checks if the changes are merged. Make sure we are not on the branch we want to delete. For example, to delete the branch `old-feature-branch`:

```bash
git branch -d old-feature-branch
```

If the branch has unmerged changes, Git will prevent the deletion and show an error like this:

```bash
error: The branch 'old-feature-branch' is not fully merged.
If you are sure you want to delete it, run 'git branch -D old-feature-branch'.
```

If we're sure we want to delete the branch without checking if the changes are merged, we can force delete with `git branch -D branch-name`. Note the capital `D` in the command. For example, to delete the branch `old-feature-branch` without checking if the changes are merged:

```bash
git branch -D old-feature-branch
```
