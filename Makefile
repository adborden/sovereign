ROLE_DIRS := \
  roles/common

ROLE_TEST_TARGETS := $(patsubst %, test-%, $(ROLE_DIRS))

lint:
	pipenv run ansible-playbook --inventory hosts --syntax-check site.yml
	pipenv run ansible-lint site.yml

ci-glob:
	@echo $(ROLE_TEST_TARGETS)

setup:
	pipenv install --dev

$(ROLE_TEST_TARGETS):
	# Get the role dir from the target
	cd $(subst test-,,$@) && pipenv run molecule test --all

test: $($ROLE_TEST_TARGETS)


.PHONY: ci-glob lint setup test $(ROLE_TEST_TARGETS)
