# syntax=docker/dockerfile
FROM postgres

# copy our schema and permission setup into the entrypoint folder
# this will execute the first time the container runs.
# If it fails, just nuke the container and start over
COPY RelationalSchema.sql /docker-entrypoint-initdb.d
#COPY permissions.sql /docker-entrypoint-initdb.d
COPY SampleData.sql /docker-entrypoint-initdb.d