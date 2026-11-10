class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "4.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v4.3.0/hack-4.3.0-darwin-arm64.tar.gz"
      sha256 "760d310c81477453a08e6854247d7c17020551a9e6dd696b4b2da49d095c56be"
    else
      url "https://github.com/hack-dance/hack/releases/download/v4.3.0/hack-4.3.0-darwin-x86_64.tar.gz"
      sha256 "83050424bcf6b7a7fed38d8fbc7b5c2e07bb790f05c4c68526479ef87391bba8"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v4.3.0/hack-4.3.0-linux-x86_64.tar.gz"
    sha256 "a5df15bc84b93810d9de3f3795b5f66d082fb7c4e09bfc34f8e1160e4d743007"
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
