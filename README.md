# Cliks
***Cliks*** is a client for handling keystores as vault or redis.



## Install

### Docker
```
git clone https://github.com/dockermgeo/Cliks && \
make install
```
### Jenkins
```
git clone https://github.com/dockermgeo/Cliks && \
make docker.build
```

### Get a Value from keystore
cliks get 'KEYNAME'


### Setting a Value in keystore
cliks set 'KEYNAME' 'VALUE'

#### Example
```
#>: cliks set de.dockermgeo.services.app.name "This is from HelloWorld!"
#>: Secret de.dockermgeo.services.app.name stored!
#>: cliks get de.dockermgeo.services.app.name
#>: This is from HelloWorld!
```
