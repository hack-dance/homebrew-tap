class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.15.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.15.2/fclt-2.15.2-darwin-arm64"
      sha256 "b847e35fe92cc3dc0b7ca3587cdf2c61780f7737730b085fcc624295f1188ff3"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.15.2/fclt-2.15.2-darwin-x64"
      sha256 "cbf066675f7c7ed61f8616e5058101edfcb2a2d58961af518802a4ff04cf08c3"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.15.2/fclt-2.15.2-linux-x64"
    sha256 "56f0c76344ff24bbd6774e13bbdd5351847661f2ddad155743280255f111c6a4"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
