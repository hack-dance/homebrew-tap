class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.30.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.30.0/fclt-2.30.0-darwin-arm64"
      sha256 "7a4825ffc5e5f160cc6c5cf9c0cccb26292b24493fbfd9ca29f4161b72323646"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.30.0/fclt-2.30.0-darwin-x64"
      sha256 "64cd123e93a255c7b13a26720f9b87b4833e03daf59b3a673d8a8981f54267d2"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.30.0/fclt-2.30.0-linux-x64"
    sha256 "b0388696db21bda135360356294ad29fe5c8b45c8c822f99ed9a0ca0d9a3768a"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
