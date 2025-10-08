# Git Submodules Guide

This document provides detailed information about working with Git submodules in the bookshelf project.

## What are Git Submodules?

Git submodules allow you to keep a Git repository as a subdirectory of another Git repository. This lets you clone another repository into your project and keep your commits separate.

## Submodule Basics

### Understanding .gitmodules

The `.gitmodules` file is a configuration file that stores the mapping between the project's URL and the local subdirectory. Here's an example:

```ini
[submodule "books/example-book"]
    path = books/example-book
    url = https://github.com/username/example-book.git
```

### Submodule States

A submodule can be in several states:

1. **Uninitialized**: Submodule is listed in `.gitmodules` but not checked out
2. **Initialized**: Submodule is registered in `.git/config`
3. **Updated**: Submodule working directory contains the correct commit
4. **Modified**: Submodule has uncommitted changes
5. **Ahead/Behind**: Submodule is at a different commit than recorded in parent

## Common Workflows

### Initial Setup

After cloning the bookshelf repository:

```bash
# Initialize local configuration file
git submodule init

# Fetch all data and check out the commit listed in the parent
git submodule update
```

Or do both in one command:

```bash
git submodule update --init --recursive
```

### Checking Submodule Status

```bash
# View status of all submodules
git submodule status

# View detailed status
git submodule foreach git status
```

### Working on a Submodule

```bash
# Navigate to the submodule
cd books/<book-name>

# The submodule is in detached HEAD state by default
# Create a branch to work on
git checkout -b feature-branch

# Make changes, commit them
git add .
git commit -m "Update content"

# Push changes to the submodule's remote
git push origin feature-branch

# Go back to parent repository
cd ../..

# Update the parent to reference the new commit
git add books/<book-name>
git commit -m "Update <book-name> reference"
git push
```

### Updating Submodules

Update all submodules to their latest remote commits:

```bash
git submodule update --remote --merge
```

Update a specific submodule:

```bash
git submodule update --remote --merge books/<book-name>
```

### Pulling Changes from Parent Repository

When you pull changes that include submodule updates:

```bash
# Pull changes
git pull

# Update submodules to match the new commits
git submodule update --init --recursive
```

## Advanced Operations

### Changing Submodule URL

If a submodule's repository URL changes:

```bash
# Update .gitmodules with the new URL
git config -f .gitmodules submodule.books/<book-name>.url <new-url>

# Sync the configuration
git submodule sync

# Update the submodule
git submodule update --init --recursive
```

### Executing Commands in All Submodules

```bash
# Run git pull in all submodules
git submodule foreach git pull origin main

# Run any command in all submodules
git submodule foreach '<command>'
```

### Cloning a Specific Branch of a Submodule

```bash
git submodule add -b <branch-name> <repository-url> books/<book-name>
```

## Troubleshooting

### Submodule Directory is Empty

```bash
git submodule init
git submodule update
```

### Detached HEAD in Submodule

This is normal. Submodules are pinned to specific commits. To work on a submodule:

```bash
cd books/<book-name>
git checkout main  # or any branch
```

### Submodule Shows as Modified

This usually means the submodule is at a different commit than recorded:

```bash
# To accept the current state
cd books/<book-name>
git checkout <commit-hash-shown-in-parent>

# Or to update parent to current state
cd ../..
git add books/<book-name>
git commit -m "Update submodule reference"
```

### Conflicts with Submodules

When conflicts occur with submodule references:

```bash
# View the conflict
git diff

# Choose the correct commit hash and stage it
git add books/<book-name>
git commit
```

## Best Practices

1. **Always commit submodule updates**: When updating a submodule, commit the parent repository change
2. **Document dependencies**: Keep track of why specific commits are referenced
3. **Use branches**: When working in submodules, work on branches, not detached HEAD
4. **Communicate**: Coordinate submodule updates with team members
5. **Consistent updates**: Update all submodules together when possible to maintain consistency
6. **CI/CD**: Configure CI/CD pipelines to handle submodules correctly

## Additional Resources

- [Git Submodules Official Documentation](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- [Pro Git Book - Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- [GitHub Documentation on Submodules](https://github.blog/2016-02-01-working-with-submodules/)

## Quick Reference

| Command | Description |
|---------|-------------|
| `git submodule add <url> <path>` | Add a new submodule |
| `git submodule init` | Initialize submodules |
| `git submodule update` | Update submodules to recorded commits |
| `git submodule update --remote` | Update submodules to latest remote commits |
| `git submodule status` | Show submodule status |
| `git submodule foreach <command>` | Execute command in each submodule |
| `git submodule deinit <path>` | Unregister a submodule |
| `git clone --recurse-submodules <url>` | Clone with all submodules |
| `git submodule sync` | Sync submodule URLs |
