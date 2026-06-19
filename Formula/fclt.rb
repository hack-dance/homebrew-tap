class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.8.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.8/fclt-2.8.8-darwin-arm64"
      sha256 "7017c2ed5070e02011080ac84154aad36e4d59494a2ccf02870ef9fbf54402a6"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.8.8/fclt-2.8.8-darwin-x64"
      sha256 "f4a67d4f455e346cf1e475d058b2651b28633a17e58184fe0e97be05f984e2c7"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.8.8/fclt-2.8.8-linux-x64"
    sha256 "a995251300c8db819ad56ee74f42df7ddc74c4169ab466de86c2880ccc7ac667"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
