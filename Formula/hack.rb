class Hack < Formula
  desc "Environment orchestration for software projects"
  homepage "https://github.com/hack-dance/hack"
  version "4.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/hack/releases/download/v4.0.3/hack-4.0.3-darwin-arm64.tar.gz"
      sha256 "0cb822499c140f8890428b52968d55864c49b76c01e3b04c49ce8555b4372693"
    else
      url "https://github.com/hack-dance/hack/releases/download/v4.0.3/hack-4.0.3-darwin-x86_64.tar.gz"
      sha256 "f3b4373b6a8a91b689ef3209fed5882194163a7e72914c870642bd431cbfd659"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/hack/releases/download/v4.0.3/hack-4.0.3-linux-x86_64.tar.gz"
    sha256 "52c6f0f70432d721f834f1ed897a8aad5a6c9a7837a4b6c0d52eb02c0312a321"
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
