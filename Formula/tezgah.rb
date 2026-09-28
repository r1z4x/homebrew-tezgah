class Tezgah < Formula
  desc "One shared working contract for every AI coding assistant you run"
  homepage "https://github.com/r1z4x/tezgah"
  url "https://github.com/r1z4x/tezgah/releases/download/v0.21.0/tezgah-0.21.0.tar.gz"
  sha256 "7a2a9a422f39262bde8e8222de1f2a313688b111c1de5ff4cc6da8a33e45af9a"
  license "MIT"
  depends_on "python@3.10"

  def install
    bin.install "bin/tezgah-setup"
    libexec.install Dir["*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tezgah-setup --version")
  end
end
