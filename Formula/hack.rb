class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "4.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v4.2.5/hack-4.2.5-darwin-arm64.tar.gz"
      sha256 "501f2f159b4669ad8d2baf0a04411b898a323747c3088a15c7c928934cb234b9"
    else
      url "https://github.com/hack-dance/hack/releases/download/v4.2.5/hack-4.2.5-darwin-x86_64.tar.gz"
      sha256 "a100f4f9337b66b255e70eaf4cab8e9ec155d029264c37f7faee569b52ff1049"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v4.2.5/hack-4.2.5-linux-x86_64.tar.gz"
    sha256 "a422e14ac3b0904a2ad7bd8678e1d05089390658dc2594eda1f4a99aada411b5"
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
