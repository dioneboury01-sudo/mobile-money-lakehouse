.PHONY: up down test clean

up:
	docker compose up -d

down:
	docker compose down

test:
	pytest tests/

clean:
	rm -rf __pycache__ .pytest_cache logs/*
