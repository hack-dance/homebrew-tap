class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.3.2/hack-3.3.2-darwin-arm64.tar.gz"
      sha256 "dfa10cefb7ee66948e2d14737d3edf596ed688e7855fb604a5ef7a1785335e57"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.3.2/hack-3.3.2-darwin-x86_64.tar.gz"
      sha256 "867a0e463a9283713c7fdc4c4dfeaf2dfc769d8740fbec2150eb648dcf00f626"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.3.2/hack-3.3.2-linux-x86_64.tar.gz"
    sha256 "37c64d73a5d5de4a66fa180278e4d80a4490239ecd6068fe3a7b53ed3d33100b"
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
