class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b4ce87bc02e975f3df96d4e5ce0a7a950868ddd7be8af1800c74a9adbd060c6d"
    sha256 cellar: :any_skip_relocation, sequoia:       "afc43a62cc956f2339f9985454e369f55c109cc32fcf067c9a1462cbc3420aa0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6b28e35018e70d3dc0c0f2b253d8f478f7df1a0c92c5674058520b7193c5e655"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.25.0/kongctl_darwin_arm64.zip"
      sha256 "888ed28d80265eb7e2ad010359724804ced97e1edea498dabf0da90a7c9bd8ed"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.25.0/kongctl_darwin_amd64.zip"
      sha256 "2a0e532b0116b809fffb9604aa0a0663136a9ce1c434a02442577bcafbfa71e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.25.0/kongctl_linux_arm64.zip"
      sha256 "0be266cc53560c47607f7fe377801ad7b534efc69f629eebbcec47f8a1992de6"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.25.0/kongctl_linux_amd64.zip"
      sha256 "ddbf3f5d7f457756efdcf57d6b2c86bdab3f1d62c58d0a00e4585743aca5128f"
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
