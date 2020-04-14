FROM alpine:edge

# TODO: debug param
#ENV HUB_VERBOSE=1

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --no-cache add \
        gettext \
        git \
        hub@testing

COPY .gitconfig.tmpl /root/.gitconfig.tmpl
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
