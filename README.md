## Zestaw skryptow do obslugi komputera dewelopera dla systemu Debian

`init_system.sh` - skrypt, ktory trzeba wykonac jeden raz na czystym systemie. Zainstaluje wszystkie oprogramowanie, zkopiuje skrypty, stworzy foldery dla deweloperow.\
`create_user.sh` - skrypt, tworzacy nowego uzytkownika. Ustawia haslo (ktore trzeba zmienic po pierwszym zalogowaniu), termin zmiany hasla na 120 dni i kwote na 30GB\
`remove_user.sh` - skrypt, ktory usuwa uzytkownika.\
`cron/` - skrypty, ktore wykonuja sie przez crontab co jakis czas.\
`user/` - skrypty, ktore moga byc wykonywane przez uzytkownikow
