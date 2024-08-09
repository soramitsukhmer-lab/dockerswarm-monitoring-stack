make: .stack/init sync

sync:
	git pull --recurse-submodules

deploy: .stack/swarmlibs
	@$(MAKE) -C promstack deploy detach=false
	@$(MAKE) -C logstack  deploy detach=false

upgrade:
	@$(MAKE) -C promstack upgrade
	@$(MAKE) -C logstack  upgrade

remove:
	@$(MAKE) -C promstack remove
	@$(MAKE) -C logstack  remove

.stack/init:
	@mkdir -p .stack && touch .stack/init
	.stack/reinitialize.sh
	git pull --recurse-submodules
	git config --local submodule.recurse true
	git config --local status.submodulesummary 1
.stack/swarmlibs:
	@mkdir -p .stack && touch .stack/swarmlibs
	@$(MAKE) -C swarmlibs deploy detach=false
