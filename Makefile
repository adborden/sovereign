lint:
	pipenv run ansible-playbook --syntax-check -i hosts site.yml

test:
	cd roles/common && pipenv run molecule test --all

.PHONY: lint test
