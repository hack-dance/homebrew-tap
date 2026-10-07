class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.32.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.32.0/fclt-2.32.0-darwin-arm64"
      sha256 "9107bdea06c45b5ad8b2cb0aa20bf41dfebb23175707e8af2eb4524ec68d7c22"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.32.0/fclt-2.32.0-darwin-x64"
      sha256 "b5eb68d79e04d8059ebceb6f49c5b5a1d9156e0eb4594413ee1ee1a442b805a3"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.32.0/fclt-2.32.0-linux-x64"
    sha256 "18e91a5eafba901e3dc74ef6c2e4eb83ac128d4f0409caef5bdcdc4c8f9e19d8"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
