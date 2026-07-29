class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.29.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.29.1/fclt-2.29.1-darwin-arm64"
      sha256 "2f275d75ebd96a93680fa550b8f1eedc6e6e8e8f8cd965238adecccb2078f184"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.29.1/fclt-2.29.1-darwin-x64"
      sha256 "ca346e4a7aea47e2bb0d913a1700fdd528a3cd0ee7bf5518aab52c891b3633b4"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.29.1/fclt-2.29.1-linux-x64"
    sha256 "2e0ed3bb437a18b3cc4d50c028509600fc7712c1911c0b882633cd3cddff0f78"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
