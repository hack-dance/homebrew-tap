class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.32.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.32.6/fclt-2.32.6-darwin-arm64"
      sha256 "5e31c88a91282181e86309cd608b8e5b8e777295cd02a118b10c2708b9e7f5c4"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.32.6/fclt-2.32.6-darwin-x64"
      sha256 "fa7dbf9c75d656958ba75a669153d0a512a6833ee190e70c36ab35b4f295b989"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.32.6/fclt-2.32.6-linux-x64"
    sha256 "4ce68f79393aea253693e2b736ce4a6af9da4ed83afaaa0ee258f87b37eb2cef"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
