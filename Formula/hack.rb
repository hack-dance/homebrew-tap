class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.3.0/hack-3.3.0-darwin-arm64.tar.gz"
      sha256 "90f0654f41fb11915e74e6710d2c09eabd03dda0cbeafd5f5891504d7bccc1e7"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.3.0/hack-3.3.0-darwin-x86_64.tar.gz"
      sha256 "004a1ada917bcd61a27f5a12694d39d3edb6164ba8238145c117583da2b6243b"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.3.0/hack-3.3.0-linux-x86_64.tar.gz"
    sha256 "3ee3f795f69d3d181c1e46f41657c9e6f63161afcd8503c2d92c78599ba1bd31"
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
