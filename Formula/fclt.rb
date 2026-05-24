class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.7.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.7.6/fclt-2.7.6-darwin-arm64"
      sha256 "f68756eeded1ae18ec2712dfe7cedca4633fbcd634c0886e5b44d13611a04292"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.7.6/fclt-2.7.6-darwin-x64"
      sha256 "b87d3ca03353c0deee1cf58d78faa4776b186de110df53d7222e30f9348f3424"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.7.6/fclt-2.7.6-linux-x64"
    sha256 "cc131da198dd573801afecf60f0acff735e8cc9d548f94c887574e502649b971"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
