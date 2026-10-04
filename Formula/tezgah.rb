class Tezgah < Formula
  desc "One shared working contract for every AI coding assistant you run"
  homepage "https://github.com/r1z4x/tezgah"
  url "https://github.com/r1z4x/tezgah/releases/download/v0.1.1/tezgah-0.1.1.tar.gz"
  sha256 "f50a94c3da14bf19e4601d5e7e398934c5e482cbdbe02fc62e43d2915f616944"
  license "MIT"
  depends_on "python@3.10"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/tezgah-setup"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tezgah-setup --version")
  end
end
