class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.32.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.32.3/fclt-2.32.3-darwin-arm64"
      sha256 "de6fcf0438bc401ba325d2b6ba6a93e7eb9640bafb73e7b57241017d6244df90"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.32.3/fclt-2.32.3-darwin-x64"
      sha256 "6da648ae3c2830d88d75dd6b5eecf9b1a971db11d586f1963fafa3852531f27b"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.32.3/fclt-2.32.3-linux-x64"
    sha256 "666749f67a4068442dd4578d20e62a1a7e2f3e4d33f90a22856799d96c9b8953"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
