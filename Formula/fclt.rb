class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.5.2/fclt-2.5.2-darwin-arm64"
      sha256 "ce0e98586eac8226a473176ac443d20020bb94d935b697aa1119f93ec916d3c8"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.5.2/fclt-2.5.2-darwin-x64"
      sha256 "ae5dad3d830ba1de4680abcb822b6e8dc654318cfae0581461dc802722c07f20"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.5.2/fclt-2.5.2-linux-x64"
    sha256 "c089f70602135f769c89e9e5009f5c3cb820f3c9da47caab20a57ac802ddd34c"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
