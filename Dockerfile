FROM python:3.9.6-slim as spellcheck

LABEL "com.github.actions.name"="Spellcheck Action Polish"
LABEL "com.github.actions.description"="Check spelling of files in repo"
LABEL "com.github.actions.icon"="clipboard"
LABEL "com.github.actions.color"="green"
LABEL "repository"="http://github.com/rojopolis/spellcheck-github-actions"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="rojopolis <rojo@deba.cl>"

COPY entrypoint.sh /entrypoint.sh
COPY requirements.txt /requirements.txt
COPY spellcheck.yaml /spellcheck.yaml
RUN pip3 install -r /requirements.txt

RUN apt-get update && apt-get install -y \
    aspell \
    aspell-pl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
