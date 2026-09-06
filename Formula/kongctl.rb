class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  version "1.15.0"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3e18596078db821cf0abf30ee7137e5342f303639a923cf128df645a19c8d1da"
    sha256 cellar: :any_skip_relocation, sequoia:       "09937ae65d2231741a927c27c8457345aab0148b72f5c53a98859b233c4b961a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "63b3a8ca14d79de6ed02f585c3661b22fb29f211be15db24bfcf59ab7ae1e94c"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.15.0/kongctl_darwin_arm64.zip"
      sha256 "84bee62d03a977c55312cb4a599a93cc80541ba58e3cc727e6333b55ee4f5e03"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.15.0/kongctl_darwin_amd64.zip"
      sha256 "59237d32de65550e9e6f54bcfbc20a5cd2812ca4328bc244cf741de1f91a8667"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.15.0/kongctl_linux_arm64.zip"
      sha256 "3d37f08d8ecb02b9128c2f3abb265781efb0a3685b6c20bf4d515547055c04bc"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.15.0/kongctl_linux_amd64.zip"
      sha256 "5fcc9c53ad8577b3f0dc2235b3c29c638381e308e5b23f47ca338c1872f8577c"
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
