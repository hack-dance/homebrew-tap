class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.7.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.7.3/fclt-2.7.3-darwin-arm64"
      sha256 "ce0dfb39a065a410ade147038409c1e21ca42532189b8e8dab7e9ad07dce34c7"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.7.3/fclt-2.7.3-darwin-x64"
      sha256 "a7b3af5f6ad1427465c8353f47944a1a30347c0cd407b48a3cdc94d2777f87ce"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.7.3/fclt-2.7.3-linux-x64"
    sha256 "4447852e6e24d2898efe3dc5399089fdc44e8abf165466b1cd39000fa721d539"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
