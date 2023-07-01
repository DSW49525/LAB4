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

# Funkcja wyświetlająca pomoc
show_help() {
    echo "Użycie: skrypt.sh [OPCJA]"
    echo "Opcje:"
    echo "  --date         Wyświetla dzisiejszą datę"
    echo "  --ignore       Tworzy plik .gitignore ignorujący pliki z nazwą zawierającą 'log'"
    echo "  --logs [N]     Tworzy pliki log (domyślnie 100 lub podana liczba N)"
    echo "  --help         Wyświetla pomoc"
}

# Wybieranie odpowiedniej akcji na podstawie argumentu
case "$1" in
    --date)
        show_date
        ;;
    --ignore)
        create_gitignore
        ;;
    --logs)
        create_logs "$2"
        ;;
    --help)
        show_help
        ;;
    *)
        echo "Nieznana opcja. Użyj --help, aby uzyskać pomoc."
        exit 1
        ;;
esac