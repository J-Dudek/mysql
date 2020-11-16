FROM mysql:latest
# Add a database
ENV MYSQL_DATABASE testdb
# Add the content of the scripts/ directory to your image
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
COPY ./scripts/ /docker-entrypoint-initdb.d/