# Cliks
***Cliks*** is a clienttools for handling keystore as vault or redis.

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

### Get Value from keystore
cliks get 'KEYNAME'


### Get Value from keystore
cliks set 'KEYNAME' 'VALUE'

#### Example
```
#>: cliks set de.dockermgeo.services.app.name "This is from HelloWorld!"
#>: Secret de.dockermgeo.services.app.name stored!
#>: cliks get de.dockermgeo.services.app.name
#>: This is from HelloWorld!
```
