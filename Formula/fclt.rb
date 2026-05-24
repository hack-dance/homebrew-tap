class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.7.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.7.5/fclt-2.7.5-darwin-arm64"
      sha256 "9eddd00c43e7004d047571886194760e9665330be02fa1b3dcd26bdf93c005da"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.7.5/fclt-2.7.5-darwin-x64"
      sha256 "c28b7253c2d34cf09abe126cface7395fc2cc475b15322a282f7972b7037f95d"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.7.5/fclt-2.7.5-linux-x64"
    sha256 "726350df0aabb5c4592f97bb3052e6ef50f1555bb136096b5fecb520fd50c1e7"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
