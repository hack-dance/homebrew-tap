class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.32.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.32.8/fclt-2.32.8-darwin-arm64"
      sha256 "16cfecffd98e26972fbceef569e1b99a68ab42e953e00d8338e8475b7759d06f"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.32.8/fclt-2.32.8-darwin-x64"
      sha256 "2c96a58546fe70cb2285be27ff744b451cd9926a511c54c8d98ab229c21bae6f"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.32.8/fclt-2.32.8-linux-x64"
    sha256 "d79f7a048cb049dc62225cf9b6f25170b73b34a6b309cee4cfec3d52cef9bb36"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
