class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "4.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v4.1.0/hack-4.1.0-darwin-arm64.tar.gz"
      sha256 "4d7261b50e312860e2c4e90fb14a597f67bf2c053f6b06f25fd424028e2d08a7"
    else
      url "https://github.com/hack-dance/hack/releases/download/v4.1.0/hack-4.1.0-darwin-x86_64.tar.gz"
      sha256 "d16018b42ec3e5de5f4e3cecc12a08acbc1455670eab89c740d2aceb99800987"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v4.1.0/hack-4.1.0-linux-x86_64.tar.gz"
    sha256 "a80f48c156958bdf1fd30b2bfe1e2e1307b651fe7d3bf13073bc025395dafd88"
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
