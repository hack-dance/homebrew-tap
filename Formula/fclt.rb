class Fclt < Formula
  desc "Build and evolve AI faculties across tools, users, and projects"
  homepage "https://github.com/hack-dance/fclt"
  version "2.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hack-dance/fclt/releases/download/v2.10.0/fclt-2.10.0-darwin-arm64"
      sha256 "2cc029944fbe28a18d26a8beac75c0797b5456332b29a1e685a97193be476fee"
    else
      url "https://github.com/hack-dance/fclt/releases/download/v2.10.0/fclt-2.10.0-darwin-x64"
      sha256 "e4fd7acbad4ba7d778791c530ff682865d70223d015c5c0cf859b424de49a47b"
    end
  end

  on_linux do
    url "https://github.com/hack-dance/fclt/releases/download/v2.10.0/fclt-2.10.0-linux-x64"
    sha256 "dcb04ea53570f6f9559b9cd73fcec5f9f7e937b19b7cd77a77fd041049274b81"
  end

  def install
    bin.install cached_download => "fclt"
    bin.install_symlink "fclt" => "facult"
  end

  test do
    assert_match "fclt", shell_output("#{bin}/fclt --help")
  end
end
