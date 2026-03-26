class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.6.0/fclt-2.6.0-darwin-arm64"
      sha256 "5706069720c1c54ee10fb5f0b5ce55f5e426736389a737844e0e2adc52a11850"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.6.0/fclt-2.6.0-darwin-x64"
      sha256 "2c4c2a3b6f54d328deead99e061227582c9d31b494874d8e1eb61d005e436925"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.6.0/fclt-2.6.0-linux-x64"
    sha256 "c9ff8198418f10d232e37cd1532c5627a2971a02a392e3aada36e1a8a40c7ae2"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
