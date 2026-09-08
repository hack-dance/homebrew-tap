class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "4.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v4.1.1/hack-4.1.1-darwin-arm64.tar.gz"
      sha256 "968f75fe66cd84fdf93b0c5b64ca5df02f98c74281b5a9238125b3afd2f3d72b"
    else
      url "https://github.com/hack-dance/hack/releases/download/v4.1.1/hack-4.1.1-darwin-x86_64.tar.gz"
      sha256 "72e4c8fc5b3b1fc575b5b19eccbec70791ec6bee0d2b71c2686fca41daaacf48"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v4.1.1/hack-4.1.1-linux-x86_64.tar.gz"
    sha256 "b8e990563d827593c5649fe7e7d388e40a63359dab802b3111a3287b443c545e"
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
