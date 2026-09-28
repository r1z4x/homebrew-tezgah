class Tezgah < Formula
  desc "One shared working contract for every AI coding assistant you run"
  homepage "https://github.com/r1z4x/tezgah"
  url "https://github.com/r1z4x/tezgah/releases/download/v0.20.0/tezgah-0.20.0.tar.gz"
  sha256 "c481f0604524f2b0b0141c5347f93259ee47babcd7051cd46e90b68b8ceac404"
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
