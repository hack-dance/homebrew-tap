class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.13.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.13.3/fclt-2.13.3-darwin-arm64"
      sha256 "e9b0691c24d072445f1ebde2698810dea352d925eab5f34ebdef174202fa1218"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.13.3/fclt-2.13.3-darwin-x64"
      sha256 "41198f43bb3e4eaadf18c4f018ea51150fd185dee5b8a05f19bd64006c53b671"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.13.3/fclt-2.13.3-linux-x64"
    sha256 "e3597615f12f2bce8e18822176d7ff287d8e4d35e0b2307777244651bcf2d91b"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
