# bookshelf

The bookshelf for my reading books

## Overview

This repository serves as a digital bookshelf, using Git submodules to organize and manage a collection of books. Each book is maintained as a separate Git repository and included here as a submodule, demonstrating the power and flexibility of Git submodules for project organization.

## Project Structure

```
bookshelf/
├── books/           # Directory containing book submodules
│   ├── book1/      # Individual book as a Git submodule
│   ├── book2/      # Another book as a Git submodule
│   └── ...
├── README.md       # This file
└── LICENSE         # MIT License
```

## Working with Git Submodules

### Cloning the Bookshelf

When cloning this repository, you have two options:

**Option 1: Clone with all submodules at once**
```bash
git clone --recurse-submodules https://github.com/hypatia-tile/bookshelf.git
```

**Option 2: Clone first, then initialize submodules**
```bash
git clone https://github.com/hypatia-tile/bookshelf.git
cd bookshelf
git submodule init
git submodule update
```

### Adding a New Book (Submodule)

To add a new book to the bookshelf:

```bash
# Add a new book as a submodule
git submodule add <repository-url> books/<book-name>

# Commit the changes
git add .gitmodules books/<book-name>
git commit -m "Add <book-name> to bookshelf"
git push
```

### Updating Books (Submodules)

To update all books to their latest versions:

```bash
git submodule update --remote --merge
```

To update a specific book:

```bash
cd books/<book-name>
git pull origin main
cd ../..
git add books/<book-name>
git commit -m "Update <book-name> to latest version"
git push
```

### Removing a Book (Submodule)

To remove a book from the bookshelf:

```bash
# Remove the submodule entry from .gitmodules
git submodule deinit -f books/<book-name>

# Remove the submodule directory
git rm -f books/<book-name>

# Commit the changes
git commit -m "Remove <book-name> from bookshelf"
git push
```

## Benefits of Using Git Submodules

1. **Modularity**: Each book is maintained independently with its own version control
2. **Selective Updates**: Update individual books without affecting others
3. **Version Pinning**: Lock books to specific versions/commits
4. **Independence**: Books can be developed and maintained separately
5. **Reusability**: Same book can be included in multiple bookshelves

## Testing Git Submodules

This repository serves as a practical example and testing ground for Git submodule functionality, including:

- Adding and removing submodules
- Updating submodules to specific commits
- Working with nested repositories
- Managing submodule dependencies
- Understanding submodule workflows

## Contributing

To add a book to this bookshelf:

1. Ensure your book is in its own Git repository
2. Fork this repository
3. Add your book as a submodule in the `books/` directory
4. Submit a pull request with a description of the book

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
