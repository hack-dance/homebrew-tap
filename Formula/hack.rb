class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "2.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v2.5.0/hack-2.5.0-darwin-arm64.tar.gz"
      sha256 "1eca323c2537a6a05e600d53e34c1a9adf19636473f0ac71f04eb74d40761c6c"
    else
      url "https://github.com/hack-dance/hack/releases/download/v2.5.0/hack-2.5.0-darwin-x86_64.tar.gz"
      sha256 "a2a6404d9c8634db6c50540cbbd5c04744b23da4e0d13a7ce3d25d32f2f0c04a"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v2.5.0/hack-2.5.0-linux-x86_64.tar.gz"
    sha256 "8d71466706fa56d468f6d3139b536f6b731fff200f4d7a52c0a1a93e554de611"
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
