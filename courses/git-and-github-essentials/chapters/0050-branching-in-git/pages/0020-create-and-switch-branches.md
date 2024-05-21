## Check Current Branch

Before creating a new branch, it's good to know where we are. Use git branch to see all the branches in our repository and which one we're currently on.

```bash
git branch
```

<image alt="Git branch command">git-branch-command.png</image>

The branch with an asterisk (\*) next to it is the branch we're currently on. So, in the example above, we're on the `test_branch` branch.

## Creating a New Branch

To create a new branch, we use the git branch command followed by the name of our new branch. For example, to create a branch named new-feature, we would run:

```bash
git branch new-feature
```

## Switching to the New Branch

After creating our new branch, we need to switch to it using `git checkout`. This command will move us to the new branch and update our working directory to reflect the state of the new branch.

```bash
git checkout new-feature
```

Alternatively, we can create and switch to a new branch in one command with:

```bash
git checkout -b new-feature
```
