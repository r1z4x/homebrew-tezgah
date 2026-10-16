class Tezgah < Formula
  desc "One shared working contract for every AI coding assistant you run"
  homepage "https://github.com/r1z4x/tezgah"
  # The release asset of a private repository: `releases/download` answers 404
  # without a session, so the formula goes through the REST asset endpoint and
  # carries the token as a header. Homebrew masks `HOMEBREW_GITHUB_API_TOKEN`
  # while the formula is evaluated and substitutes it only at download time.
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
      The tezgah repository is private, so the tarball this formula fetches
      needs a token. Export one with read access to the repository - a classic
      PAT or fine-grained token with `Contents: read`:

        export HOMEBREW_GITHUB_API_TOKEN=ghp_...

      Without it the download fails with `curl: (56) ... 401`.

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
