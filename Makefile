.PHONY: all push

all: push

push:
	eval $$(ssh-agent -s) && \
	ssh-add .ssh/id_ed25519 && \
	git push