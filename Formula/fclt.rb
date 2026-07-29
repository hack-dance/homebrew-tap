class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.29.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.29.2/fclt-2.29.2-darwin-arm64"
      sha256 "0fc90847151558b49187cd0a566db6c4abb8ca3fa1c881450fa070d02c2f2333"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.29.2/fclt-2.29.2-darwin-x64"
      sha256 "8fa4763054fea45d9cf820594b208bdeadd6524a84aca07f68cd6e449e3b3783"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.29.2/fclt-2.29.2-linux-x64"
    sha256 "e80887d06945506ae6fc7508a1e0c794c16c237cb0cb2be103fb5504476d6874"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
