FROM dockermgeo/dockerbase

ADD docker_root /

ENTRYPOINT [ "/boot.sh" ]
