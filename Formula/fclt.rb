class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.35.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.35.0/fclt-2.35.0-darwin-arm64"
      sha256 "9fa1d73a50f18e6c8f460e0557a77bb8a31b9f64e335ee1deb9e16e531608506"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.35.0/fclt-2.35.0-darwin-x64"
      sha256 "d3fc8cfb4a677621250f225c7dbc4ac76550fe3e0b7cb83613d9898e644f24d6"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.35.0/fclt-2.35.0-linux-x64"
    sha256 "160a11da0f7031c4f58c62b2b7d99efa7866d0b36abcac858f332ccf7ddb3aa6"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
