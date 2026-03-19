class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/facult"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/facult/releases/download/v2.0.0/fclt-2.0.0-darwin-arm64"
      sha256 "b0dee9e2b955a1c31f1771fdf4dc62cb3a89df42c704be5820839052d3b6bfbc"
    else
      url "https://github.com/hack-dance/facult/releases/download/v2.0.0/fclt-2.0.0-darwin-x64"
      sha256 "6f705a974cc88f304b0d9f768a88e4cd599edf8d791967969164bcd3740c8200"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/facult/releases/download/v2.0.0/fclt-2.0.0-linux-x64"
    sha256 "4b614cb5cdbcb72d02bfe1f38ec4bfab57b7bb8494ce9902781c876de508b4f5"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
