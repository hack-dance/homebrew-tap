class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.1.0/hack-3.1.0-darwin-arm64.tar.gz"
      sha256 "424d1cb5df6e7df9149617c7ec2a06463add765e5d577579d7321e2637617225"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.1.0/hack-3.1.0-darwin-x86_64.tar.gz"
      sha256 "ddc1cedd8fa061f12ebcfe338981bf14809e679ac8e57eff7ce12859dfbf7e1f"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.1.0/hack-3.1.0-linux-x86_64.tar.gz"
    sha256 "c04ca35933081ec50b6ae917fbfa40bd571398d67f011d5e1b5f0f70246da0e6"
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
