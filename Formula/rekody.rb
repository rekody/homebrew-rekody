class Rekody < Formula
  desc "Open-source, privacy-first voice dictation for the terminal"
  homepage "https://github.com/rekody/rekody"
  version "0.5.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rekody/rekody/releases/download/v#{version}/rekody-#{version}-macos-aarch64.tar.gz"
      sha256 "db31050f9219567916a35251e18f1d9002207cd7a6a50623dfa911bef504ec6c"
    else
      url "https://github.com/rekody/rekody/releases/download/v#{version}/rekody-#{version}-macos-x86_64.tar.gz"
      sha256 "3ab24f0caad9b7c1d899f890d604d3491931d4753d7e314762d5d927b0b5d0d5"
    end
  end

  def install
    bin.install "rekody"
    # On-device Apple Foundation Models cleanup helper, present only in the
    # Apple Silicon tarball (macOS 26+). Optional — rekody works without it.
    bin.install "rekody-fm" if File.exist?("rekody-fm")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rekody --version")
  end
end