class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.23.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.23.0/fclt-2.23.0-darwin-arm64"
      sha256 "68919ec611de7f1a9d44a68a671a74ff8b3655861983e4ad0bd22ae446def203"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.23.0/fclt-2.23.0-darwin-x64"
      sha256 "6ceb30a83b4e97a9c5c276e0dac0f6e769789b947c7733615084907596f165a6"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.23.0/fclt-2.23.0-linux-x64"
    sha256 "b6a4a5e965b1b596d7e95ea57c7163c976c039ec5ccbd9679cdc90b0dcd3fe5f"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
