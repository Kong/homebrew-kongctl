class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "668eea25db42caf8680133a7b5f40e8a161ce7358b377234a684daf89fdca92e"
    sha256 cellar: :any_skip_relocation, sequoia:       "030343e85feda508b7319c216177d05a28561606630c2ec2d3699d1d7e793298"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a88291156cde8fb568d61cdc4b67a998fb2a3f0f03c106c1aaf78651bf819c5c"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.23.0/kongctl_darwin_arm64.zip"
      sha256 "91252c557977c538b5ebfc136ae5e16a0fb5901b3428a48117bc51d565c37f69"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.23.0/kongctl_darwin_amd64.zip"
      sha256 "d02e55ed112372459bf01e91055357e81b8e025f546e4998b68e0dcb0f8ca7ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.23.0/kongctl_linux_arm64.zip"
      sha256 "1b7d2b66e9d8d29dcd96b88e68fa52857bf245ba837aae5aac8d153de41e3030"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.23.0/kongctl_linux_amd64.zip"
      sha256 "f1a5f1b93f7270a15ee4c9e7b97e9db848bc4818016ae020039385d2c583eedb"
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
