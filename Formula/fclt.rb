class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.26.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.26.0/fclt-2.26.0-darwin-arm64"
      sha256 "93c9eec1d8b18f5fac666a209f1b7cccc15e8332023b72d01e47c7eb6f1ed01f"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.26.0/fclt-2.26.0-darwin-x64"
      sha256 "bdedd9d9eceb53ba51ed7c869d855132aecb363ec6ccb1cf2f7a97c927c1c518"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.26.0/fclt-2.26.0-linux-x64"
    sha256 "074e06e015af2f1e4a5fa55663f01957a43159ebf0847db32cddd8289a31c902"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
