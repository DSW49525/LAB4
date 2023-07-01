#!/bin/bash

# Funkcja wyświetlająca dzisiejszą datę
show_date() {
    date
}

# Funkcja tworząca plik .gitignore
create_gitignore() {
    echo "*log*" > .gitignore
}