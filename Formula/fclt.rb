class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.5.1/fclt-2.5.1-darwin-arm64"
      sha256 "45a5b18cbd7eff70caed50c45e763d37aea2a3d2b6cfabd826731a31ffd7edeb"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.5.1/fclt-2.5.1-darwin-x64"
      sha256 "83ec966c4fe9f47b69419ddd69e0cef91e89472584a0e59647e187b9e25d6d5f"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.5.1/fclt-2.5.1-linux-x64"
    sha256 "33989e350f2e4ec68e99cd8b3f2f8eac60f553d05680f6fbea3550905b7ab8a6"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
