class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.31.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.31.0/fclt-2.31.0-darwin-arm64"
      sha256 "0940b1025729f7c55afe7edad52e8089cdcc18280c50119fa4fb1a337dfb82fa"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.31.0/fclt-2.31.0-darwin-x64"
      sha256 "170b9ed30b3b14f7ccb77df015a067d4340775d87e0851f131dc6d0bf419f95d"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.31.0/fclt-2.31.0-linux-x64"
    sha256 "bbbfd85a408b9a80931d99b0c421e826ed39d8640e530c1ebe847cdd489a9b9f"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
