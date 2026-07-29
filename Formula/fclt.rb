class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.29.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.29.0/fclt-2.29.0-darwin-arm64"
      sha256 "8bc32d117f7d3b6802d8fae587db6d19d2dccce7add738ee7819dd3844b7607d"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.29.0/fclt-2.29.0-darwin-x64"
      sha256 "ef13b33309382eba3aa03007bacccc72f3ef035e60206b41d30372fc146290c8"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.29.0/fclt-2.29.0-linux-x64"
    sha256 "bb130e0243f56820d2985dc170b593aa952e5eaa8d8401e1c680d435384530a2"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
