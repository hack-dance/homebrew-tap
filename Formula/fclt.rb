class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.27.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.27.0/fclt-2.27.0-darwin-arm64"
      sha256 "0bf352aca6cddfd4f43b4eb02f898e06f89a339afc84dfd1d3743d613fd95d0c"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.27.0/fclt-2.27.0-darwin-x64"
      sha256 "34ee10109da8dc51b0b186c3b4594a411fd0424efc798e93f284681b15e898a2"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.27.0/fclt-2.27.0-linux-x64"
    sha256 "1c691695cf2afa0b41aa12c73815ab06b00ef3188dcaa4b9b1867edbf8aea249"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
