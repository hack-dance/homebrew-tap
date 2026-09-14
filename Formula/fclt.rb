class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.30.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.30.5/fclt-2.30.5-darwin-arm64"
      sha256 "6fb7cdb3458e62129c0bb99774c77ba8a65ea6326a24338159b19fe311badd44"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.30.5/fclt-2.30.5-darwin-x64"
      sha256 "d799fdd842c4dcdc8cd05a8ae07efb378bf6357a63fa1ad50ae596874d5f0028"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.30.5/fclt-2.30.5-linux-x64"
    sha256 "b7d8587c15438f085209b02eb0b83d1d65f4ec7019939501982b36dfbbbeb5bc"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
