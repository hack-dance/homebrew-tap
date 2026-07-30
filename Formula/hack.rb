class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.5.1/hack-3.5.1-darwin-arm64.tar.gz"
      sha256 "4877e58dccf74c6d3df6154c51d9f92355fd6a300b5b2af3df8fcd3678fa1431"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.5.1/hack-3.5.1-darwin-x86_64.tar.gz"
      sha256 "5e450574709ff94f88e3e7ebc2fa911c10b238737549302c95d347c38056038c"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.5.1/hack-3.5.1-linux-x86_64.tar.gz"
    sha256 "d549672835922f1e4382db5678dac245e13bcb5da36a1110f7869af40ff5312a"
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
