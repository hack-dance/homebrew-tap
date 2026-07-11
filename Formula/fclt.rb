class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.21.0/fclt-2.21.0-darwin-arm64"
      sha256 "eceab8df8a3ce4a76da5c55c15169f4c40592795f9c4b9b654cf2fc7ae05887d"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.21.0/fclt-2.21.0-darwin-x64"
      sha256 "24225b8dc70d341f9daa5ace52d73e15b42d1b6b7584b5303e3d2c5b981120e2"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.21.0/fclt-2.21.0-linux-x64"
    sha256 "bc82f6a174cc53808446830616c09f3a869b963d3e1e3d7b0b200382d62fc4c7"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
