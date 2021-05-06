SKELETON="https://github.com/guppy0130/ansible_skeleton.git"

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

# make a new role. Makefile will only run from this location, so feel free to
# cd anywhere. also, for some reason on WSL2/Windows, you have to rm/mkdir/git
# init before skeleton init, otherwise ansible-galaxy will complain about a
# missing new-role/.git/COMMIT_EDITMSG
#
# check to see if the role exists first, and if it does, exit 1. Force the user
# to rm it themselves manually first.
#
# check to see if skeleton exists too, otherwise go ahead and clone it
new-role:
ifdef n
# figure out if the correct environment is activated.
	@(echo "$(CONDA_DEFAULT_ENV)" | grep "ansible" > /dev/null) || (echo "Please activate the ansible env first!" && exit 1)
# then see if the role already exists
	@if [ -d "roles/$(n)" ]; then echo "role $(n) already exists" && exit 1; fi
# figure out where the skeleton is first
	@if ! [ -d "roles/skeleton" ]; then echo "missing roles/skeleton, fetching from git" && cd roles && git clone $(SKELETON) skeleton; fi
# then make the role!
	mkdir roles/$(n)
	cd roles/$(n) && git init
	cd roles && ansible-galaxy role init --offline --role-skeleton skeleton $(n) --force
	cd roles/$(n) && rm -rf .git
	cd roles/$(n) && rm -rf COPYING .gitignore .pre-commit-config.yaml
else
	@echo "Incorrect usage. Pass n="
	@echo
	@echo "Example: make new-role n=new-role"
	@echo
endif
