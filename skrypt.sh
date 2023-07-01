#!/bin/bash

# Funkcja wyświetlająca dzisiejszą datę
show_date() {
    date
}

# Funkcja tworząca plik .gitignore
create_gitignore() {
    echo "*log*" > .gitignore
}

# Funkcja tworząca pliki log
create_logs() {
    local num_files=${1:-100}  # Jeśli nie podano liczby plików, domyślnie tworzy 100 plików

    for ((i=1; i<=$num_files; i++)); do
        echo "Nazwa pliku: log$i.txt" > log$i.txt
        echo "Nazwa skryptu: skrypt.sh" >> log$i.txt
        echo "Data utworzenia: $(date)" >> log$i.txt
    done
}