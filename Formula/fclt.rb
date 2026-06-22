class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.17.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.7/fclt-2.17.7-darwin-arm64"
      sha256 "29cb7a8a1176b73d1dd40d3cdc22bcc73b379c66d9804b47e0c2c4d0ef7cb8ed"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.7/fclt-2.17.7-darwin-x64"
      sha256 "751e11ef06de8f5ed906c99d2216b31bcaaa5a01a7213016d1be3b59d991b61d"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.17.7/fclt-2.17.7-linux-x64"
    sha256 "17af2386311ec81c3ed43f61aa17d698c5551613c595d8d148631dda7638805a"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
