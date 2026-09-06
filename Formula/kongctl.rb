class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dfbebcd8356a32a801f47ee199c157ed3c6b4abb7cafcf8609aad4ca2626054f"
    sha256 cellar: :any_skip_relocation, sequoia:       "f8567943f0ad74fed1a216d6b8892e848ad7c316c34f60a51ca8cc3751522adc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5a9aad463c240ac002f86c5ba1e0ee3b71005a49f8892fdfa44e902b06b9638f"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.15.1/kongctl_darwin_arm64.zip"
      sha256 "1d3f6fd13b0c37820e29aeee98a9fd847bedc0495526d20007ce60e18409a83e"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.15.1/kongctl_darwin_amd64.zip"
      sha256 "cd45f3e5686f9104e4f77acdd891f2360556addf8896ca08875f468a5280bab4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.15.1/kongctl_linux_arm64.zip"
      sha256 "ac2bdfefa583f3d1ee37b8d57e0e4f9cabfb8199d9525dbb6c1ca127b320e619"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.15.1/kongctl_linux_amd64.zip"
      sha256 "c4cb1e2824fc6054cb3b0583a6b6ffa782fb832f64c742eb08a672959c186de5"
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
