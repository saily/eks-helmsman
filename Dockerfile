FROM praqma/helmsman:latest as helm
FROM gcr.io/heptio-images/authenticator:v0.3.0-scratch as authenticator
FROM python:3.7-alpine

COPY --from=helm /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=helm /usr/local/bin/helm /usr/local/bin/helm
COPY --from=helm /bin/helmsman /usr/local/bin/helmsman
COPY --from=authenticator /heptio-authenticator-aws /usr/local/bin/aws-iam-authenticator

ENV HELM_HOME=/helm/.helm
ENV HELM_DIFF_VERSION=v2.11.0+3

RUN pip install --no-cache awscli && \
    apk --update --no-cache add bash && \
    adduser -h /helm -D helm

USER helm

RUN helm init --client-only && \
    wget -O- https://github.com/databus23/helm-diff/releases/download/${HELM_DIFF_VERSION}/helm-diff-linux.tgz | tar -xvzC ${HELM_HOME}/plugins

ENTRYPOINT /bin/bash
