# docker_evaluation_b_Jean

Exercice 1 : Introduction à Docker

🔹 1. Qu'est-ce que Docker ?

Docker est un environnement d'exécution permettant de regrouper les composants nécessaires pour un projet informatique, tels que les dépendances et les bibliothèques. Il offre un environnement de développement prêt à l'emploi en quelques clics.

🔹 2. Docker a-t-il inventé les conteneurs Linux ?

Non, Docker n'est pas à l'origine des conteneurs Linux, mais il a popularisé leur utilisation en standardisant les images et en simplifiant leur gestion avec des commandes intuitives.

🔹 3. Pourquoi Docker est adapté aux processus sans état ?

Docker est idéal pour les processus sans état car ses conteneurs sont éphémères, facilement scalables et réplicables sans gestion complexe du stockage persistant.

🔹 4. Quel artefact est distribué et déployé dans Docker ?

L'artefact distribué et déployé est l'image Docker, qui doit être immuable, légère, modulaire, portable et sécurisée.

🔹 5. Différence entre docker run et docker exec ?

docker run démarre un nouveau conteneur.

docker exec exécute une commande dans un conteneur déjà actif.

🔹 6. Peut-on exécuter plusieurs processus dans un conteneur ?

Oui, avec docker exec -it <container_id> <command>, mais il est recommandé de séparer les services pour plus de flexibilité.

🔹 7. Pourquoi ne pas utiliser latest pour une image Docker ?

latest pointe toujours vers la version la plus récente, ce qui peut causer des incompatibilités. Il est préférable d’utiliser des tags versionnés (v1.2.3).

🔹 8. Résultat de la commande docker run -d -p 9001:80 ...

Un serveur Apache exécutant PHP 8.2 démarre sur le port 9001.

Le site est accessible sur http://localhost:9001.

Les fichiers du dossier local sont accessibles en temps réel.

🔹 9. Commande pour arrêter tous les conteneurs

docker stop $(docker ps -q)

🔹 10. Comment optimiser la taille des images Docker ?

Utiliser des images de base minimales (alpine).

Installer uniquement les outils nécessaires.

🔹 11. Que se passe-t-il lorsque le conteneur s’arrête ?

Les données stockées dans le conteneur sont perdues sauf si un volume Docker est utilisé.

🔹 12. Une image Docker est-elle modifiable ?

Non, une image est immutable, mais on peut créer un conteneur basé sur une image, le modifier, puis committer les changements.

🔹 13. Commandes pour télécharger et publier une image Docker

# Télécharger une image
docker pull <image>:<tag>

# Publier une image
docker push <username>/<image>:<tag>

🔹 14. Quelle est l’image Docker la plus petite possible ?

L’image scratch (0 Mo), qui ne contient aucun système de fichiers ni bibliothèque.

🔹 15. Comment le client Docker communique-t-il avec dockerd ?

Via un socket Unix (/var/run/docker.sock) ou une API REST sur TCP (localhost:2375).

🔹 16. Différence entre CMD et ENTRYPOINT ?

CMD définit un processus par défaut pouvant être remplacé à l'exécution.

ENTRYPOINT force un processus mais permet d'ajouter des arguments modifiables.




Exercice 2 : 

1. Cloner le projet

git clone <url_du_repository>
cd tp_docker

2. Démarrer l’environnement de développement

cp .env.dev .env
docker-compose up -d

3. Démarrer l’environnement de production

cp .env.prod .env
docker-compose up -d

2. Commande pour ouvrir un shell Bash dans le conteneur MySQL et vérifier la base
bash

docker exec -it database bash

3. pour vérifier la base et son contenu :

mysql -u db_client -p
SHOW DATABASES;
USE docker_doc_dev;
SHOW TABLES;
SELECT * FROM article;

6. Commande pour relancer le projet sans reconstruire l’image
   docker-compose up -d
   
7. Commandes pour lancer les environnements dev et prod
Dev :
cp .env.dev .env
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d
Prod :
cp .env.prod .env
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d

Question 8 :
Stocker des mots de passe dans des variables d’environnement est risqué, car elles sont visibles via docker inspect, peuvent être exposées dans les logs et accidentellement versionnées.

Docker Secrets est la solution recommandée : les secrets sont chiffrés, stockés en fichiers sécurisés et accessibles uniquement aux services autorisés.
