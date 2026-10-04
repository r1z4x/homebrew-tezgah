class Tezgah < Formula
  desc "One shared working contract for every AI coding assistant you run"
  homepage "https://github.com/r1z4x/tezgah"
  url "https://github.com/r1z4x/tezgah/releases/download/v0.1.2/tezgah-0.1.2.tar.gz"
  sha256 "7a9646e530163c643b75bf73a7e6e76de0d06e80efc8dbb707e7f564e35389c3"
  license "MIT"
  depends_on "python@3.10"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/tezgah-setup"
    bin.install_symlink libexec/"bin/tezgah-setup" => "tezgah"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tezgah-setup --version")
  end
end
