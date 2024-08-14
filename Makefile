make: .stack .stack/init sync
deploy: .stack .stack/swarmlibs .stack/promstack .stack/logstack
upgrade: promstack/upgrade logstack/upgrade

sync:
	git pull --rebase=true origin --prune --verbose
	git submodule update --init --recursive -- logstack promstack swarmlibs

.stack:
	@mkdir -p .stack
.stack/init:
	@touch .stack/init

define stack_specs
.stack/$(1):
	@touch .stack/$(1)
	@$(MAKE) -C $(1) deploy detach=false
.PHONY: $(1)/deploy
$(1)/deploy:
	@$(MAKE) -C $(1) deploy detach=false
.PHONY: $(1)/upgrade
$(1)/upgrade:
	@$(MAKE) -C $(1) upgrade
.PHONY: $(1)/remove
$(1)/remove:
	@rm -rf .stack/$(1)
	@$(MAKE) -C $(1) remove
endef

$(eval $(call stack_specs,swarmlibs))
$(eval $(call stack_specs,promstack))
$(eval $(call stack_specs,logstack))
