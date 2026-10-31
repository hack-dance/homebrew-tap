class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "4.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v4.2.7/hack-4.2.7-darwin-arm64.tar.gz"
      sha256 "c0311002ce064107e9259a07e756d9fc57389d414e4fb2980a0a171ee85d4e4f"
    else
      url "https://github.com/hack-dance/hack/releases/download/v4.2.7/hack-4.2.7-darwin-x86_64.tar.gz"
      sha256 "b5c7b1ed21039563972fe5c28d021a86560e2a8ba3057feff82d2f3b936cf96c"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v4.2.7/hack-4.2.7-linux-x86_64.tar.gz"
    sha256 "1626fea18c8cd4d9893704f24b925e3e9add0249f075a93594a7aa6169d0a2bf"
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
