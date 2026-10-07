class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.31.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.31.4/fclt-2.31.4-darwin-arm64"
      sha256 "2d166da3aa43238da5963468d08e9bbaeaafacbc5ac07f8e4df52dfb6ac5e41a"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.31.4/fclt-2.31.4-darwin-x64"
      sha256 "0cea8cfbd615729a52f2c3a7ca1f6f127663f56f92efa38cb471e4912babfe6c"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.31.4/fclt-2.31.4-linux-x64"
    sha256 "52a7dc52549047ff8951aac4d82c68e105dad1af1f7c0ebd369095a57b71c64e"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
