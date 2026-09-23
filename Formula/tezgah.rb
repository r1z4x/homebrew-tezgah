class Tezgah < Formula
  desc "Armed harness contract for coding agents"
  homepage "https://github.com/r1z4x/tezgah"
  url "https://github.com/r1z4x/tezgah/releases/download/v0.17.0/tezgah-0.17.0.tar.gz"
  sha256 "28d20bda01190599a7a256fbde314cc4679cab5584ac29961ecf37ac7ba99f94"
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
