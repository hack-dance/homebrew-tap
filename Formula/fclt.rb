class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.3.0/fclt-2.3.0-darwin-arm64"
      sha256 "53746c76aa5b730999c3d658b4e9acce28027a26dd46956346c67679ddaed2b5"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.3.0/fclt-2.3.0-darwin-x64"
      sha256 "c85f68702f0bf6e0f7a9eee380ef638ad5498cc4f6186ed840047e6a2fe915e8"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.3.0/fclt-2.3.0-linux-x64"
    sha256 "165cdb94f68c9e5eb0d6681191ac849b173f9c3c1dbcc7f04e38b267d4b2c5f0"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
