class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.3.6/hack-3.3.6-darwin-arm64.tar.gz"
      sha256 "a1b9d8ad279f612ade532c99d55f0a9b068cfd593a07dbf943f8589039baacd9"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.3.6/hack-3.3.6-darwin-x86_64.tar.gz"
      sha256 "f3b09b07652b3e4e559ec51388571cda7721f1df2adad15c56cb978312565a6f"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.3.6/hack-3.3.6-linux-x86_64.tar.gz"
    sha256 "75958fae4ee037307eec33e4c22cd8b6e10beb85875fd2135b259115aa64b050"
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
