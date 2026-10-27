class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "4.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v4.2.3/hack-4.2.3-darwin-arm64.tar.gz"
      sha256 "b5a30c0792d76ce3404f72bbf88d315ccc7feb2449dbca53177c6131851b0921"
    else
      url "https://github.com/hack-dance/hack/releases/download/v4.2.3/hack-4.2.3-darwin-x86_64.tar.gz"
      sha256 "cd85d382bdd62c37d499e5d21fe2af25928b87bdd2a4e2f74a1eb324481cb28b"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v4.2.3/hack-4.2.3-linux-x86_64.tar.gz"
    sha256 "38f4f9ac8a3c0aab0e0012e512900071086e51c40e69677b4223d17231f64325"
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
