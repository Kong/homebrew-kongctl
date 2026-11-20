class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "66a3ffce36bda2f38b5801b13a51dca25c3aa124ed6bb289351059eb87fe53f6"
    sha256 cellar: :any_skip_relocation, sequoia:       "9aa336e3341ba04f56fec135824e455f447c9637b2b1dd409da28504f3be24f2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4ffaa999e77f418a9da78dff2077dcf5ac64dc95c483a293f7b5b3a62b291af1"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.29.0/kongctl_darwin_arm64.zip"
      sha256 "76cade09eceb45b7e9c3d9a722707d5f01233179ed64894762d14fdf07b2ef8b"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.29.0/kongctl_darwin_amd64.zip"
      sha256 "03f8148f6814c23ec3dbd4956228c0945dff30bd7e655cd1e65583e92a8facd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.29.0/kongctl_linux_arm64.zip"
      sha256 "adc984f59d2b766f39492514c49737cd17dbad139682954f20535af5b49bb0d0"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.29.0/kongctl_linux_amd64.zip"
      sha256 "bcbd2b03ffbd8289cb1aa0b0c82113b6707e9475be5405873e2a4ac9a55b6010"
    end
  end

  def install
    bin.install "kongctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kongctl version --full")
    assert_match "__kongctl_debug", shell_output("#{bin}/kongctl completion bash")
    assert_match "#compdef kongctl", shell_output("#{bin}/kongctl completion zsh")
  end
end
