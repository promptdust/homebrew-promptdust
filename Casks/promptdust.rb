# PromptDust desktop app (macOS). Pinned to v0.2.0. On each new release, bump
# the version and replace the sha256 with the PromptDust_<version>_universal.dmg
# digest from that release's SHA256SUMS.
#
# The build is currently UNSIGNED (Developer ID + notarization land in engine
# issue #41), so a first launch may still hit Gatekeeper. `brew install --cask`
# clears the download quarantine, which reduces (does not remove) that friction.
cask "promptdust" do
  version "0.2.0"
  sha256 "11379cdb20a83f242d720b47b690b0b794e562b6fde666b5f25e164395c40fc5"

  url "https://github.com/promptdust/promptdust/releases/download/v#{version}/PromptDust_#{version}_universal.dmg",
      verified: "github.com/promptdust/promptdust/"
  name "PromptDust"
  desc "Read-only map of where AI tools leave data on your machine"
  homepage "https://promptdust.com/"

  # The app's bundle declares Monterey as its minimum; mirror that here
  # (symbol form means ">= that version").
  depends_on macos: :monterey

  app "PromptDust.app"

  # Uninstall cleanup (only runs on `brew uninstall --zap`); missing paths are skipped.
  zap trash: [
    "~/Library/Application Support/com.promptdust.desktop",
    "~/Library/Caches/com.promptdust.desktop",
    "~/Library/Preferences/com.promptdust.desktop.plist",
    "~/Library/Saved Application State/com.promptdust.desktop.savedState",
    "~/Library/WebKit/com.promptdust.desktop",
  ]
end
