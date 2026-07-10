class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.20.0/fclt-2.20.0-darwin-arm64"
      sha256 "e96a608ab901bd04e3f3b6f7f4b22ff41df786242dab6f3778d470160cbed634"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.20.0/fclt-2.20.0-darwin-x64"
      sha256 "a70e82d1e8666f5bf1dcf28e0457517f38f159d74228586dc84f0361143a6bfc"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.20.0/fclt-2.20.0-linux-x64"
    sha256 "fa122c0c27b85fab741d3469448a688af53fd9209032350aafa51b5872923121"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
