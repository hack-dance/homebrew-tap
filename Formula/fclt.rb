class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.8.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.11/fclt-2.8.11-darwin-arm64"
      sha256 "dd3db96b89e238ba91af85bc59029addfcc6f605ff6f68e336fbdc478528da4b"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.11/fclt-2.8.11-darwin-x64"
      sha256 "85867ada762d35ad6a5f529d56d083e4179b67e030fb79c2d4094226a5948cc9"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.8.11/fclt-2.8.11-linux-x64"
    sha256 "ba21d0716902c036b22164f25547383dcd425c597a42074772854359e91e856e"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
