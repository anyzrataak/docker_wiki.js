Projekt studencki realizujacy encyklopedie muzyczna dedykowana tworczosci Kanye Westa. Portal koncentruje sie na analizie ewolucji stylu muzycznego artysty, ze szczegolnym uwzglednieniem technik samplingu oraz relacji miedzy oryginalnymi utworami a ich wykorzystaniem w produkcji muzycznej Westa.

Wymagania systemowe

Do poprawnego uruchomienia projektu wymagane jest srodowisko kontenerowe. Obslugiwane konfiguracje:
Windows: Docker Desktop z aktywnym WSL2; Linux: silnik Docker oraz Docker Compose; maszyny wirtualne z zainstalowanym silnikiem Docker.


Instrukcja uruchomienia

docker-compose up -d

Dostep do aplikacji: Po uruchomieniu kontenerow aplikacja jest dostepna w przegladarce pod adresem: http://localhost:3000


Zarzadzanie kontenerami

Zatrzymanie aplikacji: docker-compose down

Restart wszystkich uslug: docker-compose restart

Podglad logow systemowych: docker-compose logs -f

Sprawdzenie statusu kontenerow: docker ps

Usuniecie kontenerow wraz z wolumenami danych: docker-compose down -v
