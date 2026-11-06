class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.34.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.34.3/fclt-2.34.3-darwin-arm64"
      sha256 "e4e1d5b9acbecca8ce3406a678103577168cfbbccac88c8ac47fa70870bcfd0c"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.34.3/fclt-2.34.3-darwin-x64"
      sha256 "0413899c524e3aa842a691d0c67cf5b5121a8f6c0f0033b7e57bb55268b22dca"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.34.3/fclt-2.34.3-linux-x64"
    sha256 "6f1191ef34e16e7b6cc97450fc7e876d17d28e5bd087caf835877dacd3ff05ae"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
