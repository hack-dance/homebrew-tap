class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.13.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.13.4/fclt-2.13.4-darwin-arm64"
      sha256 "cc955d2d668eafb5ae4f6cefab0b21065fa0828151ea2407a7276f1614c252b1"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.13.4/fclt-2.13.4-darwin-x64"
      sha256 "3ccf42c9f49a2e9eeb7fb3433f448eaccbb4efd1be717f15a6b41336c4d75f0b"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.13.4/fclt-2.13.4-linux-x64"
    sha256 "72684c7ec9bc5e67a0d537203b53ba535445d2db0d2150301158f9919f0c3b6b"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
