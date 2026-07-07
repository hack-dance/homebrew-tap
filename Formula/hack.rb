class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.1.1/hack-3.1.1-darwin-arm64.tar.gz"
      sha256 "e24ba733b1e24a38a2bff716536a4c9959c6f49efda192763b825e0ee341ef24"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.1.1/hack-3.1.1-darwin-x86_64.tar.gz"
      sha256 "0e0767f47b018a2d599bf79147bed3bc9df1b3911a71a6c0c31a7d9135c4b88b"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.1.1/hack-3.1.1-linux-x86_64.tar.gz"
    sha256 "4b8a30256e4444025f38d2f9793f9e4047f324dd70d886c3b50f41be6c0530c0"
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
