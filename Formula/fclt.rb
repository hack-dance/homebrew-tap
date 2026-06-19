class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.11.0/fclt-2.11.0-darwin-arm64"
      sha256 "db823df33d826099bafb0feb9e5ca968b3c24153ab6b8dbe9c1c192b72a9bd36"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.11.0/fclt-2.11.0-darwin-x64"
      sha256 "d0e7430aa412a58818aa0746873935bbc05cd3d12e2badc2275285fe81a24902"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.11.0/fclt-2.11.0-linux-x64"
    sha256 "54f78684dfc148f6fb85fd97a57fd1581fef54badaa9edd7442f0c14e66ba299"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
