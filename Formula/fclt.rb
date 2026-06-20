class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.17.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.1/fclt-2.17.1-darwin-arm64"
      sha256 "c2f559d7e451db3e530313fa09d79b5c8c46563d4d0fc5191f2ad74abea86008"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.1/fclt-2.17.1-darwin-x64"
      sha256 "d663db081a693fc0cf5aea643e8aa57aefdb14ac08df150d17f6f49a5ba3c36e"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.17.1/fclt-2.17.1-linux-x64"
    sha256 "1aabffff28cad88f309732b195d4448b254cf2edae231e839785151e9a71148c"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
