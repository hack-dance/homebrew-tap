class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "2.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v2.5.1/hack-2.5.1-darwin-arm64.tar.gz"
      sha256 "009b47c42abd1750fee6549ac3dba4d143f975440ec5000cfd1ff54092b81a38"
    else
      url "https://github.com/hack-dance/hack/releases/download/v2.5.1/hack-2.5.1-darwin-x86_64.tar.gz"
      sha256 "c5e8f1a7d639c6b9c27b5a7aba8074bbe2068d9356a72e301c53f95372758a6f"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v2.5.1/hack-2.5.1-linux-x86_64.tar.gz"
    sha256 "8f75658e7bfa32f520a8b235198f7cdd6946fc849ff290f5c11bf18bd62a9a6c"
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
