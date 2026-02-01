.PHONY: build watch

build:
	@wow-build-tools build -d -t TokenTransmogTooltips -r ./.release

watch:
	@wow-build-tools build watch -t TokenTransmogTooltips -r ./.release
