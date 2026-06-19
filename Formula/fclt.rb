class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.13.0/fclt-2.13.0-darwin-arm64"
      sha256 "664b4bb7fa369b470120dcbb066bc7a250d31e51110a3ac4f6a54c08296ea90a"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.13.0/fclt-2.13.0-darwin-x64"
      sha256 "58d81b68be024dd1e001efcdc3460c8c0b8fb1e806490c8b953238935fb5cb8f"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.13.0/fclt-2.13.0-linux-x64"
    sha256 "3fac4a43d9d13456af3873bd5318049da752972f227f4f2dc15f432b100e46ea"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
