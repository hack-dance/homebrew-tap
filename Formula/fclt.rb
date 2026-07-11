class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.22.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.22.1/fclt-2.22.1-darwin-arm64"
      sha256 "9586fffd4d8ca820f12a18184c4ea5e02925caa95215c4c3ed672ac1e9cfc078"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.22.1/fclt-2.22.1-darwin-x64"
      sha256 "3dca1f1de905bb602e3f1e47673f58b3f1822c2725ce3f3e3eab0c0a6f791431"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.22.1/fclt-2.22.1-linux-x64"
    sha256 "f7c4cd3a1cf77cc7c98efd951c0bcfcc263c4bca51aa6b4a6e664bc8ea8ff520"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
