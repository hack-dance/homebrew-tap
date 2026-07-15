class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.25.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.25.4/fclt-2.25.4-darwin-arm64"
      sha256 "11ea69d09e320c2e628d8bd49560e2decc292f6ac0280d7e59f5469975b3a857"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.25.4/fclt-2.25.4-darwin-x64"
      sha256 "885418b510fac091b99d623d92e4ede0bebd63a650c4219d6e0be224f7eac9c6"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.25.4/fclt-2.25.4-linux-x64"
    sha256 "f09026d2cd7517388296d35d0b1345fc38c3d20532e400a18c49a31d82955fc8"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
