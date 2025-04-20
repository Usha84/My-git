#!/bin/bash

echo "Choose an option:"
echo "1) Show current date"
echo "2) Show current directory"
echo "3) List files"
echo "4) List of sheels"
echo "5) current shell"
echo "6) exit"

read -p "Enter your choice [1-4]: " choice

case "$choice" in
  1)
    echo "📅 Current date is: $(date)"
    ;;
  2)
    echo "📂 Current directory is: $(pwd)"
    ;;
  3)
    echo "📄 Files in this directory:"
    ls -lh
    ;;
  4)
	echo "available shells in linux"
	cat /etc/shells
	;;
  5) echo "present shell is:"
  	echo $SHELL
	;;
  6)	
    echo "👋 Exiting... Goodbye!"
    exit 0
    ;;
  *)
    echo "❌ Invalid choice! Please select a number between 1 and 6."
    ;;
esac

