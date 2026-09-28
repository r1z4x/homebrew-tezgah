class Tezgah < Formula
  desc "One shared working contract for every AI coding assistant you run"
  homepage "https://github.com/r1z4x/tezgah"
  url "https://github.com/r1z4x/tezgah/releases/download/v0.19.1/tezgah-0.19.1.tar.gz"
  sha256 "4b97859f6c4c31ea4bbb49d64c6b29b759996774bfe30ff44cefb48751180470"
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
