FROM alpine:latest

RUN apk add --no-cache bash curl

ENV VAULT_VERSION=1.10.4

RUN curl -L -o /tmp/vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip /tmp/vault.zip -d /usr/local/bin/ && \
    rm /tmp/vault.zip

COPY load-secrets.sh /usr/local/bin/load-secrets.sh

RUN chmod +x /usr/local/bin/load-secrets.sh

ENTRYPOINT ["/usr/local/bin/load-secrets.sh"]
