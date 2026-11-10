ARG PARENT_VERSION=3.2.4-node26.12.1
ARG PORT_DEBUG=9229

# Development
FROM defradigital/node-development:${PARENT_VERSION}
ARG PARENT_VERSION
LABEL uk.gov.defra.ffc.parent-image=defradigital/node-development:${PARENT_VERSION}
ARG PORT_DEBUG
EXPOSE ${PORT_DEBUG}
COPY --chown=node:node package*.json ./
RUN npm install
COPY --chown=node:node . .
CMD [ "npm", "run", "test" ]