.PHONY: start test
NODE_ENV ?= development

default:
	make start

start:
	source ./env/${NODE_ENV}.sh && \
		DEBUG=koa* node --harmony-async-await server.js

test:
	NODE_ENV=test ./node_modules/mocha/bin/mocha

db.create:
	node ./db/create.js

db.drop:
	node ./db/drop.js

db.migration:
	./node_modules/knex/bin/cli.js migrate:make ${name}

db.migrate:
	./node_modules/knex/bin/cli.js migrate:latest

db.rollback:
	./node_modules/knex/bin/cli.js migrate:rollback

db.seed.new:
	./node_modules/knex/bin/cli.js seed:make ${name}

db.seed:
	./node_modules/knex/bin/cli.js seed:run