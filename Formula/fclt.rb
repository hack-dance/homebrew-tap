class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.15.1/fclt-2.15.1-darwin-arm64"
      sha256 "a918e648df3806f23f9da4d80a690a58ec4eef87598ce94f3a476957e6bf5cc3"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.15.1/fclt-2.15.1-darwin-x64"
      sha256 "e9adc594cdd6fbb96a614cf0a8bdd8149aa8f736c5b25a227af3b34387ea4e03"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.15.1/fclt-2.15.1-linux-x64"
    sha256 "19ac09d002506c3f1935b9a902d0146e9696a67a1da66646ba31701f6ee61c81"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
