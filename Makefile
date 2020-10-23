SPACEMACS_PRIVATE_LAYERS ?= $(HOME)/.emacs.d/private

.PHONY: install
install:
	cp -r "+lang" "$(SPACEMACS_PRIVATE_LAYERS)"

.PHONY: uninstall
uninstall:
	rm -rf "$(SPACEMACS_PRIVATE_LAYERS)/+lang/elpy"
	rm -rf "$(SPACEMACS_PRIVATE_LAYERS)/+lang/elpy-plus"
