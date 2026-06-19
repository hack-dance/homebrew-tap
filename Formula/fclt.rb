class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.8.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.6/fclt-2.8.6-darwin-arm64"
      sha256 "be7b1fd5ead7ccd7d8e9072711083be5a613ae96b113ebdf3eed0f3b4d4c79dd"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.6/fclt-2.8.6-darwin-x64"
      sha256 "c5f8d11efeb05037c1ba57de8473b592a68ce126dd1519ae3b6bd7915c167ef6"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.8.6/fclt-2.8.6-linux-x64"
    sha256 "1b3dce80e8b9b9b13fbbd8401770900d646e03a820ff8154612cbec971870d17"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
