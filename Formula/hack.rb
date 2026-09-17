class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "4.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v4.2.1/hack-4.2.1-darwin-arm64.tar.gz"
      sha256 "557583d946abcd0dd0a3fa12b2f7b81f18310d594b0699d663ebf239d0d4d729"
    else
      url "https://github.com/hack-dance/hack/releases/download/v4.2.1/hack-4.2.1-darwin-x86_64.tar.gz"
      sha256 "d975539cf2684be0d17aba301410023e779cefe29d9be1c1403ffa2f187cd8cc"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v4.2.1/hack-4.2.1-linux-x86_64.tar.gz"
    sha256 "87c1d77f9df804e758b6c4b0a0913dde179cd75f387c2053bc64576ee93ac5bd"
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
