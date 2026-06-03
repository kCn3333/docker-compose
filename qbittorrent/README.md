# qBittorrent + Subliminal

Automatyczne pobieranie napisów (Subliminal) bezpośrednio wewnątrz oficjalnego kontenera qBittorrent (LinuxServer) po zakończeniu pobierania torrenta. 

## 1. Struktura katalogów na hoście

```text
/home/kcn/
├── .config/
│   └── subliminal/
│       └── subliminal.toml
└── docker/
    └── qbittorrent/
        └── appdata/
            └── install-subliminal.sh
```
### Konfiguracja Subliminal 

`/home/kcn/.config/subliminal/subliminal.toml`

## 2. Uprawnienia skryptu

Ze względów bezpieczeństwa kontener wymaga, aby skrypt należał do root i był wykonywalny:

```bash
sudo chown root:root /home/kcn/docker/qbittorrent/appdata/install-subliminal.sh
chmod +x /home/kcn/docker/qbittorrent/appdata/install-subliminal.sh
```

## 3. Automatyzacja w GUI qBittorrent

- Po uruchomieniu stacku i zalogowaniu się do WebUI **http://IP_SERWERA:8999**:

- Przejdź do: **Tools -> Options -> Downloads** (Narzędzia -> Opcje -> Pobieranie).

- Na samym dole zaznacz: **"Run external program on torrent completion"** (Uruchom zewnętrzny program po zakończeniu torrenta).

- Wklej poniższą komendę (wraz z cudzysłowem dla %F):

`subliminal --config /config/.config/subliminal/subliminal.toml download -l pl "%F"`

- Kliknij **Save** (Zapisz).

## 4. Jak to działa w praktyce?
Pobranie filmu: qBittorrent kończy pobieranie -> podstawia ścieżkę pod %F -> odpala Subliminala z jawnym wskazaniem pliku config.

