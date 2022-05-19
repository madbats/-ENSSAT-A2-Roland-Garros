# Roland-Garros

## Installation

Afin d'acc�der aux parties s�curis�es du service, les identifiants et les r�les des utilisateurs doivent �tre ajout�s � la config du serveur.

### server.xml

Dans le fichier de config du serveur server.xml, ajouter la ligne suivante (il doit d�j� y avoir des balises Realm vous pouvez l'ajouter � leur suite)
 
```   
	<Realm className="org.apache.catalina.realm.MemoryRealm" />
```

Cette ligne permettra au service de s�curit� de lire les utilisateurs dans le realm file-realm, qui correspond ici � notre fichier tomcat-users.xml.

### tomcat-users.xml

Dans le fichier de config du serveur tomcat-users.xml, ajouter les r�les matchMaker (requis pour g�rer les matchs) et joueurMaker (requis pour g�rer les matchs).

```
	<role rolename="matchMaker"/>
	<role rolename="joueurMaker"/>
```

Vous pouvez d�sormais rajouter des utilisateurs en sp�cifiant le username, password et r�les (plusieurs r�les peuvent �tre attribu�s � un utilisateur).

```
	<user username="matchMan" password="azerty" roles="matchMaker"/>  	
	<user username="playerMan" password="azerty" roles="joueurMaker"/>  	
	<user username="admin" password="admin" roles="joueurMaker,matchMaker"/>
```

### Upload des csv

Par d�fault l'application est concue pour tourn�e sur un OS Windows. Il faut cr�e � la racine du drive 'C:' un dossier 'upload' dans lequel seront stock� les fichiers upload�.

Pour changer cela il sufit de remplacer "C:\\upload\\" � la ligne 75 du fichier org/roland-garros/controller/EditJoueurs.java , par le chemin absolue que vous souhaitez.