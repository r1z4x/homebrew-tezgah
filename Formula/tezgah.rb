class Tezgah < Formula
  desc "One shared working contract for every AI coding assistant you run"
  homepage "https://github.com/r1z4x/tezgah"
  # The repository is private, so this is the REST asset endpoint rather
  # than releases/download: that URL answers 404 to a session without a
  # token (measured 2026-10-17), while this one serves the blob for an
  # Accept plus a bearer. Homebrew exempts HOMEBREW_GITHUB_API_TOKEN from
  # the environment it clears before reading a formula, so the reference
  # below resolves at evaluation; brew redacts the value from what it logs.
  url "https://api.github.com/repos/r1z4x/tezgah/releases/assets/649012551",
      using: CurlDownloadStrategy,
      headers: [
        "Accept: application/octet-stream",
        "Authorization: Bearer #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}",
      ]
  version "1.9.2"
  sha256 "227b244f827c1be16313c43b0dfbb87bc060113d23111ca04f88c1836d0da679"
  license "MIT"
  depends_on "python@3.10"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/tezgah-setup"
    bin.install_symlink libexec/"bin/tezgah-setup" => "tezgah"
  end

  def caveats
    <<~EOS
      The tezgah repository is private, so the tarball this formula
      fetches needs a token with read access to it - a classic PAT or a
      fine-grained token with "Contents: read":

        export HOMEBREW_GITHUB_API_TOKEN=ghp_...

      Without one the download fails with: curl: (56) ... 401
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
