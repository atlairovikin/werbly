.PHONY: all

TARGET := $(HOME)/.profile
CMDLN := { . "${PWD}/_signpost.sh" && . "$${a_script_dir}/_messenger.sh"; }

all:
	{ test -f '$(TARGET)' \
	|| touch '$(TARGET)'; \
	grep -Fq '$(CMDLN)' '$(TARGET)' \
	|| printf '\n%s\n' '$(CMDLN)' >> '$(TARGET)'; \
	} && printf '%s\n' ' done!'
