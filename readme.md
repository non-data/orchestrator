# Orchestrator
## docker file
- mysql
- orchestrator


## build
```
# docker build -t orchestrator orchestrator/
# docker build -t mysql mysql/
```

## run
```
# docker run --name mysql -d -e MYSQL_DATABASE=orchestrator -e MYSQL_USER=orc_server -e MYSQL_PASSWORD=P@ssw0rd  -e MYSQL_ROOT_PASSWORD=root mysql
# docker run --name orchestrator --link mysql:mysql -d -p 3000:3000 orchestrator
```
