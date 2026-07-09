class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.3.4/hack-3.3.4-darwin-arm64.tar.gz"
      sha256 "9a2d3328fd0ac9b047a356319801bb5a1fc5d6e76d49ac09310c2d028edbee05"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.3.4/hack-3.3.4-darwin-x86_64.tar.gz"
      sha256 "cab15cf8f2dcaa73ebad97d4b72ba8bb15a2d38c27e2dca4ba26092b1db97f90"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.3.4/hack-3.3.4-linux-x86_64.tar.gz"
    sha256 "381cf6f534b1ada90a766b19bd715e3e0bda75ad30a819bc082836148b34fd06"
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
