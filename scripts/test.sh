#!/bin/bash
poetry run pytest -s --tb=native --durations=5 --cov=v20 --cov-report=html tests
poetry run coverage report --fail-under=0