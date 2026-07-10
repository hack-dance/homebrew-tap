class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.4.0/hack-3.4.0-darwin-arm64.tar.gz"
      sha256 "7e71aca517c5ca2b3735ab90d3766787749f432b589b1a66689f06b3e5ad6c2b"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.4.0/hack-3.4.0-darwin-x86_64.tar.gz"
      sha256 "41feb78eaa19db767df57b8d4e2db3fe61b4de6a8f009266718b90feb7d47fc5"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.4.0/hack-3.4.0-linux-x86_64.tar.gz"
    sha256 "0251ef5db2b61b9027058e4da9afa4f2fcbf4d671523c542e24357178b131860"
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
