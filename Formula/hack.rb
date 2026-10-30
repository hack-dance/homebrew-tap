class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "4.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v4.2.6/hack-4.2.6-darwin-arm64.tar.gz"
      sha256 "2d7e729cbec21800f052ddf73b5cb3175188ae1cce8709299bb184439324bb18"
    else
      url "https://github.com/hack-dance/hack/releases/download/v4.2.6/hack-4.2.6-darwin-x86_64.tar.gz"
      sha256 "75519a3c2ebcbfc99ee8f99072ef91302d8f578f35844e79f84b0747ede889d4"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v4.2.6/hack-4.2.6-linux-x86_64.tar.gz"
    sha256 "dffaca0b2544472573573867cae61b5b39a3e875454177cf2086450272b2491c"
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
