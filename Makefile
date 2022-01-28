.PHONY: checks
checks: git-attributes

.PHONY: git-attributes
git-attributes:
	git --no-pager diff --check `git log --oneline | tail -1 | cut --fields=1 --delimiter=' '`

.PHONY: build
build:
	cd docker ; docker build -t jura_oereb_print . ; cd ..

.PHONY: serve
serve: build
	docker-compose up --build --remove-orphans -d
