.PHONY: all

PROFILE := '$(HOME)/.profile'
WERBLY := '$(HOME)/werbly'
CMDLN := '{ export "werblyPath"="$(WERBLY)" && . "$${werblyPath}/.foo/waystone.sh"; }'

all:
	@{ test -f $(PROFILE) \
	|| touch $(PROFILE); \
	grep -Fq $(CMDLN) $(PROFILE) \
	|| printf '\n%s\n' $(CMDLN) >> $(PROFILE); \
	} && printf 'Done!\n'
