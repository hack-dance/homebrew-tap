class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "4.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v4.2.0/hack-4.2.0-darwin-arm64.tar.gz"
      sha256 "c62b533aaddbeaafa594cab682cf10041c9bcaea69e2fe25e33e85df49654a85"
    else
      url "https://github.com/hack-dance/hack/releases/download/v4.2.0/hack-4.2.0-darwin-x86_64.tar.gz"
      sha256 "d78e5a7604f128888bb6561d4103135af74436e7054cabed7056c08711c11339"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v4.2.0/hack-4.2.0-linux-x86_64.tar.gz"
    sha256 "407b0a94e0be73c1a86057866ebfb422c361303cd93dc2ce53e3469dc340369d"
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
