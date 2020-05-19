.PHONY: build build-force lint test

all: build lint

# build the relevant images
build:
	docker build -t ansible:latest -f Dockerfile .
	docker build -t ansible:centos -f centos.Dockerfile .

# build no cache
build-force:
	docker build --no-cache -t ansible:latest -f Dockerfile .
	docker build --no-cache -t ansible:centos -f centos.Dockerfile .

# run ansible-playbook syntax checking in alpine
# stuff in /roles are roles and are thus *not* playbooks!
lint:
	dos2unix $$(git ls-files) roles/**/**/.env*
	docker run --rm -it --name ansible -v ${CURDIR}:/work -w='/work' ansible bash -c 'ansible-playbook --syntax-check site.yml'

# run it...?
test:
	docker run --rm -it --name ansible -v ${CURDIR}:/work -w='/work' ansible ansible-playbook -i localhost, -c local site.yml
	docker run --rm -it --name ansible -v ${CURDIR}:/work -w='/work' ansible:centos ansible-playbook -i localhost, -c local site.yml
