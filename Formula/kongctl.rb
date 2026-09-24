class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a0f42f21bab898ab61d034193d39910546ade50aaf7187b764aad0bf945f7fbb"
    sha256 cellar: :any_skip_relocation, sequoia:       "03c562c0d8eb611018ad35f7f90773f4375b4ef6210b7ad481f50f9778526edb"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "38f91c9b14cc612c92eb070fefca371925b036b5c620b95b7cca088fa9e14f41"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.17.1/kongctl_darwin_arm64.zip"
      sha256 "99ff648588f95e9035a183be9b1f65de887b0ee1f751bf1a1e366c04954eb2ad"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.17.1/kongctl_darwin_amd64.zip"
      sha256 "6f44cd1944526195af40ffed20393a6982098caa2265b76cc8438674ddc3401f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.17.1/kongctl_linux_arm64.zip"
      sha256 "02c67a6aa0428a4c9e27dc4317721b3ae9690695a918c2829b5a0a6ecc73e46c"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.17.1/kongctl_linux_amd64.zip"
      sha256 "67e3e33698d9056734db681dc7f0e78a2d00b48d22369e66c18329ce39f82b52"
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
