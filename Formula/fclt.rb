class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.32.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.32.4/fclt-2.32.4-darwin-arm64"
      sha256 "574fae1bead1134f283ec251f3ef238fa3e44196209937c67ed53ae65668d557"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.32.4/fclt-2.32.4-darwin-x64"
      sha256 "3e983325c495069651e44f8eff3d0c162473c85dc544a8b0b5d87025bf16b646"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.32.4/fclt-2.32.4-linux-x64"
    sha256 "c06f53249a2bf1853d2fda18d95e04356cc55780e8ce6d0fe6440a4b757dd8e8"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
