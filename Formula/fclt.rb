class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.18.0/fclt-2.18.0-darwin-arm64"
      sha256 "62edd983eea4bca1ad5902bc9f131705a5943f613c03842f63745dc7a2d08c71"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.18.0/fclt-2.18.0-darwin-x64"
      sha256 "24a57d44fbcca902085e31df57084a09d027e96d1f5f6e0f837f72a8151a1906"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.18.0/fclt-2.18.0-linux-x64"
    sha256 "c312a351c0d3180aafdfbf36522e44a5a5ce2273eaad80eaf030d8c42ca09430"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
