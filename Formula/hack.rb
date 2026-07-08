class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.2.0/hack-3.2.0-darwin-arm64.tar.gz"
      sha256 "0dfe59d13f9bfcf95cc9610f564831d6a2da6308edb9ebd06a3d76935b3274d9"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.2.0/hack-3.2.0-darwin-x86_64.tar.gz"
      sha256 "d309a53faac4bbe93787e64179a87faad7874cf79ec5b6f20a9b961710fbf9ae"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.2.0/hack-3.2.0-linux-x86_64.tar.gz"
    sha256 "72007af3366f80968a6716219281b23ac17bdfa76eac73c30344ba816a2b0051"
  end

  def install
    libexec.install "hack"
    (libexec/"assets").install Dir["assets/*"] if (buildpath/"assets").directory?
    (libexec/"assets/binaries").install Dir["binaries/*"] if (buildpath/"binaries").directory?
    bin.write_env_script libexec/"hack", HACK_ASSETS_DIR: libexec/"assets"
  end

  test do
    assert_match "hack", shell_output("#{bin}/hack --help")
  end
end
