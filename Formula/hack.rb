class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "4.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v4.2.4/hack-4.2.4-darwin-arm64.tar.gz"
      sha256 "1819af1716cd72e3521b1668968e4504c76965cd54fe29a6ffca833da0d38e25"
    else
      url "https://github.com/hack-dance/hack/releases/download/v4.2.4/hack-4.2.4-darwin-x86_64.tar.gz"
      sha256 "368d7e134c806647db9c9af4823dde37f84535d90e51d171bb9cb4b2a529d39f"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v4.2.4/hack-4.2.4-linux-x86_64.tar.gz"
    sha256 "a796100c47b8ca36c7638c5ed6606e249e16344a9d93ba221ce3b8a94d208adb"
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
