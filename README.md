# homebrew-tap

**Official Homebrew tap for NebInfra command-line tools.**

This repository ships [Homebrew](https://brew.sh) formulae for the NebInfra CLI suite. Add the tap once and install any tool with `brew install`. Every formula pins the upstream release tag and SHA-256 sum, so Homebrew's built-in checksum verification catches any tampering at install time.

> **In scope.** Formulae for tools published from the `nebinfra/*-dist` release-asset mirrors.
> **Out of scope.** Source code, internal development builds, or any tool not in the table below.

---

## Table of contents

- [Add the tap](#add-the-tap)
- [Available formulae](#available-formulae)
- [Verify signatures (defense-in-depth)](#verify-signatures-defense-in-depth)
- [Pin a specific version](#pin-a-specific-version)
- [Update and upgrade](#update-and-upgrade)
- [Uninstall](#uninstall)
- [Supported platforms](#supported-platforms)
- [Reporting concerns](#reporting-concerns)

---

## Add the tap

```bash
brew tap nebinfra/tap
```

Homebrew converts `nebinfra/tap` to `https://github.com/nebinfra/homebrew-tap` automatically; the `homebrew-` prefix on the repo name is part of the Homebrew tap convention.

Homebrew 6.0 and later requires a one-time trust grant for every tap outside the official Homebrew organization, because formulae are code that runs at install time:

```bash
brew trust nebinfra/tap
```

Without it, `brew install` fails with `Refusing to load formula ... from untrusted tap nebinfra/tap`. Trusting the tap covers all current and future formulae in the table below.

Once tapped and trusted, install any formula with the bare name:

```bash
brew install nebcli
brew install nebguard
```

---

## Available formulae

| Formula | Description | Upstream release mirror |
| --- | --- | --- |
| `nebcli` | NebInfra CLI (cluster bootstrap, Helm validation, kubectl / argocd / aws proxying) | [`nebinfra/nebcli-dist`](https://github.com/nebinfra/nebcli-dist) |
| `nebguard` | NebGuard, the AI guardrails engine for Claude Code (`settings.json` hooks, audit trail) | [`nebinfra/nebguard-dist`](https://github.com/nebinfra/nebguard-dist) |

Each formula resolves to the platform-specific release asset (`Darwin`/`Linux`, `x86_64`/`arm64`) and verifies the SHA-256 sum recorded in the formula.

---

## Verify signatures (defense-in-depth)

Homebrew's built-in SHA-256 verification protects against tampering after the formula is committed. For an additional cryptographic check against the NebInfra signing key, run cosign after installing:

```bash
APP=nebcli                                          # or nebguard
PREFIX=$(brew --prefix "$APP")
VERSION=$("$PREFIX/bin/$APP" --version 2>/dev/null | head -n1 | awk '{print $NF}')
OS=$(uname -s)
ARCH=$(uname -m)

curl -fsSL -o "/tmp/${APP}.tar.gz" \
  "https://github.com/nebinfra/${APP}-dist/releases/download/${VERSION}/${APP}_${VERSION#v}_${OS}_${ARCH}.tar.gz"
curl -fsSL -o "/tmp/${APP}.bundle" \
  "https://github.com/nebinfra/${APP}-dist/releases/download/${VERSION}/${APP}_${VERSION#v}_${OS}_${ARCH}.tar.gz.bundle"

cosign verify-blob \
  --bundle "/tmp/${APP}.bundle" \
  --key "https://raw.githubusercontent.com/nebinfra/trust/main/cosign-keys/${APP}-prod.pub" \
  --rekor-url https://rekor.sigstore.dev \
  "/tmp/${APP}.tar.gz"
```

A successful run prints `Verified OK`. The full trust model (cosign + AWS KMS + Rekor transparency) is documented at [`nebinfra/trust`](https://github.com/nebinfra/trust).

---

## Pin a specific version

To install a specific historical version (every release is immutable):

```bash
brew install nebcli@1.2.3
```

For long-term pinning to avoid auto-upgrade:

```bash
brew pin nebcli
```

---

## Update and upgrade

```bash
brew update                      # refresh tap metadata
brew upgrade nebcli nebguard     # upgrade installed NebInfra tools
```

Or upgrade everything tapped, including third-party formulae:

```bash
brew upgrade
```

---

## Uninstall

```bash
brew uninstall nebcli
brew uninstall nebguard
brew untap nebinfra/tap          # optional, drops the tap entirely
```

For `nebguard`, also run `nebguard uninstall` before removal to restore `~/.claude/settings.json` and clean `~/.nebcore/nebguard/`.

---

## Supported platforms

Each formula installs a prebuilt binary straight from the signed release tarball, so there is no compile step. Homebrew resolves the right archive for your platform:

| OS | Architecture |
| --- | --- |
| macOS 12+ | Apple Silicon (`arm64`) and Intel (`x86_64`) |
| Linux | `x86_64` and `arm64` |

The tarball's SHA-256 sum is pinned in the formula, so Homebrew verifies integrity before it installs the binary.

---

## Reporting concerns

For formula bugs (wrong checksum, broken bottle, missing platform), open an issue at <https://github.com/nebinfra/homebrew-tap/issues>.

For supply-chain concerns about the underlying binaries themselves, please open a **security advisory** in the relevant `-dist` repository (`nebinfra/nebcli-dist` or `nebinfra/nebguard-dist`). The full trust + signature design lives at [`nebinfra/trust`](https://github.com/nebinfra/trust).
