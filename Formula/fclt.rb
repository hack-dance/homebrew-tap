class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.25.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.25.0/fclt-2.25.0-darwin-arm64"
      sha256 "ba1617f24787c2a780e727223372016a7c1ee5e86dfa24657d70d8e5888be37e"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.25.0/fclt-2.25.0-darwin-x64"
      sha256 "456bf3816e127244b9d24f5c9faaf4bd4959327e3110df152b54d6d1169afc9b"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.25.0/fclt-2.25.0-linux-x64"
    sha256 "affd4abe4f1edbbb290e6a51d2e175405b4c15283f28d6aff23772fe384145ff"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
