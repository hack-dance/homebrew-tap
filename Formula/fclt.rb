class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.30.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.30.4/fclt-2.30.4-darwin-arm64"
      sha256 "6a591ef44985e32932cb6e8a27dfb2f867c9d432d72823f77dfda579089e632e"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.30.4/fclt-2.30.4-darwin-x64"
      sha256 "e013d85d191895bf4d5aac5744af61a634697b4a91df39a778a9dcf285d0b40d"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.30.4/fclt-2.30.4-linux-x64"
    sha256 "2ebc23ddad03db62679ef817d36a17d8622276ff200a587a5fe4201a11978fc4"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
