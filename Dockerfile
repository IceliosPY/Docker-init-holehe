FROM python:3.11-slim-bullseye

# Copier le code source dans le conteneur
COPY . /opt/holehe
WORKDIR /opt/holehe

# Installer pip et les dépendances nécessaires
RUN apt-get update && apt-get install -y gcc libffi-dev \
    && python3 -m pip install --upgrade pip setuptools wheel \
    && python3 -m pip install requests

# Installer le package
RUN python3 setup.py install

# Définir le point d'entrée pour permettre de passer des arguments
ENTRYPOINT ["holehe"]

# Ajouter une commande par défaut pour éviter une erreur si aucun argument n'est passé
CMD ["--help"]