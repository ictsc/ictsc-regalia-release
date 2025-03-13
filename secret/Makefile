.PHONY: all
all: manifest.yaml

manifest.yaml: kustomization.yaml scoreserver.env oauth2-proxy.env discord-admin-bot.env sstate.env sstate-ca.crt
	kustomize build . > $@
%.env: %.env.template
	envsubst < $< > $@
sstate-ca.crt:
	echo "$$SSTATE_CA" > $@
