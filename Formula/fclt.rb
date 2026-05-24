class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.1/fclt-2.8.1-darwin-arm64"
      sha256 "b80242f555e696a38db46054e0cec7a36432dcd96e11fe1e4b3be43bf571dd24"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.1/fclt-2.8.1-darwin-x64"
      sha256 "ed194187160fb8699c0b1607ee1c3597543aa0d7942838a0758dd9018593a930"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.8.1/fclt-2.8.1-linux-x64"
    sha256 "d57a0da608a80a72d6433bc833e677022705e0a86003b109af8bde8953aef9bd"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
