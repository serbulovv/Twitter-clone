# Twitter

## Pet project

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

## How to run


- Install docker and docker compose on your device
- run `docker-compose build`  && `docker-compose build`
- run `docker-compose run --rm web ruby bin/setup`
- run migrations via `docker-compose run --rm web rails db:migrate`

## Stack
### Interface
`turbo-rails`
`stimulus`
`bootstrap`
### Validation
`dry-validation`
### Testing
`rspec`
`pry`
### Linters
`rubocop`
### Files
`active_storage`
`image_processing`