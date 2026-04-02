class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "2.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v2.4.0/hack-2.4.0-darwin-arm64.tar.gz"
      sha256 "629f7a41b776f5a2988a693daffdbb0e191862be00404bc978ae316c54fd6569"
    else
      url "https://github.com/hack-dance/hack/releases/download/v2.4.0/hack-2.4.0-darwin-x86_64.tar.gz"
      sha256 "d6c8bb2200368a1864c1d403d45b1dfa5f13a6b5c35420c251a88c3a1ed10edb"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v2.4.0/hack-2.4.0-linux-x86_64.tar.gz"
    sha256 "a9c6204f80632018f55b9d594babb6c6adfe2c35e000a8865e5a62003926d93c"
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
