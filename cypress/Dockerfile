FROM cypress/base:13.6.0 AS cypress-tests

ENV CI=1
ENV CYPRESS_CACHE_FOLDER /home/node/.cache/Cypress
ARG CYPRESS_VERSION="3.8.3"
RUN npm config -g set user $(whoami)
RUN npm install -g "cypress@${CYPRESS_VERSION}" cypress-cucumber-preprocessor
RUN cypress verify
RUN cypress cache path
RUN cypress cache list