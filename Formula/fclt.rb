class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.19.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.19.1/fclt-2.19.1-darwin-arm64"
      sha256 "d9584417226046c96e25d98a2d8e31b522b0564d4315745587c92d00b7a5069c"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.19.1/fclt-2.19.1-darwin-x64"
      sha256 "b3ecc1258dc1f7823a1f73251e4991aa0babb487772ded3f98b07a6669cbadef"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.19.1/fclt-2.19.1-linux-x64"
    sha256 "1396f92bf0d0ba6ed9f9d0c515c6bb0b1c87b84cf079508d6157bf8541822599"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
