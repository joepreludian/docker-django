include ops/project.vars
export

build-base:
	cd ops/base; docker build -t="joepreludian/django-supervisor-nginx:latest" .

build-deploy: build-base
	docker build -t ${PROJECT_NAME_IMG} .
	
run-deploy: build-deploy
	docker run -d --name ${PROJECT_NAME} -p ${PROJECT_LISTEN_ADDR} ${PROJECT_NAME_IMG}

setup: build-base build-deploy run-deploy

clean:
	docker rm ${PROJECT_NAME}; docker rmi ${PROJECT_NAME_IMG}

full-clean: clean
	docker rmi joepreludian/django-supervisor-nginx:latest
