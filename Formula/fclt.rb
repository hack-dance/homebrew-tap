class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.34.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.34.2/fclt-2.34.2-darwin-arm64"
      sha256 "a6edc28356fbd2e601ef76a725a6e89e75f9d6b092b9269e677d26921e3dc96b"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.34.2/fclt-2.34.2-darwin-x64"
      sha256 "e026a63977b72c463ce1a5cb869dc13ac6b8fd5e91a30d12bb8731b351f5a119"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.34.2/fclt-2.34.2-linux-x64"
    sha256 "c38ab77d4151f6e8a550914186003f956bda38fb723ac66b4cab531043743316"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
