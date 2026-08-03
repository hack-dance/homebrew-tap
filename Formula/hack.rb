class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.5.2/hack-3.5.2-darwin-arm64.tar.gz"
      sha256 "4a9759c99e9149b87205fddeb6afd9c4ccfe1d2c5f27a145cb3447ff19e9e962"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.5.2/hack-3.5.2-darwin-x86_64.tar.gz"
      sha256 "e8129948784edddf6a0e482382d79f30925ce35842194658d5546bd83a3711b5"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.5.2/hack-3.5.2-linux-x86_64.tar.gz"
    sha256 "4643864ffd1ed251c77eb444137f00849af8daf233ff968c9590a56f70b43fac"
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
