class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.3.3/hack-3.3.3-darwin-arm64.tar.gz"
      sha256 "3af2855225032d19afcdd136c33117efcf450b539c212502671b99086e14f3df"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.3.3/hack-3.3.3-darwin-x86_64.tar.gz"
      sha256 "cce358022a71da4664797cd0ff9e39e5af219653b92d3d72b80034a7f51aa235"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.3.3/hack-3.3.3-linux-x86_64.tar.gz"
    sha256 "7d23587dc3713322bf088279a94a1886b85ed5b5fe1525eaad43bc0220f72a28"
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
