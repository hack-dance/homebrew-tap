class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.7.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.7.7/fclt-2.7.7-darwin-arm64"
      sha256 "1095c49f49bdc82abc0022e925afce3067707a7414d94f23de0bbe43697c2cc9"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.7.7/fclt-2.7.7-darwin-x64"
      sha256 "b18264de939d1e5b561f3634fe75c9402d8a73c0ad351d1244dd63056cc6a422"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.7.7/fclt-2.7.7-linux-x64"
    sha256 "adfd4036013fe11db882a0cc8fd74c75cf44067456c73e8be74178a5717e3a95"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
