FROM postgres:16

# Copia scripts de init
COPY primary/init /docker-entrypoint-initdb.d

# Permissões
RUN chmod +x /docker-entrypoint-initdb.d/*.sh

