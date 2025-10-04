FROM postgres:15-alpine

ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=admin
ENV POSTGRES_DB=erp_db

COPY ./schema.sql /docker-entrypoint-initdb.d/


