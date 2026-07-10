class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.19.0/fclt-2.19.0-darwin-arm64"
      sha256 "30d2c4951e1bccb2ab7dfef371e0389b253fab264ee790be5f5ad9579b088868"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.19.0/fclt-2.19.0-darwin-x64"
      sha256 "47cf6bbc187c1a0641e9b23190babd5b0802c342cfdc529c995e8eae7a67e760"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.19.0/fclt-2.19.0-linux-x64"
    sha256 "f218dc4cf121f2ad1a83864d0c9ec5e60706651d9924a05c757963a31368f4a8"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
