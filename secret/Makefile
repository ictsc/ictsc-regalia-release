.PHONY: all
all: manifest.yaml

manifest.yaml: kustomization.yaml scoreserver.env oauth2-proxy.env
	kustomize build . > $@
%.env: %.env.template
	envsubst < $< > $@
