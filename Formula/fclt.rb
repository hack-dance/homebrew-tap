class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.13.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.13.2/fclt-2.13.2-darwin-arm64"
      sha256 "891b50496f5e58502ec309f33a4f4ca484773ab0d5605a521bb857822eeb36cd"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.13.2/fclt-2.13.2-darwin-x64"
      sha256 "789b915069d3afe573928b1453b71121694a1cf00725f05c9c52e8c7b827d11f"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.13.2/fclt-2.13.2-linux-x64"
    sha256 "4116a3fedb49fa45d29dac0adef7b01b71d5fae1ac12c18f8ac9cfa260dec19f"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
