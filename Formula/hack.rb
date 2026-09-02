class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "4.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v4.0.0/hack-4.0.0-darwin-arm64.tar.gz"
      sha256 "f2fae7d8bb6a1afe018f6dd05730fdd0aaf89961ebfde66a3e715025b5481d43"
    else
      url "https://github.com/hack-dance/hack/releases/download/v4.0.0/hack-4.0.0-darwin-x86_64.tar.gz"
      sha256 "569df589b6d622c612d6d74b85fa5f8336c0267f9ec94674be58a3cfd54bb344"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v4.0.0/hack-4.0.0-linux-x86_64.tar.gz"
    sha256 "629a74068d9af579e385dab9537e3107f4919531a57dd8093c170e14f895b24d"
  end

  def install
    libexec.install "hack"
    (libexec/"assets").install Dir["assets/*"] if (buildpath/"assets").directory?
    (libexec/"assets/binaries").install Dir["binaries/*"] if (buildpath/"binaries").directory?
    (bin/"hack").write_env_script libexec/"hack", HACK_ASSETS_DIR: libexec/"assets"
  end

  test do
    assert_match "hack", shell_output("#{bin}/hack --help")
  end
end
