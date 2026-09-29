class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e6c3f9908f276e7de8951bdda5531539dfec351b9999fcd16b6baa93571d6efb"
    sha256 cellar: :any_skip_relocation, sequoia:       "64d6ea3bfc244415926874f48dbbdd3c07808eca15b08583dc83b939b400c684"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "cf52cd61035448eb4434fb4da0c624d45bb728f9a54bb0b4e790f4c062065d14"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.19.0/kongctl_darwin_arm64.zip"
      sha256 "6d30eb879439efaabb4ba0d605856f3ed57847d1cbcc8bf1a2854899533c3fa3"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.19.0/kongctl_darwin_amd64.zip"
      sha256 "fc1c995e72f967b3cd947600f8038c7a5efb49fb1f953db9a3ea03ccab488ef7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.19.0/kongctl_linux_arm64.zip"
      sha256 "423ae498ada092974088a42cddcce8fc1f011efbf29a78a276854b49b3286789"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.19.0/kongctl_linux_amd64.zip"
      sha256 "b73df872dafc9f760005a4681f7976f5bb58d0b52c5ff0c52210b7780d340bb9"
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
