class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.4.1/hack-3.4.1-darwin-arm64.tar.gz"
      sha256 "5bcc7dd5bb5414672d722e3b35c1c15167cb54d88769411764fd7aee7763c609"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.4.1/hack-3.4.1-darwin-x86_64.tar.gz"
      sha256 "6c7e82a7bbaac6458ebbcf4f63129a8f533e0a8e8e7c1716bbf50e5113f8cacc"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.4.1/hack-3.4.1-linux-x86_64.tar.gz"
    sha256 "553c9cab64b28e54f72ffc1e1dde45f67949f4ca3415de76dc1bcf8f04830c30"
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
