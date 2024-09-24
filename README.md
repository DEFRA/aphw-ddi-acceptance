# DDI Acceptance Tests

Repository containing UI and API Acceptance tests for the DDI service

## API tests

### Prerequisites

You just need [Node.js](https://nodejs.org/en/) installed, ideally an LTS version.

You'll also need the [Postman App](https://www.postman.com/downloads/) installed. It's used to create maintain the [collection](https://learning.postman.com/docs/sending-requests/intro-to-collections/) of requests and associated tests we use. See [aphw-ddi-api.postman_collection.json](test/api/aphw-ddi-api.postman_collection.json).

- Docker
- Docker Compose

Optional:
- Kubernetes
- Helm

### Installation

First clone the repository and then drop into your new local repo

```bash
git clone https://github.com/DEFRA/aphw-ddi-acceptance.git && cd aphw-ddi-acceptance
```

Next download and install the dependencies

```bash
npm install
```


### Configuration

> Important! Do not add environment files to source control

We have 6 environments where the DDI could be running; local, development, test, integration, pre-production, and production.

For each environment you wish to test you'll need to create an [environment file](https://learning.postman.com/docs/sending-requests/managing-environments/) in  `environments/`. An [example](/environments/example.postman_environment.json) with dummy data is provided as a reference.

For example, if you wanted to start testing the **development** environment the steps would be

- duplicate [example.postman_environment.json](/environments/example.postman_environment.json)
- rename to something meaningful; `dev.postman_environment.json`
- update the `name` attribute to something meaningful: `"name": "DDI DEV acceptance tests",`
- update the `value` attribute for each of the properties (`baseUrl`, `tokenUrl`, `adminUser` etc) to match the environment

Git is setup to ignore everything bar the example environment file. Even so, double check your environment file has not been comitted before pushing it to GitHub.

### Execution

Running the tests involves firing all the requests in the [aphw-ddi-api.postman_collection.json](test/api/aphw-ddi-api.postman_collection.json) combined with the values taken from the selected environment file. For example, if you wanted to test the **development** environment and had created the environment file `dev.postman_environment.json` you would call
Ensure the API is running prior to running the tests.

```bash
npm test:api -- -e dev
```

The app will automatically look for a `*.postman_environment.json` with the matching prefix.

## UI Acceptance Tests

### Running the application

The application is designed to run in containerised environments, using Docker Compose in development and Kubernetes in production.

- A Helm chart is provided for production deployments to Kubernetes.

#### Build container image

Container images are built using Docker Compose, with the same images used to run the service with either Docker Compose or Kubernetes.

When using the Docker Compose files in development the local `app` folder will
be mounted on top of the `app` folder within the Docker container, hiding the CSS files that were generated during the Docker build.  For the site to render correctly locally `npm run build` must be run on the host system.


By default, the start script will build (or rebuild) images so there will
rarely be a need to build images manually. However, this can be achieved
through the Docker Compose
[build](https://docs.docker.com/compose/reference/build/) command:

```
# Build container images
docker-compose build
```

#### Start

Use Docker Compose to run service locally.

```
docker-compose up
```

## Test structure

The tests have been structured into subfolders of `./test` as per the
[Microservice test approach and repository structure](https://eaflood.atlassian.net/wiki/spaces/FPS/pages/1845396477/Microservice+test+approach+and+repository+structure)

### Running tests

A convenience script is provided to run automated tests in a containerised
environment. This will rebuild images before running tests via docker-compose,
using a combination of `docker-compose.yaml` and `docker-compose.test.yaml`.
The command given to `docker-compose run` may be customised by passing
arguments to the test script.

Examples:

```
# Run all tests
scripts/test

# Run tests with file watch
scripts/test -w
```

### Api Tests
To run api tests ``npm run test:api:dev``.  Will need to be run in conjunction with ``./scripts/api-tests`` from api portal.

## CI pipeline

This service uses the [FFC CI pipeline](https://github.com/DEFRA/ffc-jenkins-pipeline-library)

## Licence

THIS INFORMATION IS LICENSED UNDER THE CONDITIONS OF THE OPEN GOVERNMENT LICENCE found at:

<http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3>

The following attribution statement MUST be cited in your products and applications when using this information.

> Contains public sector information licensed under the Open Government license v3

### About the licence

The Open Government Licence (OGL) was developed by the Controller of Her Majesty's Stationery Office (HMSO) to enable information providers in the public sector to license the use and re-use of their information under a common open licence.

It is designed to encourage use and re-use of information freely and flexibly, with only a few conditions.
