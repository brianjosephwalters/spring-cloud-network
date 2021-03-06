#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER backend_one_db_user WITH PASSWORD 'password';
    CREATE DATABASE backend_one_db
        WITH ENCODING = 'UTF8'
        LC_COLLATE = 'en_US.utf8'
        CONNECTION LIMIT = -1;
    REVOKE connect ON DATABASE backend_one_db FROM PUBLIC;
    GRANT connect ON DATABASE backend_one_db TO backend_one_db_user;
    GRANT ALL PRIVILEGES ON DATABASE backend_one_db TO backend_one_db_user;
    GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO backend_one_db_user;
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO backend_one_db_user;
    GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO backend_one_db_user;

    CREATE USER backend_two_db_user WITH PASSWORD 'password';
    CREATE DATABASE backend_two_db
        WITH ENCODING = 'UTF8'
        LC_COLLATE = 'en_US.utf8'
        CONNECTION LIMIT = -1;
    REVOKE connect ON DATABASE backend_two_db FROM PUBLIC;
    GRANT connect ON DATABASE backend_two_db TO backend_two_db_user;
    GRANT ALL PRIVILEGES ON DATABASE backend_two_db TO backend_two_db_user;
    GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO backend_two_db_user;
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO backend_two_db_user;
    GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO backend_two_db_user;
EOSQL
