class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.33.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.33.1/fclt-2.33.1-darwin-arm64"
      sha256 "912d051d1e48c9332a6c280e42a0dc227aad3ccbffd067b7837b683a646d88f2"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.33.1/fclt-2.33.1-darwin-x64"
      sha256 "a1d312d3e5f58b42a7813ff2ded0863ac3fae869ee51b49ed200ed9d563a630a"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.33.1/fclt-2.33.1-linux-x64"
    sha256 "1751f1726a20055661a45280ece72dccc47d97e491dc47bb05e3a51830891e29"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
