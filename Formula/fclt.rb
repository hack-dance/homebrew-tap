class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.17.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.10/fclt-2.17.10-darwin-arm64"
      sha256 "8777a94639e7334dd0f2be11d685d8e9463bf182c6d2cf94cf0a837c10a08af3"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.10/fclt-2.17.10-darwin-x64"
      sha256 "4a204aadfeceb1c968f0a74c1686f6fdf6196ab75390798b644a064fda98dfa7"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.17.10/fclt-2.17.10-linux-x64"
    sha256 "6e4fe746b659e7d498f5a20e1a66d09c055f60785db4bacb4bb9274b587a55c3"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
