class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.8.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.9/fclt-2.8.9-darwin-arm64"
      sha256 "b1ba6c68e3b3d6a80bcea21b4bb62a0841c71c6739e8ab4528d8edbacb57b88b"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.9/fclt-2.8.9-darwin-x64"
      sha256 "80b75fb46248e564503cea2161bc58aed77097e92df3b346efb5af2ea7b3178f"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.8.9/fclt-2.8.9-linux-x64"
    sha256 "9cea8d38bd34108f72708f42410af526b4942809f4f5ee10c53d54f8fae3a0bd"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
