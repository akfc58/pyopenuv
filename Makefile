clean:
	. .venv/bin/activate; pre-commit uninstall
	rm -rf .venv/
coverage:
	.venv/bin/py.test -s --verbose --cov-report term-missing --cov-report xml --cov=pyopenuv tests
init:
	virtualenv .venv
	.venv/bin/pip3 install poetry
	. .venv/bin/activate; poetry lock; poetry install; pre-commit install
lint:
	.venv/bin/flake8 pyopenuv
	.venv/bin/pydocstyle pyopenuv
	.venv/bin/pylint pyopenuv
publish:
	.venv/bin/poetry build
	.venv/bin/poetry publish
	rm -rf dist/ build/ .egg *.egg-info/
test:
	.venv/bin/py.test
typing:
	.venv/bin/mypy --ignore-missing-imports pyopenuv
