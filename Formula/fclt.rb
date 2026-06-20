class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.17.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.3/fclt-2.17.3-darwin-arm64"
      sha256 "4344b80f76a470b847da350d7c0228a20c9cb0361d02911770f09c94124120b4"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.3/fclt-2.17.3-darwin-x64"
      sha256 "655a3eb629323f69085e80989e137d36619ba5d24db9c8212a8901fa63db4ccd"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.17.3/fclt-2.17.3-linux-x64"
    sha256 "f66d97981d6eef18c1dec4287d233e0e627bb069a519b213d524fb313c8e0cb7"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
