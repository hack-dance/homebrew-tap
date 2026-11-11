class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.34.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.34.5/fclt-2.34.5-darwin-arm64"
      sha256 "91f906817006792b7f32f3a52c58679ea3d625e3ea26f36555c64df8c335db67"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.34.5/fclt-2.34.5-darwin-x64"
      sha256 "26239c2923e19c5afee18a727a8dd342cb2acc5851b64a673132a93de3d6360e"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.34.5/fclt-2.34.5-linux-x64"
    sha256 "6a0350ca48aaee50f7a895117fa985c5a1d3e0eb03bc59b9b3f8fb28c4eede72"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
