class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e1aa7decd224a73747bdc85fcc019bd444e601874a9c81f107d03c0d453c24a7"
    sha256 cellar: :any_skip_relocation, sequoia:       "5f68270738def9e2fd5431e3fce48ad2ddc5dde1136ede4f13f479ee84b5eb3a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f6562946cde2ef43485920e6ab3762263b807b4aa8d4872a269c98cb569122fe"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.26.0/kongctl_darwin_arm64.zip"
      sha256 "558d43e412599c6414b89ec6afd4d6d6bc63370464772950b456e6bacd68881d"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.26.0/kongctl_darwin_amd64.zip"
      sha256 "1c4a42cf7169c4e79ce80ac9e627b57b19b290e19ccef31c1d98c47daf8ee249"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.26.0/kongctl_linux_arm64.zip"
      sha256 "e27f59ed7877344ea3fa51a74dbae6b89fe049b2c878dc1f7d30f69ae22dbf8a"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.26.0/kongctl_linux_amd64.zip"
      sha256 "855ab7fb1875eaac97f79f522d06d6d213ff592f4f1fb9ee2a44b9f7670ae350"
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
