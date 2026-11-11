class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.34.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.34.6/fclt-2.34.6-darwin-arm64"
      sha256 "ca238b00f43adc5fc616fe94e0fdc2665908edca3fe8578f008f021a508e51f7"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.34.6/fclt-2.34.6-darwin-x64"
      sha256 "00c772107717f8992f660450e090afc5319c8657f132281d984caa735b2bcb56"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.34.6/fclt-2.34.6-linux-x64"
    sha256 "dc63f496fcf388c14b50dd2fe4746583c0c7fb1ff37eeacf02b78ae4f3599cc8"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
