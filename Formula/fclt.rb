class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.17.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.6/fclt-2.17.6-darwin-arm64"
      sha256 "712cbbb00b0607529a8076b21720c2d03e3b49e2554261d50b49ca488c8ca640"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.17.6/fclt-2.17.6-darwin-x64"
      sha256 "344d65bd600d032fc09c2c05030a3e2f51d72aa2604ac3116d7c79ea88487c74"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.17.6/fclt-2.17.6-linux-x64"
    sha256 "6ce44f1f452d5848da58bd12e237993085c4c2a599a787983f69e4746e26ce81"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
