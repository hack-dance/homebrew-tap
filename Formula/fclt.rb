class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.31.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.31.1/fclt-2.31.1-darwin-arm64"
      sha256 "176a26ec78540ef4a59acca23e50a050a7543a654903a621db016e5e7f7aaec4"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.31.1/fclt-2.31.1-darwin-x64"
      sha256 "b86d392d5452348eb5fd614da2de48447115296c138182ad3e24b3662adeed01"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.31.1/fclt-2.31.1-linux-x64"
    sha256 "ac34f16523a9730a0601e068b29c326fe2d179919daf4b4df8618100fc10f17e"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
