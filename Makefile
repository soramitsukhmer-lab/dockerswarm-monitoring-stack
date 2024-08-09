it:
	git config --local submodule.recurse true
	git config --local status.submodulesummary 1

help:
	@echo "make [sync|deploy|remove]"
	@echo "  sync:   sync submodules"
	@echo "  deploy: deploy all services"
	@echo "  remove: remove all services"

deploy:
	$(MAKE) -C swarmlibs deploy
	$(MAKE) -C promstack deploy
	$(MAKE) -C logstack deploy

remove:
	$(MAKE) -C logstack remove
	$(MAKE) -C promstack remove
	$(MAKE) -C swarmlibs remove

sync:
	git submodule update --init --recursive -- swarmlibs
	git submodule update --init --recursive -- promstack
	git submodule update --init --recursive -- logstack
reinitialize: hacks/reinitialize.sh sync
.PHONY: hacks/reinitialize.sh
hacks/reinitialize.sh:
	@hacks/reinitialize.sh
