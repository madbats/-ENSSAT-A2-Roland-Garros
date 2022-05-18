# Roland-Garros

## Installation

Afin d'accéder aux parties sécurisées du service, les identifiants et les rôles des utilisateurs doivent être ajoutés à la config du serveur.

### server.xml

Dans le fichier de config du serveur server.xml, ajouter la ligne suivante (il doit déjà y avoir des balises Realm vous pouvez l'ajouter à leur suite)
 
```   
	<Realm className="org.apache.catalina.realm.MemoryRealm" />
```

Cette ligne permettra au service de sécurité de lire les utilisateurs dans le realm file-realm, qui correspond ici à notre fichier tomcat-users.xml.

### tomcat-users.xml

Dans le fichier de config du serveur tomcat-users.xml, ajouter les rôles matchMaker (requis pour gérer les matchs) et joueurMaker (requis pour gérer les matchs).

```
	<role rolename="matcheMaker"/>
	<role rolename="joueurMaker"/>
```

Vous pouvez désormais rajouter des utilisateurs en spécifiant le username, password et rôles (plusieurs rôles peuvent être attribués à un utilisateur).

```
	<user username="matchMan" password="azerty" roles="matcheMaker"/>  	
	<user username="playerMan" password="azerty" roles="joueurMaker"/>  	
	<user username="admin" password="admin" roles="joueurMaker,matcheMaker"/>
```
