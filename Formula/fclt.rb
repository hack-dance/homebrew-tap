class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.7.0/fclt-2.7.0-darwin-arm64"
      sha256 "ffd492b77e347a080323fb77f0cfe93232b4154c55476a4778316121dbedd8cc"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.7.0/fclt-2.7.0-darwin-x64"
      sha256 "065e1068febefca740c63e0036ae899569a459e6cc59655b0e2e5a9ae6a5baeb"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.7.0/fclt-2.7.0-linux-x64"
    sha256 "e8fa1e3c9bdaf3dbe4dde095bb057ce582712c623f3556cb15ddb7852fe3084b"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
