# Étape de base
FROM alpine:latest

# Installer Python et les outils nécessaires
RUN apk add --no-cache python3 py3-pip bash

# Créer et activer un environnement virtuel
RUN python3 -m venv /venv

# Activer l'environnement virtuel et installer les dépendances
RUN /venv/bin/pip install --no-cache-dir -r /tmp/requirements.txt

# Copier les fichiers de l'application
ADD ./webapp /app

# Utiliser l'environnement virtuel par défaut
ENV PATH="/venv/bin:$PATH"

# Commande par défaut pour exécuter l'application
CMD ["python", "/app/main.py"]
