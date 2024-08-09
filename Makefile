it:
	git config --local submodule.recurse true
	git config --local status.submodulesummary 1

help:
	@echo "make [sync|deploy|remove]"
	@echo "  sync:   sync submodules"
	@echo "  deploy: deploy all services"
	@echo "  remove: remove all services"

deploy:
	$(MAKE) -C swarmlibs deploy detach=false
	$(MAKE) -C promstack deploy detach=false
	$(MAKE) -C logstack  deploy detach=false

remove:
	$(MAKE) -C logstack  remove detach=false
	$(MAKE) -C promstack remove detach=false

sync:
	git submodule update --init --recursive -- swarmlibs
	git submodule update --init --recursive -- promstack
	git submodule update --init --recursive -- logstack
reinitialize: hacks/reinitialize.sh sync
.PHONY: hacks/reinitialize.sh
hacks/reinitialize.sh:
	@hacks/reinitialize.sh
