class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.0.0/hack-3.0.0-darwin-arm64.tar.gz"
      sha256 "a12469420c6fc43f517c8e2bbe2662c3be91e1bd0b199f95c1ec83bf2655d1c6"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.0.0/hack-3.0.0-darwin-x86_64.tar.gz"
      sha256 "194ca922b3e2af4bcda3daaf10932493a4b6a98303ca51f5426aeb3ff9fce0f7"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.0.0/hack-3.0.0-linux-x86_64.tar.gz"
    sha256 "b2395aab701587ba496447dce99a1a50a44412f51f35b509338ec037738df5da"
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
