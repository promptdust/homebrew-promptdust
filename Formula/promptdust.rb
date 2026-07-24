# PromptDust CLI (`promptdust`). Pre-built binary formula: universal macOS,
# x86_64 Linux. Pinned to the v0.3.1 release. On each new release, bump the
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
      url "https://github.com/promptdust/promptdust/releases/download/v0.3.1/promptdust-macos-universal.tar.gz"
      sha256 "a648ee8afdc00326078cc05b3747e8c0287b175b08aee5da6e96a414f255873f"
    end
    on_intel do
      url "https://github.com/promptdust/promptdust/releases/download/v0.3.1/promptdust-macos-universal.tar.gz"
      sha256 "a648ee8afdc00326078cc05b3747e8c0287b175b08aee5da6e96a414f255873f"
    end
  end

  # Linux is x86_64 only; no arm64 Linux archive is shipped.
  on_linux do
    on_intel do
      url "https://github.com/promptdust/promptdust/releases/download/v0.3.1/promptdust-linux.tar.gz"
      sha256 "f83f2616a4ed3e1001e2b60ecb70cda541d6b5dcbe9ca54ef6a0f4e720db42b1"
    end
  end

  def install
    bin.install "promptdust"
  end

  test do
    assert_match "PromptDust #{version}", shell_output("#{bin}/promptdust version")
  end
end
