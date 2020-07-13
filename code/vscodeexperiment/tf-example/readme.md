docker build -t mytfexample .
docker run -p 5000:5000 mytfexample

docker-compose provides useful composition services on top of Docker that permit us to automatise building and running of containers

e.g.:
docker-compose.yml:

```
web:
  build: .
  command: python app.py
  ports:
   - "5000:5000"
  volumes:
   - .:/code
```

The building is then done via:

```
docker-compose build
```

and a container can be fired up via:

```
$ docker-compose up
```

Basically, docker-compose permits to automatise via YAML what we would otherwise have to express by hand via docker command line options.

This advantage will be even more apparent for complex applications where the application would require to link more containers together, such as the Python application running inside the web container, that is linked to a redis container caching, a db container running PostgreSQL database, and a worker container running Celery tasks.

.dockerignore file that will permit to ignore certain files or directories from being included in the built Docker image

```commandline
docker-compose up -d
```

will run the docker application in the background as a daemon. This will leave the application rnning until you decide to stop it

```commandline
 docker-compose up -d --no-recreate
```

if the container already exists it will not recreate it

To stop a docker application that is running in the foreground, you just have to press Ctrl-C.But, to stop a docker application that is running in the background, use the docker-compose stop. Then remove the stopped containers using docker-compose rm -f.

To stop/remove specific container:
docker-compose stop data
docker-compose rm -f data

if you decide to remove the attached volumes, you can do that during rm by using -v option as shown below.
docker-compose rm -v

status of docker containers:
docker-compose ps

docker ps -a

# note: source and bash can be both used to execute a script. source works in the current shell whole bash creates a new shell (not displayed) - thus variables specified in your current shell are not known.

# note: . or source will do the same

# note: we use source .bashrc so that we save updated file without the need to open a new terminal
