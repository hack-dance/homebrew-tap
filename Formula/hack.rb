class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.3.1/hack-3.3.1-darwin-arm64.tar.gz"
      sha256 "cbe5f8672162db3eda70139aca421e4d704da74a1085e4afefc1c9f4cbf9ba86"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.3.1/hack-3.3.1-darwin-x86_64.tar.gz"
      sha256 "e5d5bdf8bd121297ace586041e33d8484d16ce9467ed8a866f3d8b77de2495e5"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.3.1/hack-3.3.1-linux-x86_64.tar.gz"
    sha256 "8a1f344185a4f03a87888eedf8018b829fb090ce960405b85a88268508c2db23"
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
