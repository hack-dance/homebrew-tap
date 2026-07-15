class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.27.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.27.1/fclt-2.27.1-darwin-arm64"
      sha256 "aa542845f3b794f4521c4a043294fb02274a2bd0e486185bafcbca6a541e1305"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.27.1/fclt-2.27.1-darwin-x64"
      sha256 "95628fe2d13ca8d2c1033304f2e340dd4819765122f3ba7ea287ecacbf2e54e4"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.27.1/fclt-2.27.1-linux-x64"
    sha256 "1fdabd6bb94381fc9fd0f067984791cad1a91c38fbaa80b322a70e90a0cf0b42"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
