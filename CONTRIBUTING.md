# Contributing to Bookshelf

Thank you for your interest in contributing to the bookshelf project! This document provides guidelines for adding books and contributing to the project.

## How to Contribute

### Adding a Book to the Bookshelf

There are several ways to add a book (Git submodule) to this bookshelf:

#### Method 1: Using the Management Script (Recommended)

```bash
# Add a new book
./manage-books.sh add <repository-url> <book-name>

# Example
./manage-books.sh add https://github.com/user/my-book.git my-book

# Commit the changes
git commit -m "Add my-book to bookshelf"

# Push to your fork
git push origin your-branch
```

#### Method 2: Manual Git Submodule Command

```bash
# Add the book as a submodule
git submodule add <repository-url> books/<book-name>

# Stage the changes
git add .gitmodules books/<book-name>

# Commit
git commit -m "Add <book-name> to bookshelf"

# Push
git push origin your-branch
```

### Book Repository Requirements

For a repository to be added as a book, it should:

1. **Be a valid Git repository**: Accessible via HTTPS or SSH
2. **Have appropriate content**: Should contain book-related content (text, markdown, etc.)
3. **Include a README**: Should have a README.md describing the book
4. **Have a license**: Should include appropriate licensing information
5. **Be well-maintained**: Active or complete repositories are preferred

### Pull Request Process

1. **Fork the repository**: Create your own fork of the bookshelf
2. **Create a branch**: `git checkout -b add-book-<book-name>`
3. **Add your book**: Use one of the methods described above
4. **Update documentation**: If necessary, update README.md with information about your book
5. **Test**: Ensure the submodule can be cloned and initialized properly
6. **Commit your changes**: With a clear, descriptive commit message
7. **Push to your fork**: `git push origin add-book-<book-name>`
8. **Submit a Pull Request**: Open a PR from your branch to the main repository

### Pull Request Guidelines

Your pull request should:

- Have a clear title: "Add [Book Name] to bookshelf"
- Include a description with:
  - Brief overview of the book
  - Why it should be added to the bookshelf
  - Link to the book's repository
  - Any relevant additional information

Example PR description:
```markdown
## Add "Introduction to Git" to Bookshelf

This PR adds "Introduction to Git" as a book in the bookshelf.

**Book Details:**
- Repository: https://github.com/user/intro-to-git
- Description: A comprehensive guide to learning Git
- License: MIT
- Status: Complete

This book is a great addition because it provides valuable educational content on Git, which aligns with the bookshelf's focus on technical resources.
```

## Code of Conduct

### Our Standards

- Be respectful and inclusive
- Accept constructive criticism gracefully
- Focus on what is best for the community
- Show empathy towards other community members

### Unacceptable Behavior

- Harassment or discriminatory language
- Trolling, insulting/derogatory comments
- Publishing others' private information
- Other conduct which could reasonably be considered inappropriate

## Questions or Issues?

If you have questions or run into issues:

1. Check the [SUBMODULES.md](SUBMODULES.md) guide for submodule-specific questions
2. Review existing issues to see if your question has been answered
3. Open a new issue with a clear description of your question or problem

## Improving Documentation

Documentation improvements are always welcome! If you find errors, unclear explanations, or have suggestions for better documentation:

1. Open an issue describing the improvement
2. Or submit a PR with your proposed changes
3. Focus on clarity and completeness

## Testing Changes

Before submitting a PR, test your changes:

```bash
# In a clean directory, clone your fork
git clone --recurse-submodules <your-fork-url> test-bookshelf
cd test-bookshelf

# Verify all submodules are present and initialized
git submodule status

# Verify your new book can be accessed
cd books/<your-book-name>
ls -la
```

## Development Workflow

1. Keep your fork up to date with the main repository
2. Create feature branches for your changes
3. Make small, focused commits
4. Write clear commit messages
5. Test your changes before submitting
6. Be responsive to feedback on your PRs

## Commit Message Guidelines

Good commit messages help maintain project history:

```
Add <book-name> to bookshelf

- Add book as Git submodule at books/<book-name>
- Update README with book information (if applicable)
- Verify book initializes correctly
```

## Additional Notes

- **Book Quality**: We aim to include high-quality, useful books
- **Maintenance**: Consider the maintenance status of the book repository
- **Licensing**: Ensure the book has appropriate licensing for inclusion
- **Duplication**: Check if a similar book already exists in the bookshelf

Thank you for contributing to the bookshelf project!
