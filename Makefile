.PHONY: all push run

PORT ?= 4001

all: push

push:
	git add . && git commit -m "update"
	eval $$(ssh-agent -s) && \
	ssh-add .ssh/id_ed25519 && \
	git push && \
	ssh-agent -k

run:
	bundle config set --local path vendor/bundle && \
	bundle install && \
	bundle exec jekyll serve --port $(PORT)
