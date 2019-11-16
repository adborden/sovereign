.PHONY: setup test

test:
	pipenv run ansible-playbook --inventory hosts --syntax-check site.yml
	pipenv run ansible-lint site.yml

setup:
	pipenv install --dev
