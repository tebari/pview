
check:
	cargo check

fmt:
	cargo +nightly fmt

addon:
	docker run \
		--rm \
		--privileged \
		-v ./addon:/data \
			ghcr.io/home-assistant/amd64-builder:latest \
			--all \
			--test \
			--target /data

# This will start hass on http://localhost:7123
container:
	npm install @devcontainers/cli
	npx @devcontainers/cli up --workspace-folder .
	npx @devcontainers/cli exec --workspace-folder . supervisor_run

.PHONY: addon fmt check hass
