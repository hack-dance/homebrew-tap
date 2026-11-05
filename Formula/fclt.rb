class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.34.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.34.1/fclt-2.34.1-darwin-arm64"
      sha256 "f4ffb6a0ecb51e8c6eb6bf74b854ccd750271994d9f4c6587263de91d54db563"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.34.1/fclt-2.34.1-darwin-x64"
      sha256 "e31a1bded77d328405640ba54ee95904ef476ece9c50966fb48631749a8780dd"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.34.1/fclt-2.34.1-linux-x64"
    sha256 "daa978be33ea03f51ab8b72511993f285b3db4cd9e6865d324511f8f6ab5d092"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
