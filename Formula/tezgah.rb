class Tezgah < Formula
  desc "One shared working contract for every AI coding assistant you run"
  homepage "https://github.com/r1z4x/tezgah"
  # The repository is private, so this is the REST asset endpoint rather
  # than releases/download: that URL answers 404 to a session without a
  # token (measured 2026-10-17), while this one serves the blob for an
  # Accept plus a bearer. Homebrew replaces the token reference with the
  # real value at download time, never while evaluating the formula.
  url "https://api.github.com/repos/r1z4x/tezgah/releases/assets/648701211",
      using: CurlDownloadStrategy,
      headers: [
        "Accept: application/octet-stream",
        "Authorization: Bearer #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}",
      ]
  version "1.9.0"
  sha256 "6622de05016e7a7fca69f28a2454c017b1a3ba0fb2219e453d553d7bb20caa83"
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
      fine-grained token with `Contents: read`:

        export HOMEBREW_GITHUB_API_TOKEN=ghp_...

      Without one the download fails with `curl: (56) ... 401`.
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
