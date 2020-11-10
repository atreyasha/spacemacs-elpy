SPACEMACS_PRIVATE_LAYERS ?= $(HOME)/.emacs.d/private/+lang/

.PHONY: install
install:
	mkdir -p "$(SPACEMACS_PRIVATE_LAYERS)"
	cp -r elpy elpy-plus "$(SPACEMACS_PRIVATE_LAYERS)"

.PHONY: uninstall
uninstall:
	rm -rf "$(SPACEMACS_PRIVATE_LAYERS)/elpy"
	rm -rf "$(SPACEMACS_PRIVATE_LAYERS)/elpy-plus"
