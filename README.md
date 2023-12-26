# GTNH Server Container Builder.

This is a small project for building a GT:NH Server for personal use.

This Repository is not affiliated with the GT:NH project.


conatainer stucture:
```
/
|--app
    |--server
        |--World
        |--visualprospecting
        |--mods
        |--config
        |--blueprints
        |--logs
        |--scripts
        |--eula.txt
        |--server.properties
        |--ops.json
        |--whitelist.json

```

World : save directory for the world
mods : mod directory
config : mod config directory
visualprospecting : save directory for visualprospecting data
scripts : zenscript directory
logs : log directory

compose file:

```yaml
version: '3'
services:
    gtnh:
        image: todo:version
        ports:
            - "25565:25565"
        restart: always
        volumes:
            - ./world:/app/server/World
            - ./server.properties:/app/server/
        
```

or build with 

```yaml
version: '3'
services:
    gtnh:
        build:
            context: https://github.com/debuas/gtnh-docker-server#main
            args:
                VERSION: 2.5.1 
        ports: 
            - "25565:25565"
        restart: always
        volumes:
            - ./world:/app/server/World
            - ./server.properties:/app/server/
        
```
