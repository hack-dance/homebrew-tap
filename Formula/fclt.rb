class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.17.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.11/fclt-2.17.11-darwin-arm64"
      sha256 "c1046a643fc04f2bb24cb0b2ac3ac024e7106d02c080b64d902d951a0bfa8d3d"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.11/fclt-2.17.11-darwin-x64"
      sha256 "69d462b9117c20ae7eb0e908510fdf8c0e1e309fd8acdb005430cbffa8429657"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.17.11/fclt-2.17.11-linux-x64"
    sha256 "98b38b7d6ea27cb19d314d28f4c37d3fbc29c403362f976878a8a90a34bdb24c"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
