FROM colstrom/concourse-fuselage

RUN apk-install git ca-certificates libressl-dev \
    && update-ca-certificates \
    && apk update \
    && apk del openssl-dev \
    && rm -vf /var/cache/apk/* \
    && gem-install concourse-github-status

WORKDIR /opt/resource

RUN find $(gem environment gemdirs) -type f -path '*/concourse-github-status-*/bin/*' -exec ln -s '{}' \;

RUN cd /usr/lib/ruby/gems/2.5.0/gems && rm -rf concourse-github-status-0.6.6/ && git clone --branch add-url-param https://github.com/harts/concourse-github-status.git concourse-github-status-0.6.6/
