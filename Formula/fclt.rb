class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.32.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.32.2/fclt-2.32.2-darwin-arm64"
      sha256 "852ac9d29cf341d0d8e6b2ee380f2eb4f821b0b9a71828121696bf206284fb90"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.32.2/fclt-2.32.2-darwin-x64"
      sha256 "c2d7b1e1bee0e780e32012f6f20c80cdcc8f7a0a3f084e570fbe39e16a2c8e4e"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.32.2/fclt-2.32.2-linux-x64"
    sha256 "0e1ffe169e2b0b197702f6b07bd9a84a1bde5b8dc8b0ea2ae718e467c111a202"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
