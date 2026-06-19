class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.9.0/fclt-2.9.0-darwin-arm64"
      sha256 "33eb11b08b806a118f44ff75caadcc97663ec74113f4e45463f62cf91dbe7a16"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.9.0/fclt-2.9.0-darwin-x64"
      sha256 "b63f0785cfacb78bd434175d99ef5a9e1d3426b06ba184520ee60e8ace85a602"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.9.0/fclt-2.9.0-linux-x64"
    sha256 "5bb768879918af6727b0aff316c5ce516eb931a78c2707b7b21241d08b698305"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
