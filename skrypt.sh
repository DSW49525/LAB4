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

# Funkcja inicjalizująca repozytorium
init_repository() {
    local repo_url="<adres_repozytorium>"
    local repo_dir=$(pwd)

    # Klonowanie repozytorium
    git clone $repo_url $repo_dir

    # Ustawienie ścieżki w zmiennej środowiskowej PATH
    export PATH=$PATH:$repo_dir
}

# Funkcja wyświetlająca pomoc
show_help() {
    echo "Użycie: skrypt.sh [OPCJA]"
    echo "Opcje:"
    echo "  --date, -d         Wyświetla dzisiejszą datę"
    echo "  --ignore       Tworzy plik .gitignore ignorujący pliki z nazwą zawierającą 'log'"
    echo "  --logs, -l [N]     Tworzy pliki log (domyślnie 100 lub podana liczba N)"
    echo "  --help, -h         Wyświetla pomoc"
    echo "  --init             Klonuje całe repozytorium i ustawia ścieżkę w zmiennej środowiskowej PATH"
}



# Wybieranie odpowiedniej akcji na podstawie argumentu
case "$1" in
    --date | -d)
        show_date
        ;;
    --ignore)
        create_gitignore
        ;;
    --logs | -l)
        create_logs "$2"
        ;;
    --help | -h)
        show_help
        ;;
    --init)
        init_repository
    *)
        echo "Nieznana opcja. Użyj --help, aby uzyskać pomoc."
        exit 1
        ;;
esac