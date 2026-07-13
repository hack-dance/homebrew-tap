class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.24.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.24.0/fclt-2.24.0-darwin-arm64"
      sha256 "227e0ff54a499cca88fa8f14f86d719e8fd4aac5cbd49cda92b5157d66bf0699"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.24.0/fclt-2.24.0-darwin-x64"
      sha256 "24735f425dff867b7e241eeb0cf7d4a8bb6827778c0639991e7f03eab591ce61"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.24.0/fclt-2.24.0-linux-x64"
    sha256 "d5def24c87fc11b01fee7443d68973eaaa004a039b18f46f368a3d150a0f59bd"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
