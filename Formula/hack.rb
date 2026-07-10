class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.3.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.3.7/hack-3.3.7-darwin-arm64.tar.gz"
      sha256 "9713b930658939d0dd370227df6d101606d28cc8432eb71a49b2efcd89e4b959"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.3.7/hack-3.3.7-darwin-x86_64.tar.gz"
      sha256 "4582127219d173dff19fc7ced3bd63132c42afe0d218b21e93e8c1f8df0ffeb5"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.3.7/hack-3.3.7-linux-x86_64.tar.gz"
    sha256 "da1d43073b38807ef3005d246ede694fc74220f80b59f4dc5c403d2b7fd33832"
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
