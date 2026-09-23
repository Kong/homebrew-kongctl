class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c3c308897a37599e59e9c8513cc9f2c01b410b7ea922a88ed85a1b9daa9f8ad3"
    sha256 cellar: :any_skip_relocation, sequoia:       "dcd9b8504d30fbd12f050d99b0082157c169f830991fb0ee753de51979f71e7d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "919e05d8b861597b5b0233ed37eb28fd9fe453f77eca824b7d88236ab7953f6d"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.17.0/kongctl_darwin_arm64.zip"
      sha256 "5d59963d79d53bfb35e4c3717d1a00dc64a79e4c573b7265665edf5decabcc67"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.17.0/kongctl_darwin_amd64.zip"
      sha256 "ac6c00e61bdafed67c77559f353194b0fa486e0ede1b642c1d468a49c1b6c6fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.17.0/kongctl_linux_arm64.zip"
      sha256 "202aefcadfa2d23e1b711ed9fbe5b4dc1ddfc48afd5ca21b4f79aee224624dae"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.17.0/kongctl_linux_amd64.zip"
      sha256 "cd1fd02e014d42cf9a1db023de7e246c7b78ea8ffe3f67f1a2ccdadd8d893383"
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
