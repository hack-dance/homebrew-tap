class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.30.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.30.2/fclt-2.30.2-darwin-arm64"
      sha256 "3fe64ccaab46e1356d9c9e8836cbf14295e19648bbd657d9d6c3ff5346c58579"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.30.2/fclt-2.30.2-darwin-x64"
      sha256 "d140a7611a5aaa6fc59f2c2233a62f5eaa52ee05bad36f0b83958b59c8100cbd"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.30.2/fclt-2.30.2-linux-x64"
    sha256 "a00dd389d49985ee55ac1bf8af5be05eb8a2cbe60196d8a46c6829227eeaf8df"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
