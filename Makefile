make: .make/init

sync:
	git pull --recurse-submodules

deploy:
	@$(MAKE) -C swarmlibs deploy detach=false
	@$(MAKE) -C promstack deploy detach=false
	@$(MAKE) -C logstack  deploy detach=false

remove:
	@$(MAKE) -C swarmlibs remove
	@$(MAKE) -C promstack remove
	@$(MAKE) -C logstack  remove

.make/init:
	@mkdir -p .make
	@touch .make/init
	hacks/reinitialize.sh
	git pull --recurse-submodules
	git config --local submodule.recurse true
	git config --local status.submodulesummary 1
