class Tezgah < Formula
  desc "One shared working contract for every AI coding assistant you run"
  homepage "https://github.com/r1z4x/tezgah"
  url "https://github.com/r1z4x/tezgah/releases/download/v1.5.0/tezgah-1.5.0.tar.gz"
  sha256 "6f73a45a08d164827192c07cd43dc555e610467acfb78bc69615419ebc66c2b7"
  license "MIT"
  depends_on "python@3.10"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/tezgah-setup"
    bin.install_symlink libexec/"bin/tezgah-setup" => "tezgah"
  end

  def caveats
    <<~EOS
      Upgrading from 0.1.2: its hooks name the old Cellar/tezgah/0.1.2
      keg, which brew's cleanup deletes. Re-arm once so they name
      opt/tezgah instead:
        tezgah update
      (it re-arms the hosts this install recorded), or
        tezgah-setup --install --hosts <the hosts you armed>
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tezgah-setup --version")
  end
end
