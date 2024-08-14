make:
deploy:
	@$(MAKE) .stack
	@$(MAKE) .stack/swarmlibs
	@$(MAKE) .stack/promstack
	@$(MAKE) .stack/logstack
upgrade:
	@$(MAKE) promstack/upgrade
	@$(MAKE) logstack/upgrade
remove:
	@$(MAKE) promstack/remove
	@$(MAKE) logstack/remove

pull:
	git pull --rebase=true origin --prune --verbose
	git submodule update --init --recursive -- logstack promstack swarmlibs

.stack:
	@mkdir -p .stack
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
