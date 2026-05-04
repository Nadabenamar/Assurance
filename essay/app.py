from flask import Flask, render_template, request, redirect, jsonify
import mysql.connector

app = Flask(__name__)

# Connexion à MySQL
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        port=3307,
        user="root",
        password="",
        database="la_cash"
    )

# ---------------- PAGE D’ACCUEIL ----------------
@app.route("/")
def home():
    return render_template("index.html")

@app.route("/contact", methods=["POST"])
def contact():
    prenom = request.form.get("prenom")
    nom = request.form.get("nom")
    email = request.form.get("email")
    commentaire = request.form.get("commentaire")

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO contact (prenom, nom, Commentaire, email)
        VALUES (%s, %s, %s, %s)
    """, (prenom, nom, commentaire, email))
    conn.commit()
    cursor.close()
    conn.close()
    return redirect("/")

# ---------------- FORMULAIRE AUTOMOBILE ----------------
@app.route("/formulaire_auto")
def formulaire_auto():
    id_client = request.args.get("id_client")  # récupéré depuis l’URL
    return render_template("devis_automobile.html", id_client=id_client)


@app.route("/ajouter_automobile", methods=["POST", "GET"])
def ajouter_auto():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    id_client = request.form.get("id_client")
    
    libelle_type = request.form["type_vehicule"]
    genre_libelle = request.form["genre_vehicule"]
    usage_libelle = request.form["usage_vehicule"]
    puissance_libelle = request.form["puissance_vehicule"]
    prix = request.form["prix"]
    duree_libelle = request.form["duree_contrat"]
    type_couv_libelle = request.form["type_couverture"]
    annee_mise_circulation = request.form["annee_mise_circulation"]
    garanties = ", ".join(request.form.getlist("garanties[]"))
    options = ", ".join(request.form.getlist("options[]"))
    date_permis = request.form["date_permis"]
    zone_circulation = request.form["zone_circulation"]

    # Fonction utilitaire
    def get_or_create_id(table, col_id, col_libelle, valeur):
        cursor.execute(f"SELECT {col_id} FROM {table} WHERE {col_libelle}=%s", (valeur,))
        row = cursor.fetchone()
        if row:
            return row[col_id]
        else:
            cursor.execute(f"INSERT INTO {table} ({col_libelle}) VALUES (%s)", (valeur,))
            conn.commit()
            return cursor.lastrowid
    
    id_type = get_or_create_id("type", "id_type", "libelle_type", libelle_type)
    id_genre = get_or_create_id("genre", "id_genre", "libelle_genre", genre_libelle)
    id_usage = get_or_create_id("usage_auto", "id_usage_vehicule", "libelle_usage", usage_libelle)
    id_puissance = get_or_create_id("puissance", "id_puissance", "libelle_puissance", puissance_libelle)
    id_duree_contrat= get_or_create_id("duree_contrat", "id_duree_contrat", "libelle_duree_contrat", duree_libelle)
    id_type_couv = get_or_create_id("type_couverture", "id_type_couverture", "libelle_type_couverture", type_couv_libelle)
    
    cursor.execute("""
        INSERT INTO la_cash_devis
        ( id_type, id_genre, id_usage_vehicule, id_puissance, prix, id_duree_contrat,
         id_type_couverture, annee_mise_circulation, garanties, options,
         date_permis, zone_circulation, id_client)
        VALUES (%s, %s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
    """, ( id_type, id_genre, id_usage, id_puissance, prix, id_duree_contrat,
          id_type_couv, annee_mise_circulation, garanties, options,
          date_permis, zone_circulation, id_client))
   

    
    id_client = request.form.get("id_client")

    conn.commit()
    cursor.close()
    conn.close()
    return "bien"


# ---------------- FORMULAIRE HABITATION ----------------
@app.route("/formulaire_habitation")
def formulaire_habitation():
    return render_template("devis_habitation.html")

@app.route("/ajouter_habitation", methods=["POST",'GET'])
def ajouter_habitation():
    conn = get_db_connection()
    cursor = conn.cursor()

   
    type_habitation = request.form.get('type_habitation')
    qualite_juridique = request.form.get('qualite_juridique')
    superficie = float(request.form.get('superficie') or 0)
    valeur_contenu = float(request.form.get('valeur_contenu') or 0)
    nombre_pieces = int(request.form.get('nombre_pieces') or 0)

    situee_terrasse = 1 if 'terrasse' in request.form else 0
    occupee_risque_professionnel = 1 if 'risque_prof' in request.form else 0
    materiaux_durs = 1 if 'materiaux_durs' in request.form else 0
    innocupee_45_jours = 1 if 'inoccupee' in request.form else 0

    protection_vol_alarme = 1 if 'alarme' in request.form else 0
    protection_vol_telesurveillance = 1 if 'telesurveillance' in request.form else 0
    protection_vol_barreaudage = 1 if 'barreaudage' in request.form else 0
    protection_vol_gardiennage = 1 if 'gardiennage' in request.form else 0

    extension_vol_objets_valeur = 1 if 'objets_valeur' in request.form else 0
    extension_tempete = 1 if 'tempete' in request.form else 0
    extension_intoxication = 1 if 'intoxication' in request.form else 0

    wilaya= request.form.get('wilaya')
    commune = request.form.get('commune')
    adresse = request.form.get('adresse')
    date_effet = request.form.get('date_effet')

    cursor.execute("""
        INSERT INTO devis_habitation
        ( type_habitation, qualite_juridique, superficie, valeur_contenu, nombre_pieces,
        situee_terrasse, occupee_risque_professionnel, materiaux_durs, innocupee_45_jours,
        protection_vol_alarme, protection_vol_telesurveillance, protection_vol_barreaudage, protection_vol_gardiennage,
        extension_vol_objets_valeur, extension_tempete, extension_intoxication,
        wilaya, commune, adresse, date_effet)
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
    """, ( type_habitation, qualite_juridique, superficie, valeur_contenu, nombre_pieces,
          situee_terrasse, occupee_risque_professionnel, materiaux_durs, innocupee_45_jours,
          protection_vol_alarme, protection_vol_telesurveillance, protection_vol_barreaudage, protection_vol_gardiennage,
          extension_vol_objets_valeur, extension_tempete, extension_intoxication,
          wilaya, commune, adresse, date_effet))


    conn.commit()
    cursor.close()
    conn.close()

  
    return "bien"



# ---------------- FORMULAIRE CLIENT ----------------

# ---------------- FORMULAIRE CLIENT AUTOMOBILE ----------------
@app.route("/formulaire_client_auto")
def formulaire_client_auto():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT id_wilaya, libelle_wilaya FROM wilaya")
    wilayas = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template("client.html", wilayas=wilayas ,page_type="auto")


@app.route("/ajouter_client_auto", methods=["GET","POST"])
def ajouter_client_auto():
    conn = get_db_connection()
    cursor = conn.cursor()


  
    nom_famille = request.form.get("nom_famille")
    prenom = request.form.get("prenom")
    date_naissance = request.form.get("date_naissance")
    telephone_mobile = request.form.get("telephone_mobile")
    adresse_mail = request.form.get("adresse_mail")
    num_identite_nationale = request.form.get("num_identite_nationale")
    sexe = request.form.get("sexe")
    wilaya = request.form.get("wilaya")
    commune = request.form.get("commune")
    agence = request.form.get("agence")
    code_postal = request.form.get("code_postal")
    profession = request.form.get("profession")

    cursor.execute("""
        INSERT INTO clients
        (nom_famille, prenom, date_naissance, telephone_mobile, adresse_mail,
         num_identite_nationale, sexe, id_wilaya, commune, agence, code_postal, profession)
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
    """, (nom_famille, prenom, date_naissance, telephone_mobile, adresse_mail,
          num_identite_nationale, sexe, wilaya, commune, agence, code_postal, profession))

    id_client = cursor.lastrowid
    conn.commit()
    cursor.close()
    conn.close()

    return redirect(f"/formulaire_auto?id_client={id_client}")

  # 🚗 Redirection vers formulaire automobile


# ---------------- FORMULAIRE CLIENT HABITATION ----------------
@app.route("/formulaire_client_hab")
def formulaire_client_hab():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT id_wilaya, libelle_wilaya FROM wilaya")
    wilayas = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template("client.html", wilayas=wilayas ,page_type="habitation")



@app.route("/ajouter_client_hab", methods=["GET","POST"])
def ajouter_client_hab():
    conn = get_db_connection()
    cursor = conn.cursor()

    # mêmes champs que ci-dessus
    nom_famille = request.form.get("nom_famille")
    prenom = request.form.get("prenom")
    date_naissance = request.form.get("date_naissance")
    telephone_mobile = request.form.get("telephone_mobile")
    adresse_mail = request.form.get("adresse_mail")
    num_identite_nationale = request.form.get("num_identite_nationale")
    sexe = request.form.get("sexe")
    wilaya = request.form.get("wilaya")
    commune = request.form.get("commune")
    agence = request.form.get("agence")
    code_postal = request.form.get("code_postal")
    profession = request.form.get("profession")

    cursor.execute("""
        INSERT INTO clients
        (nom_famille, prenom, date_naissance, telephone_mobile, adresse_mail, 
         num_identite_nationale, sexe, id_wilaya, commune, agence, code_postal, profession)
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
    """, (nom_famille, prenom, date_naissance, telephone_mobile, adresse_mail, 
          num_identite_nationale, sexe, wilaya, commune, agence, code_postal, profession))
    
    conn.commit()
    cursor.close()
    conn.close()

    return redirect("/formulaire_habitation")  # 🏠 Redirection vers formulaire habitation



# ---------------- API POUR COMMUNES ----------------

@app.route("/communes/<int:id_wilaya>", methods=["GET"])
def get_communes(id_wilaya):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT id_commune, libelle_commune FROM commune WHERE id_wilaya = %s", (id_wilaya,))
    communes = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(communes)



# Article 1
@app.route("/article1")
def article1():
    return render_template("article1.html")

# Article 2
@app.route("/article2")
def article2():
    return render_template("article2.html")

# Article 3
@app.route("/article3")
def article3():
    return render_template("article3.html")
if __name__ == "__main__":
    app.run(debug=True)
