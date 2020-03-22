FROM postgres:12.2-alpine
COPY ./initialize-databases.sh /docker-entrypoint-initdb.d/initialize-databases.sh
EXPOSE 5432