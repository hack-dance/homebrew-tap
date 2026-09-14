class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.31.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.31.3/fclt-2.31.3-darwin-arm64"
      sha256 "7b38a205ebd77e1b8c6f90b6b1ba74a4f95619970fb3e272779a23d8ad7abd20"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.31.3/fclt-2.31.3-darwin-x64"
      sha256 "e59065ee4ae1d597498533d6909509283eca7f6ce77a7eb0b5ad0bd235df244c"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.31.3/fclt-2.31.3-linux-x64"
    sha256 "6fb9fc9849516b6f30a94fc1ac27fe4ebe6063ac9c683a8fa95ae9d37e61d1b5"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
