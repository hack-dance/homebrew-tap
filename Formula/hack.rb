class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "4.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v4.0.2/hack-4.0.2-darwin-arm64.tar.gz"
      sha256 "2d02cdcd4363e2f694d94b53ec50556e52d18112a08bcde2312788aa092444f0"
    else
      url "https://github.com/hack-dance/hack/releases/download/v4.0.2/hack-4.0.2-darwin-x86_64.tar.gz"
      sha256 "aedc8915ed97a0b9b5ed27ae95f5ff543ad221f32a940e369c1f67d46022e8c3"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v4.0.2/hack-4.0.2-linux-x86_64.tar.gz"
    sha256 "70cd913e92fa7f3d444d860e1c88d14ac47fbb802e478d82415459227c339aeb"
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
