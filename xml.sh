#!/bin/bash

# 📌 Définition des variables
CHEMIN_SERVLET="/home/toky/S4/Web_dynamique"
APP_NAME="AinaServlet"
SRC_DIR="$CHEMIN_SERVLET/$APP_NAME/src/main/java"
WEB_DIR="$CHEMIN_SERVLET/$APP_NAME/src/main/webapp"
BUILD_DIR="build"
TOMCAT_HOME="${TOMCAT_HOME:-/home/toky/tomcat}"
TOMCAT_WEBAPPS="$TOMCAT_HOME/tomcat-webapps"
LIB_DIR="$CHEMIN_SERVLET/$APP_NAME/lib"
SERVLET_API_JAR="$LIB_DIR/servlet-api.jar"
ORACLE_JAR="$LIB_DIR/mysql-connector-j-8.4.0.jar"

# 🧼 Nettoyage et création de la structure temporaire
rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR/WEB-INF/classes
mkdir -p $BUILD_DIR/WEB-INF/lib

# 🏗️ Copie des fichiers web d'origine (JSP, ressources) en premier
cp -r $WEB_DIR/* $BUILD_DIR/

# 📄 Copie du fichier web.xml officiel (il écrasera proprement celui du dossier web si présent)
cp $CHEMIN_SERVLET/$APP_NAME/src/main/xml/web.xml $BUILD_DIR/WEB-INF/

# 🛠️ Compilation des fichiers Java
find $SRC_DIR -name "*.java" > sources.txt
javac -cp $SERVLET_API_JAR:$ORACLE_JAR -d $BUILD_DIR/WEB-INF/classes @sources.txt
rm sources.txt

# 📦 Archivage des classes en fichier Aina.jar
jar cvf Aina.jar -C $BUILD_DIR/WEB-INF/classes .
mv Aina.jar $BUILD_DIR/WEB-INF/lib/

# 🧹 Nettoyage des fichiers .class individuels (ils sont maintenant dans le JAR)
rm -rf $BUILD_DIR/WEB-INF/classes

# 📦 Génération du fichier .war final
cd $BUILD_DIR || exit
jar -cvf $APP_NAME.war *
cd ..

# 🚚 Déploiement automatique dans Tomcat
if [ -d "$TOMCAT_WEBAPPS" ]; then
    cp -f "$BUILD_DIR/$APP_NAME.war" "$TOMCAT_WEBAPPS/"
    echo "✅ Déploiement terminé. Redémarrez Tomcat si nécessaire."
else
    echo "📦 Archive WAR créée avec succès dans $BUILD_DIR/$APP_NAME.war"
fi

echo ""