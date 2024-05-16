Git manages our project files through three main states: modified, staged, and committed, which correspond to the workflow steps:

- **Modified**: We've made changes to our files, but these changes are only on our computer. For example, we edit a file called index.html.
- **Staged**: We select the changes we want to save (commit). For example, we stage the index.html file using `git add index.html`. Now, Git knows we want these changes in the next snapshot but hasn't saved them yet.
- **Committed**: By running the `git commit` command, we save the staged changes to Git's database on our computer. This means our changes are securely stored.

These states are part of three sections in a Git project:

1. Working Tree: Our current project files that we can edit.
2. Staging Area (Index): A file that tracks what will be in the next commit.
3. Git Directory: Where Git stores our project's history and metadata.

<image alt="Git basic workflow">git-basic-workflow.png</image>

The workflow is simple: modify files in our working tree, stage the ones we want to commit, and then commit them. This process ensures our project's history is well organized and our changes are safely recorded.
