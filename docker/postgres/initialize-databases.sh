#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER fieldvision_test_one_db_user WITH PASSWORD 'password';
    CREATE DATABASE fieldvision_test_one_db
        WITH ENCODING = 'UTF8'
        LC_COLLATE = 'en_US.utf8'
        CONNECTION LIMIT = -1;
    REVOKE connect ON DATABASE fieldvision_test_one_db FROM PUBLIC;
    GRANT connect ON DATABASE fieldvision_test_one_db TO fieldvision_test_one_db_user;
    GRANT ALL PRIVILEGES ON DATABASE fieldvision_test_one_db TO fieldvision_test_one_db_user;
    GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO fieldvision_test_one_db_user;
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO fieldvision_test_one_db_user;
    GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO fieldvision_test_one_db_user;

    CREATE USER fieldvision_test_two_db_user WITH PASSWORD 'password';
    CREATE DATABASE fieldvision_test_two_db
        WITH ENCODING = 'UTF8'
        LC_COLLATE = 'en_US.utf8'
        CONNECTION LIMIT = -1;
    REVOKE connect ON DATABASE fieldvision_test_two_db FROM PUBLIC;
    GRANT connect ON DATABASE fieldvision_test_two_db TO fieldvision_test_two_db_user;
    GRANT ALL PRIVILEGES ON DATABASE fieldvision_test_two_db TO fieldvision_test_two_db_user;
    GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO fieldvision_test_two_db_user;
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO fieldvision_test_two_db_user;
    GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO fieldvision_test_two_db_user;
EOSQL
