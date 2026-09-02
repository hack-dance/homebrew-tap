class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "4.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v4.0.1/hack-4.0.1-darwin-arm64.tar.gz"
      sha256 "0d5c995af89c0ab1af2c0e0bc8e32d02bb5f9824ffa587e9f0182314ff088645"
    else
      url "https://github.com/hack-dance/hack/releases/download/v4.0.1/hack-4.0.1-darwin-x86_64.tar.gz"
      sha256 "cc397c32f0ef9aef24bf8a66ca694b7450e808214695c830457adce2068efcdb"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v4.0.1/hack-4.0.1-linux-x86_64.tar.gz"
    sha256 "f96dea2fec619279895e889aef3abd08496b4209e59398ddc6c63941866bcecf"
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
