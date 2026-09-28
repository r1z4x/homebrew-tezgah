class Tezgah < Formula
  desc "One shared working contract for every AI coding assistant you run"
  homepage "https://github.com/r1z4x/tezgah"
  url "https://github.com/r1z4x/tezgah/releases/download/v0.19.3/tezgah-0.19.3.tar.gz"
  sha256 "e5912efe01e93cc7b3dd247c4cd4fc2101c7ac1c1b01a15e4cd812c60fd0e6b0"
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
