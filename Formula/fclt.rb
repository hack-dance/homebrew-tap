class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.32.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.32.5/fclt-2.32.5-darwin-arm64"
      sha256 "fc5d9a49bf3636127fcb35b31606424a7e935b1dc712f1d3142fe318f3ca664d"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.32.5/fclt-2.32.5-darwin-x64"
      sha256 "26dc34df56166682eb08170f3c3e52762081d7c261ba49e1c1df69ef1df9534c"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.32.5/fclt-2.32.5-linux-x64"
    sha256 "2d6462f605519180ae4568c841527da7883cd4ae89ce48e174a69ab538b71b2a"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
