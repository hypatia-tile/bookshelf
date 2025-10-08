# Quick Start Guide

Get started with the bookshelf project in minutes!

## For Users: Reading the Bookshelf

### Clone the Bookshelf with All Books

```bash
git clone --recurse-submodules https://github.com/hypatia-tile/bookshelf.git
cd bookshelf
```

### Clone Without Books (Lighter)

```bash
git clone https://github.com/hypatia-tile/bookshelf.git
cd bookshelf
```

Later, when you want to read specific books:

```bash
# Initialize and download all books
git submodule update --init --recursive

# Or initialize a specific book
git submodule update --init books/<book-name>
```

### List Available Books

```bash
./manage-books.sh list
```

### Check Status of Books

```bash
./manage-books.sh status
```

## For Contributors: Adding Books

### Using the Management Script (Easy)

```bash
# Add your book
./manage-books.sh add https://github.com/your-username/your-book.git your-book

# Commit and push
git commit -m "Add your-book to bookshelf"
git push
```

### Manual Method

```bash
# Add book as submodule
git submodule add https://github.com/your-username/your-book.git books/your-book

# Commit and push
git add .gitmodules books/your-book
git commit -m "Add your-book to bookshelf"
git push
```

## Common Tasks

### Update All Books to Latest

```bash
./manage-books.sh update
git add books/
git commit -m "Update all books to latest versions"
git push
```

### Update a Specific Book

```bash
./manage-books.sh update book-name
git add books/book-name
git commit -m "Update book-name to latest version"
git push
```

### Remove a Book

```bash
./manage-books.sh remove book-name
git commit -m "Remove book-name from bookshelf"
git push
```

## Need Help?

- **Submodule basics**: See [SUBMODULES.md](SUBMODULES.md)
- **Contributing guidelines**: See [CONTRIBUTING.md](CONTRIBUTING.md)
- **Management script help**: Run `./manage-books.sh help`
- **Full documentation**: See [README.md](README.md)

## Troubleshooting

### Empty books directory after cloning?

```bash
git submodule update --init --recursive
```

### Book shows as modified but you didn't change it?

```bash
cd books/<book-name>
git status  # Check what changed
git checkout <commit-hash>  # Reset to expected commit
```

### Can't pull updates?

```bash
git submodule sync  # Sync URLs
git submodule update --init --recursive
```

## Project Structure

```
bookshelf/
├── books/              # Your books live here (as Git submodules)
├── manage-books.sh     # Helper script for managing books
├── README.md           # Full project documentation
├── SUBMODULES.md       # Detailed Git submodules guide
├── CONTRIBUTING.md     # Contribution guidelines
├── QUICK_START.md      # This file
├── .gitmodules         # Submodule configuration (created when books are added)
└── LICENSE             # MIT License
```

## Examples

### Example 1: Clone and Read

```bash
# Clone with all books
git clone --recurse-submodules https://github.com/hypatia-tile/bookshelf.git
cd bookshelf

# List books
ls books/

# Read a book (assuming it's in markdown)
cat books/intro-to-git/README.md
```

### Example 2: Add Your Book

```bash
# Fork the repository on GitHub first

# Clone your fork
git clone https://github.com/YOUR-USERNAME/bookshelf.git
cd bookshelf

# Create a branch
git checkout -b add-my-book

# Add your book
./manage-books.sh add https://github.com/YOUR-USERNAME/my-book.git my-book

# Commit and push
git commit -m "Add my-book to bookshelf"
git push origin add-my-book

# Open a Pull Request on GitHub
```

### Example 3: Update Your Copy

```bash
# Pull latest changes from main repository
git pull origin main

# Update all books to their latest versions
git submodule update --remote --merge

# Or just init/update to the commits specified in the parent
git submodule update --init --recursive
```

## Next Steps

1. **Explore the bookshelf**: Check what books are available
2. **Read the documentation**: Especially [SUBMODULES.md](SUBMODULES.md) for deeper understanding
3. **Add your own book**: Follow the contributing guidelines
4. **Share**: Tell others about interesting books you've found!

Happy reading! 📚
