class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.4.0/fclt-2.4.0-darwin-arm64"
      sha256 "546dc3993e9ac9dd21f2db33409c177f92a32e04076a383e6fb5759711afe47c"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.4.0/fclt-2.4.0-darwin-x64"
      sha256 "8e43923e645053cf1de81d7417533bfec262b11ad45403065df9c9bf4eb03b96"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.4.0/fclt-2.4.0-linux-x64"
    sha256 "f1c8493b57c9ba949540670b86a68ae1bc3cd73a16e26e1463263cc38e333a8b"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
