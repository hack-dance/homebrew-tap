class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "3.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v3.3.5/hack-3.3.5-darwin-arm64.tar.gz"
      sha256 "f129e2ad0c5059330efacb93b6524fbd4ef879beed78f477e359a9ab01cb82d7"
    else
      url "https://github.com/hack-dance/hack/releases/download/v3.3.5/hack-3.3.5-darwin-x86_64.tar.gz"
      sha256 "a01f6c11d1b2bc7b8e556e9d72159a2031d131383184d4cc72e4f16abdd30d25"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v3.3.5/hack-3.3.5-linux-x86_64.tar.gz"
    sha256 "d56189519b5b87d61c22262962ab9117d601d70f55eb4f2fb1bb56dda22ddd8f"
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
