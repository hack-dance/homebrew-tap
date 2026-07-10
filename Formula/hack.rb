class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.5.0/hack-3.5.0-darwin-arm64.tar.gz"
      sha256 "5bd2b3875fcaef127c26fbba2cd6709d4d7b80027e0e111fbaffe261e90e22f4"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.5.0/hack-3.5.0-darwin-x86_64.tar.gz"
      sha256 "4ed109e16562d3087211b0eb8524bc682a69d6a1a327db04e24699362c312a8b"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.5.0/hack-3.5.0-linux-x86_64.tar.gz"
    sha256 "5d6c0e9550f44de751c63b993cb10c9ff49b4c23a23c804a3ec6e1e52dccc6ca"
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
