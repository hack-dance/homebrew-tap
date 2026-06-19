class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.0/fclt-2.17.0-darwin-arm64"
      sha256 "db9334a5363f14a74eb86bdd331183fbac7c66e3a94936b520d0d69c371b999c"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.0/fclt-2.17.0-darwin-x64"
      sha256 "028f39a2f101c2e6a29f27eb6711303b7777924b762d69a07d9d3776e7c1e6fc"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.17.0/fclt-2.17.0-linux-x64"
    sha256 "54354d74fccd0a3f2b59a7c811da1535d9d0ad4d57f642eb5be2f0b9b1284106"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
