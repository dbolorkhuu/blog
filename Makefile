.PHONY: all push run

all: push

push:
	eval $$(ssh-agent -s) && \
	ssh-add .ssh/id_ed25519 && \
	git push && \
	ssh-agent -k

run:
	bundle config set --local path vendor/bundle && \
	bundle install && \
	bundle exec jekyll serve
