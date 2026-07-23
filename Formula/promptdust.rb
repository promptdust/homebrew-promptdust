# PromptDust CLI (`promptdust`). Pre-built binary formula: universal macOS,
# x86_64 Linux. Pinned to the v0.2.0 release. On each new release, bump the
# version in the URLs and replace the sha256 digests with the values from that
# release's SHA256SUMS.
class Promptdust < Formula
  desc "Read-only map of where AI tools leave data on your machine"
  homepage "https://promptdust.com/"
  license "Apache-2.0"

  # One universal archive serves both arches, so on_arm and on_intel share the
  # same url + sha256. Homebrew forbids url/sha256 directly under on_macos, so
  # both per-arch blocks are required even though they're identical.
  on_macos do
    on_arm do
      url "https://github.com/promptdust/promptdust/releases/download/v0.2.0/promptdust-macos-universal.tar.gz"
      sha256 "4c8c10f9095197324634df3210f81384d47dd9a09ef6980642a097cd25dde26a"
    end
    on_intel do
      url "https://github.com/promptdust/promptdust/releases/download/v0.2.0/promptdust-macos-universal.tar.gz"
      sha256 "4c8c10f9095197324634df3210f81384d47dd9a09ef6980642a097cd25dde26a"
    end
  end

  # Linux is x86_64 only; no arm64 Linux archive is shipped.
  on_linux do
    on_intel do
      url "https://github.com/promptdust/promptdust/releases/download/v0.2.0/promptdust-linux.tar.gz"
      sha256 "b85c77bff10e48367094a903c51d892088273848ee0d745d3fd393a870b51da8"
    end
  end

  def install
    bin.install "promptdust"
  end

  test do
    assert_match "PromptDust #{version}", shell_output("#{bin}/promptdust version")
  end
end
