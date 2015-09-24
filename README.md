# Packrat [![Circle CI](https://circleci.com/gh/hackedu/packrat.svg?style=svg)](https://circleci.com/gh/hackedu/packrat)

## Getting Started

Set the following environment variables:

- `GITHUB_ID` - GitHub client id
- `GITHUB_SECRET` - GitHub client secret

## Deployment

Set the following environment variables, in addition to the above:

- Database
  - `DATABASE_ADAPTER` (optional) - Database adapter to use. Default: `postgresql`
  - `DATABASE_ENCODING` (optional) - Encoding to use in database. Default: `utf8`
  - `DATABASE_RECONNECT` (optional) - Automatically reconnect to the database?
    Default: `true`
  - `DATABASE_NAME` - Name of database to connect to
  - `DATABASE_POOL` (optional) - Database connection pool size. Default: `5`
  - `DATABASE_USERNAME` - Username to connect to database with
  - `DATABASE_PASSWORD` - Password to connect to database with
  - `DATABASE_HOST` - Host of database to connect to
  - `DATABASE_PORT` - Port of database to connect to
- Web server
  - `WEB_CONCURRENCY` (optional) - Number of workers to run. Default: `2`
  - `MAX_THREADS` (optional) - Maximum number of threads to use. Default: `5`
  - `RAILS_ENV` (optional) - Environment to run the Rails server in. Default:
  - `RAILS_SERVE_STATIC_FILES` - Set to `true` if deploying with Docker image
    `development`. Set to `production` if you want the app to run in production
    mode.
  - `PORT` (optional) - Port to run server on. Default: `3000`
