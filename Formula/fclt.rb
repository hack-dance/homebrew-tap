class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.30.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.30.3/fclt-2.30.3-darwin-arm64"
      sha256 "a1f965a5caf9859c4ff4cb003deafc9c3550e3333aed4cf29f13c705f5ad1ee1"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.30.3/fclt-2.30.3-darwin-x64"
      sha256 "209bfa8be2efb646211cb34eb2e16aacf60c576536e0719a1a53874286907190"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.30.3/fclt-2.30.3-linux-x64"
    sha256 "fdf9ca6b72da22ff276d49e81c03e722246a1533bf3ad1d8e5280403499672e1"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
