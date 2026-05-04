## 📌 Project Overview
Ce dépôt présente une plateforme **Fullstack** complète dédiée à la gestion et à la simulation de devis pour **CASH Assurances**. Le projet vise à moderniser l'expérience client en permettant une tarification instantanée et une gestion rigoureuse des demandes d'assurance.

En tant qu'étudiante en double diplôme technologique, j'ai conçu cette application pour lier la modélisation de données métier à une interface utilisateur fluide et fonctionnelle.

## 🏗️ Architecture & Methodology
Le projet est structuré autour d'une architecture **MVC (Modèle-Vue-Contrôleur)** permettant une séparation claire des responsabilités :

### 1. Modélisation & Gestion (SQL & phpMyAdmin)
*   **Objectif** : Stockage sécurisé des profils clients et archivage des simulations de devis.
*   **Outils** : Utilisation de **MySQL** avec **phpMyAdmin** pour la conception relationnelle des tables.
*   **Résultat** : Une base de données optimisée pour des requêtes rapides et une intégrité des données assurée.

### 2. Logique Métier & Backend (Python Flask)
*   **Objectif** : Traitement des formulaires et calcul automatique des primes d'assurance pour l'automobile, l'habitation et les catastrophes naturelles.
*   **Modules** : Gestion des routes dynamiques et intégration de la logique de calcul métier.
*   **Implementation** : Utilisation de **Flask** pour assurer la communication entre le frontend et la base de données.

## 📊 Key Features
*   **Gestion Multirisque** : Modules spécifiques pour l'assurance **Automobile**, **Habitation** et **Catastrophes Naturelles**.
*   **Interface Responsive** : Design épuré réalisé en **HTML5** et **CSS3** pour une navigation intuitive.
*   **Outils Tech** : Stack technologique incluant Python, Flask, MySQL, et Node.js.

## 📁 Repository Structure
*   `app.py` : Point d'entrée de l'application Flask contenant la logique de routage et le backend.
*   `templates/` : Contient les vues HTML dynamiques gérées par le moteur Jinja2.
*   `static/` : Regroupe les fichiers CSS et les ressources multimédias du site.
*   `.gitignore` : Optimisé pour exclure l'environnement virtuel (`venv/`) et les fichiers temporaires Python.

## 🚀 How to Run
1. **Cloner le projet** :
   ```bash
   git clone [https://github.com/Nadabenamar/Assurance.git](https://github.com/Nadabenamar/Assurance.git)
   cd CASH

Installer Flask : pip install flask mysql-connector-python.

Lancer le serveur :

Bash
python app.py
