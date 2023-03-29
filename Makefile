# Heroku
# make heroku-login
# make heroku-push

HEROKU_APP = "doc-retrieval-api"

heroku-push:
	docker buildx build --platform linux/amd64 -t ${HEROKU_APP} .
	docker tag ${HEROKU_APP} registry.heroku.com/${HEROKU_APP}/web
	docker push registry.heroku.com/${HEROKU_APP}/web
	heroku container:release web -a ${HEROKU_APP}

heroku-login:
	heroku container:login

heroku-config:
	heroku config:set DATASTORE=<DATASTORE> -a ${HEROKU_APP}
	heroku config:set BEARER_TOKEN=<BEARER_TOKEN> -a ${HEROKU_APP}
	heroku config:set OPENAI_API_KEY=<OPENAI_API_KEY> -a ${HEROKU_APP}
	heroku config:set PINECONE_API_KEY=<PINECONE_API_KEY> -a ${HEROKU_APP}
	heroku config:set PINECONE_ENVIRONMENT=<PINECONE_ENVIRONMENT> -a ${HEROKU_APP}
	heroku config:set PINECONE_INDEX=<PINECONE_INDEX> -a ${HEROKU_APP}