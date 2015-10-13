# Packrat [![Circle CI](https://circleci.com/gh/hackedu/packrat.svg?style=svg)](https://circleci.com/gh/hackedu/packrat)

![This is where I would keep my feedback if I had one](http://i.imgur.com/YGQ8aNt.jpg)

## Getting Started

[Register a GitHub application](https://github.com/settings/applications/new)
with the following fields:

- Homepage URL - `http://localhost:3000`
- Application callback URL - `http://localhost:3000/club_members/auth/github/callback`

Add the following environment variables to a file called `.env`:

- `GITHUB_ID` - GitHub client id
- `GITHUB_SECRET` - GitHub client secret

Launch Packrat:

    docker-compose up

You may need access to the Bootstrap theme we bought for Packrat, which is in a
private submodule. Please create an issue if you need access and we'll work
with you to make that happen.

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
    `development`. Set to `production` if you want the app to run in production
    mode.
  - `RAILS_SERVE_STATIC_FILES` - Set to `true` if deploying with Docker image
  - `PORT` (optional) - Port to run server on. Default: `3000`

## License

This repository is distributed under the MIT license found in the
[LICENSE](./LICENSE) file.
