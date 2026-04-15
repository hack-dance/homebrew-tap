class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.7.2/fclt-2.7.2-darwin-arm64"
      sha256 "ab18142338f7a451d3141ee3ed10c2519ed6f7061c42e259ed1fbde4c2f067a3"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.7.2/fclt-2.7.2-darwin-x64"
      sha256 "a56df5d1176e531617f2222b58231f8cc06decfc610712de9720e3044d216247"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.7.2/fclt-2.7.2-linux-x64"
    sha256 "129a9148c4c1597c0deacff2b706af52ad2113b5f85e4c0e24ff340cbea05e59"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
