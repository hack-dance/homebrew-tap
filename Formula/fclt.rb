class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.1.2/fclt-2.1.2-darwin-arm64"
      sha256 "839a5681ff355371d57b1f890b48c9c80387fee97cc85f6de10df4317db15f40"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.1.2/fclt-2.1.2-darwin-x64"
      sha256 "111e29e666d7f4748d3b39cbf4cf4636c06056a03cd1a1226024ef67e97f6e7d"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.1.2/fclt-2.1.2-linux-x64"
    sha256 "ea7ae4933e6b8322f657b5714ef2e8e967de06539d6e85f196d43a0035051572"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
