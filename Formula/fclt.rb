class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.17.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.2/fclt-2.17.2-darwin-arm64"
      sha256 "f48ee537e66b3634320c862c65bc6ccb54b5c677ea7439f34b0df7c7972393a5"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.2/fclt-2.17.2-darwin-x64"
      sha256 "b12015b8b81e2162c20672e25def9fd6a211b3b833a44b54bf2f513e6b8ea84f"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.17.2/fclt-2.17.2-linux-x64"
    sha256 "4cb1e5bff5f6c38c24c579d2691a33af3623a4b16dfe9c400fc8d3f938785255"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
