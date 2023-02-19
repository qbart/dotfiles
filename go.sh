#!/bin/sh

go install github.com/oz/tz@latest
go install github.com/traefik/yaegi/cmd/yaegi@latest
go install github.com/hetznercloud/cli/cmd/hcloud@latest
go install golang.org/x/tools/cmd/godoc@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/charmbracelet/vhs@latest
go install github.com/cloudflare/cfssl/cmd/cfssl@latest
go install github.com/cloudflare/cfssl/cmd/cfssl-certinfo@latest

# Hunt down social media accounts by username across social networks
go install github.com/sherlock-project/enola/cmd/enola@latest

# Muffet is a website link checker which scrapes and inspects all pages in a website recursively.
go install github.com/raviqqe/muffet/v2@latest
