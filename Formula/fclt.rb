class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.27.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.27.2/fclt-2.27.2-darwin-arm64"
      sha256 "f989d1b555a810dd108d64cf442f5601332ecd591fa539c2ab61d70146d307f6"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.27.2/fclt-2.27.2-darwin-x64"
      sha256 "0098b660646da9f32a8659b46b1769742a82bdabdd78d4e2da5f25558c2e2af7"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.27.2/fclt-2.27.2-linux-x64"
    sha256 "ed6a6b17ed149be88262e8b02c5399178f53e86cf70d88974942eabd60d18bf4"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
