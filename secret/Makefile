.PHONY: all
all: manifest.yaml

manifest.yaml: kustomization.yaml scoreserver.env oauth2-proxy.env discord-admin-bot.env
	kustomize build . > $@
%.env: %.env.template
	envsubst < $< > $@
