SHELL := /bin/bash

VENV = source .venv/bin/activate

deps:
	poetry install

format:
	@$(VENV) && (black . && isort .)

lint:
	@$(VENV) && ( \
	mypy --config-file=./pyproject.toml ./ && \
	pylint --rcfile=./pyproject.toml ./**/*.py && \
	pycodestyle --max-line-length=120 --exclude=.venv,migrations ./ && \
	black ./ --check && \
	isort ./ --check-only && \
	pytest ./tests --cov \
	)

