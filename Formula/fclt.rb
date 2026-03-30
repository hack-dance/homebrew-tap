class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.7.1/fclt-2.7.1-darwin-arm64"
      sha256 "165f144963162fb73f2e0f8f940b31608d0afd814733addccbedc984d0c27bc5"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.7.1/fclt-2.7.1-darwin-x64"
      sha256 "53d3e36a46d1f48f2ab525f048ec9c413898d25dba3d3dd976f424b4b5d5a6fc"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.7.1/fclt-2.7.1-linux-x64"
    sha256 "e6b7902ba834bf2fa81859a402402893a96f9884abcc6e266876923cfe0490a9"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
