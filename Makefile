make:
	hacks/reinitialize.sh
	git pull --recurse-submodules
	git config --local submodule.recurse true
	git config --local status.submodulesummary 1

help:
	@echo "make [sync|deploy|remove]"
	@echo "  sync:   sync submodules"
	@echo "  deploy: deploy all services"
	@echo "  remove: remove all services"

sync:
	git pull --recurse-submodules

deploy:
	$(MAKE) -C swarmlibs deploy detach=false
	$(MAKE) -C promstack deploy detach=false
	$(MAKE) -C logstack  deploy detach=false
