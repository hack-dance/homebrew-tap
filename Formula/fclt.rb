class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.16.0/fclt-2.16.0-darwin-arm64"
      sha256 "4fccb6a4a7e402269bcef9973737f68d3920279134f1927a2997f6f8c6341fc0"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.16.0/fclt-2.16.0-darwin-x64"
      sha256 "cda25c3278aaca2e4386b44267ecb2dfbd3c1f116fb0fa0ce84633561ef8926b"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.16.0/fclt-2.16.0-linux-x64"
    sha256 "4b286346ca782d1755d7fe9bfa68266e2ea3b13cd6a69ed2a549a783dce34fa1"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
