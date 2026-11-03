# kongctl-app-auth-rehearsal: 41672047496
class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d66b28b80c7b8d53252701abab64acd00520f1b370cd4fd356fd491b481a9bd2"
    sha256 cellar: :any_skip_relocation, sequoia:       "24e91b97397f88d817188bc6384184bb28a20b02b94e426072c46cfd4ba5caea"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "fb201ed30b6e91b2fec2ee66708db3ee52ee8205475f4aae3d5747f9aaec090d"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.24.0/kongctl_darwin_arm64.zip"
      sha256 "ddacaa641097dd47f65414bcde75bfe65222242c3ef55baed3fbe35a14699cc4"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.24.0/kongctl_darwin_amd64.zip"
      sha256 "8926ea68d2d6ca48a58b1967eee78e1e086fb33cc827e78c80d82a80a643fbaf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.24.0/kongctl_linux_arm64.zip"
      sha256 "01cdfb7013b5e2dfef34aee304df428371a5abf79293a2f9da9288629be0a26c"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.24.0/kongctl_linux_amd64.zip"
      sha256 "02e599bfa0ac055ddce3a861a090c65b6c69c508ffe11dc96a9c288874c10411"
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
