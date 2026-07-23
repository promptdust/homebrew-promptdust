# homebrew-promptdust

Homebrew tap for [PromptDust](https://promptdust.com/) — a read-only map of where AI tools leave data on your machine.

## Install

CLI:

```sh
brew install promptdust/promptdust/promptdust
```

Desktop app (macOS):

```sh
brew install --cask promptdust/promptdust/promptdust
```

Or tap once, then use the short names:

```sh
brew tap promptdust/promptdust
brew install promptdust          # CLI
brew install --cask promptdust   # desktop app
```

## Notes

- The macOS desktop build is currently **unsigned**; on first launch Gatekeeper may warn. Installing via `--cask` clears the download quarantine, which reduces that friction.
- Linux is **x86_64 only** (no arm64 archive is shipped).
- Formulae are pinned to the latest release; the sha256 digests come from each release's `SHA256SUMS`.
