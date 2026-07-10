class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.19.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.19.2/fclt-2.19.2-darwin-arm64"
      sha256 "dabc415cea3f03d7ec6452a1cfb512ca7bec905d09b5eae15fd200f071e4fbdc"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.19.2/fclt-2.19.2-darwin-x64"
      sha256 "2285aed2c2c3c6a926c8fdad50ae921f2c6487fff35f1d37c3eda8d3e2af947d"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.19.2/fclt-2.19.2-linux-x64"
    sha256 "4f7ee33f08e25f7da7dcc493372ed4dd23fb3848ebdbc3919d86ea41707efec1"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
