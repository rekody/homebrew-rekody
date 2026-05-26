class Rekody < Formula
  desc "Open-source, privacy-first voice dictation for the terminal"
  homepage "https://github.com/rekody/rekody"
  version "0.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rekody/rekody/releases/download/v#{version}/rekody-#{version}-macos-aarch64.tar.gz"
      sha256 "e7aaf0c7d846b9219829318dbceb3ebcc6a3c49d91277538ffc904c7cd9d16fb"
    else
      url "https://github.com/rekody/rekody/releases/download/v#{version}/rekody-#{version}-macos-x86_64.tar.gz"
      sha256 "edf2a5e4e3352dea0e987baa57f1586d2cb973f7679dc2c115b85ec451813f26"
    end
  end

  def install
    bin.install "rekody"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rekody --version")
  end
end