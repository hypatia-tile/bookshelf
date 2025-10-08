#!/bin/bash
# Bookshelf Management Script
# This script helps manage books (Git submodules) in the bookshelf

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored messages
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to show usage
show_usage() {
    cat << EOF
Bookshelf Management Script

Usage: $0 <command> [options]

Commands:
  list                List all books in the bookshelf
  status              Show status of all books
  add <url> <name>    Add a new book to the bookshelf
  update [name]       Update book(s) to latest version
  remove <name>       Remove a book from the bookshelf
  sync                Synchronize submodule URLs
  init                Initialize all submodules
  clone-all           Clone the bookshelf with all books
  help                Show this help message

Examples:
  $0 list
  $0 add https://github.com/user/book.git my-book
  $0 update
  $0 update my-book
  $0 remove my-book
  $0 status

EOF
}

# Function to list all books
list_books() {
    print_info "Books in the bookshelf:"
    if [ -f .gitmodules ]; then
        git config --file .gitmodules --get-regexp path | awk '{ print $2 }' | while read -r book; do
            echo "  - $book"
        done
    else
        print_warning "No books found. The bookshelf is empty."
    fi
}

# Function to show status of all books
show_status() {
    print_info "Status of all books:"
    if [ -f .gitmodules ]; then
        git submodule status
    else
        print_warning "No books found. The bookshelf is empty."
    fi
}

# Function to add a new book
add_book() {
    local url=$1
    local name=$2
    
    if [ -z "$url" ] || [ -z "$name" ]; then
        print_error "Both URL and name are required"
        echo "Usage: $0 add <url> <name>"
        exit 1
    fi
    
    print_info "Adding book '$name' from $url"
    git submodule add "$url" "books/$name"
    git add .gitmodules "books/$name"
    print_success "Book '$name' added successfully"
    print_info "Don't forget to commit and push the changes!"
}

# Function to update books
update_books() {
    local name=$1
    
    if [ -z "$name" ]; then
        print_info "Updating all books to their latest versions..."
        git submodule update --remote --merge
        print_success "All books updated successfully"
    else
        print_info "Updating book '$name'..."
        git submodule update --remote --merge "books/$name"
        print_success "Book '$name' updated successfully"
    fi
    print_info "Don't forget to commit and push the changes!"
}

# Function to remove a book
remove_book() {
    local name=$1
    
    if [ -z "$name" ]; then
        print_error "Book name is required"
        echo "Usage: $0 remove <name>"
        exit 1
    fi
    
    local book_path="books/$name"
    
    if [ ! -d "$book_path" ]; then
        print_error "Book '$name' not found in the bookshelf"
        exit 1
    fi
    
    print_info "Removing book '$name'..."
    git submodule deinit -f "$book_path"
    git rm -f "$book_path"
    print_success "Book '$name' removed successfully"
    print_info "Don't forget to commit and push the changes!"
}

# Function to sync submodule URLs
sync_submodules() {
    print_info "Synchronizing submodule URLs..."
    git submodule sync
    print_success "Submodule URLs synchronized"
}

# Function to initialize submodules
init_submodules() {
    print_info "Initializing all submodules..."
    git submodule init
    git submodule update
    print_success "All submodules initialized"
}

# Main script logic
case "${1:-}" in
    list)
        list_books
        ;;
    status)
        show_status
        ;;
    add)
        add_book "$2" "$3"
        ;;
    update)
        update_books "$2"
        ;;
    remove)
        remove_book "$2"
        ;;
    sync)
        sync_submodules
        ;;
    init)
        init_submodules
        ;;
    help|--help|-h)
        show_usage
        ;;
    *)
        print_error "Unknown command: ${1:-}"
        echo ""
        show_usage
        exit 1
        ;;
esac
