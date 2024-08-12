make: .stack/init sync
deploy: .stack/swarmlibs .stack/promstack .stack/logstack
upgrade: promstack/upgrade logstack/upgrade
remove: promstack/remove logstack/remove

sync:
	git pull --recurse-submodules

.stack/init:
	@mkdir -p .stack && touch .stack/init
	utils/reinitialize.sh
	git pull --recurse-submodules
	git config --local submodule.recurse true
	git config --local status.submodulesummary 1

define stack_specs
.stack/$(1):
	@mkdir -p .stack && touch .stack/$(1)
	@$(MAKE) -C $(1) deploy detach=false
.PHONY: $(1)/deploy
$(1)/deploy:
	@$(MAKE) -C $(1) deploy detach=false
.PHONY: $(1)/upgrade
$(1)/upgrade:
	@$(MAKE) -C $(1) upgrade
.PHONY: $(1)/remove
$(1)/remove:
	@$(MAKE) -C $(1) remove detach=false
endef

$(eval $(call stack_specs,swarmlibs))
$(eval $(call stack_specs,promstack))
$(eval $(call stack_specs,logstack))
