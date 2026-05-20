class Rekody < Formula
  desc "Open-source, privacy-first voice dictation for the terminal"
  homepage "https://github.com/rekody/rekody"
  version "0.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rekody/rekody/releases/download/v#{version}/rekody-#{version}-macos-aarch64.tar.gz"
      sha256 "266b778191b68fde35dbf4ec843c146690429df0d475aa8dca75b137b18b7d87"
    else
      url "https://github.com/rekody/rekody/releases/download/v#{version}/rekody-#{version}-macos-x86_64.tar.gz"
      sha256 "7e6caba340f94c041af9771415d514e4f94049bdfc9ce0090e16234d68b5e477"
    end
  end

  def install
    bin.install "rekody"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rekody --version")
  end
end