# Étape de base
FROM alpine:latest

# Installer Python, pip et bash
RUN apk add --no-cache python3 py3-pip bash

# Créer un dossier pour le projet
WORKDIR /app

# Créer un environnement virtuel
RUN python3 -m venv /venv

# Activer l'environnement virtuel et installer les dépendances
COPY ./webapp/requirements.txt /app/requirements.txt
RUN /venv/bin/pip install --no-cache-dir -r /app/requirements.txt

# Copier le reste de l'application dans le conteneur
COPY ./webapp /app

# Utiliser l'environnement virtuel par défaut
ENV PATH="/venv/bin:$PATH"

# Commande par défaut pour exécuter l'application (ajustez selon votre application)
CMD ["python", "/app/main.py"]
