Committing in Git is like saving a snapshot of our changes. It allows us to track the progress of our project and revert to previous states if needed. Let's look at how we can commit changes in Git.

**Check Status**: Before we start, we use git status to see which files have changes that are staged for the next commit. It's a good practice to check git status before committing to make sure we're committing only the changes we intend to.

```bash
git status
```

**Stage Changes**: Before we can commit changes, we need to stage them. As we learned in the previous chapter, we use the command `git add` to stage changes. For example, to stage all changes in the current repository, we run:

```bash
git add -A
```

**Commit Changes**: To commit changes, we use the command `git commit`. Remember, only the changes that have been staged will be committed. Let's look at some examples to understand this better.

- To commit all the staged changes with a message, we run:

```bash
git commit -m "Add new feature"
```

- To commit specific files with a message, we list the filenames after `git commit`. For example, to commit the `index.html` file with a message, we run:

```bash
git commit -m "Update index.html" index.html
```

- To commit all changes, including untracked files, we use `git commit -a`. For example, to commit all changes with a message, we run:

```bash
git commit -a -m "Commit all changes"
```

After committing, Git will save the changes to the repository, and we can continue working on our project.
