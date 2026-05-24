class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.0/fclt-2.8.0-darwin-arm64"
      sha256 "9237de4249d20551df391fb20ae5d0d4e751bbb370056354d32ae2ebeaccfcb0"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.0/fclt-2.8.0-darwin-x64"
      sha256 "e78c7aa543b198c4a0baa99ba74478cb45b87e8991f1f6471669772fd14c51e6"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.8.0/fclt-2.8.0-linux-x64"
    sha256 "461c88d18e4afc7613dbd55f487b1bc569f814d1ffb9134a0ef840283293baf1"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
