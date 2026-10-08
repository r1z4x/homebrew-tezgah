class Tezgah < Formula
  desc "One shared working contract for every AI coding assistant you run"
  homepage "https://github.com/r1z4x/tezgah"
  url "https://github.com/r1z4x/tezgah/releases/download/v1.4.0/tezgah-1.4.0.tar.gz"
  sha256 "fc9d36e8bf6e2f587e4b642082317e493efa852b747abb08b3222dd3d1254645"
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
