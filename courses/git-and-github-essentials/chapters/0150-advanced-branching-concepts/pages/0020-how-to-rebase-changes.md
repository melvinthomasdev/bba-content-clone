Git rebase is a command that allows us to move or combine a sequence of commits to a new base commit.

<image alt="Git rebase visualization">git-rebase-visualization.svg</image>

Here's a simple example of how to rebase changes.

Let's consider the same branches: `feature-login` and `feature-signup`. We've made changes in both branches and want to rebase them onto the `main` branch.

1. **Rebase**: We start by rebasing `feature-login` onto `main`. This moves all the changes we made in `feature-login` onto the tip of `main`, as if we made them there in the first place.

```bash
git checkout feature-login
git rebase main
```

2. **Merge**: After rebasing, we merge `feature-login` into `main`. Now, all the changes we made in `feature-login` are in the `main` branch, and the commit history is linear.

```bash
git checkout main
git merge feature-login
```

3. **Update Feature Branch**: Next, we want to make sure `feature-signup` has the latest changes from `main`. So, we rebase `main` onto `feature-signup`.

```bash
git checkout feature-signup
git rebase main
```

4. **Result**: Now, `feature-signup` has all the changes from `main`, including the changes we originally made in `feature-login`. This ensures that when we're working on `feature-signup`, we're doing so with the most up-to-date code.

In essence, `git rebase` allows us to maintain a linear project history by moving our feature branch changes onto the tip of the `main` branch. This makes our project history easier to understand.
