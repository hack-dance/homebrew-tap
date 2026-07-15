class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.28.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.28.0/fclt-2.28.0-darwin-arm64"
      sha256 "930381f21cbbcd1cd81e9e1912d13baf5083c045d5f9605c6cb738feba8539fc"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.28.0/fclt-2.28.0-darwin-x64"
      sha256 "a9227f0d024e59297ec3febc48401d3dc94f625f2174daef40acaacbaf294465"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.28.0/fclt-2.28.0-linux-x64"
    sha256 "1f96054692230862182181324c622620a415a7cfea11c9b228a0f4fbcf9596ef"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
