FROM alpine:3

RUN apk add --no-cache curl 
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN apk add glibc-2.32-r0.apk
RUN rm glibc-2.32-r0.apk

RUN curl -L -o butler.zip https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default
RUN unzip -d /usr/local/bin/ butler.zip
ENTRYPOINT [ "butler" ]
CMD [ "help" ]
