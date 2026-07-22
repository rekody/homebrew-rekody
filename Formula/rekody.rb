class Rekody < Formula
  desc "Open-source, privacy-first voice dictation for the terminal"
  homepage "https://github.com/rekody/rekody"
  version "0.5.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rekody/rekody/releases/download/v#{version}/rekody-#{version}-macos-aarch64.tar.gz"
      sha256 "96eec027fa32fbd18b9f86a89685ee916c9471a69fa9ba903c841b6b442c6e25"
    else
      url "https://github.com/rekody/rekody/releases/download/v#{version}/rekody-#{version}-macos-x86_64.tar.gz"
      sha256 "4ca1e34036368c30dbdc0684b8f9155699b9b2f9cb3f6671427731abc84e2687"
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