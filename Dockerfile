# Etapa 1: Construim prima imagine bazată pe solr:latest
FROM solr:latest as solr_builder

# Aici poți adăuga configurații sau acțiuni suplimentare pentru Solr dacă este necesar

# Etapa 2: Instalăm și configurăm Nginx și PHP
FROM nginx:latest as nginx_builder

# Instalăm Nginx, PHP și orice alte pachete necesare
RUN apt-get update && \
    apt-get install -y nginx php-fpm

# Aici poți adăuga configurații sau acțiuni suplimentare pentru Nginx și PHP dacă este necesar

# Definim porturile pentru Nginx și Solr
EXPOSE 80 8983

# Comandă implicită pentru rularea Nginx și Solr
CMD nginx -g "daemon off;" && \
    /opt/solr/bin/solr start -f
