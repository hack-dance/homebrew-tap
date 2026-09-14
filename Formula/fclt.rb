class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.31.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.31.2/fclt-2.31.2-darwin-arm64"
      sha256 "3a0b33a43b8f3b10a85dc3f6b87a755d51805415b1a8748cece4039239d1cc47"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.31.2/fclt-2.31.2-darwin-x64"
      sha256 "6e21a84ed4ffce489b346e6b504c894db85ec6e2bcdde6136eab4aaf34a358bd"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.31.2/fclt-2.31.2-linux-x64"
    sha256 "d2b24e4aa04e487b1c85561600303d9fa4c0bbee3f4fd66cbc95037368c325d2"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
