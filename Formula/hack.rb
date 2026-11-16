class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "4.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v4.3.1/hack-4.3.1-darwin-arm64.tar.gz"
      sha256 "196006cade08e70bd7b1f2ca40fc582327928565d747457e8237d2638fbeafc3"
    else
      url "https://github.com/hack-dance/hack/releases/download/v4.3.1/hack-4.3.1-darwin-x86_64.tar.gz"
      sha256 "5c213f8312bfe6d5941b5643057069f9e5b5f71779a7d935a3864ca2ac9b873e"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v4.3.1/hack-4.3.1-linux-x86_64.tar.gz"
    sha256 "30821047f0f91a0480215ffd7c0dcc0b2ff21554f3c5f00028fbae7759442d09"
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
