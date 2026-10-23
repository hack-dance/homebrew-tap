class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "4.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v4.2.2/hack-4.2.2-darwin-arm64.tar.gz"
      sha256 "2351ad1edfd6d0f7234badabd5a7a40ae39385898bdb15ecd0742a5a39097c56"
    else
      url "https://github.com/hack-dance/hack/releases/download/v4.2.2/hack-4.2.2-darwin-x86_64.tar.gz"
      sha256 "2490740ffa87acba50ce3d78e0c0c9cd1e2e13161104f64acb91372837834892"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v4.2.2/hack-4.2.2-linux-x86_64.tar.gz"
    sha256 "1b72aa873a379ee67e4b0e9ce51c034bc2694eb564eed57a95782c1a94bb0c75"
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
