class Kongctl < Formula
  desc "Developer CLI for Kong"
  homepage "https://github.com/Kong/kongctl"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/kong/kongctl"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3f7642faf86a278c73a020d3668e7a6861a3f88357584838708f7a858d6de017"
    sha256 cellar: :any_skip_relocation, sequoia:       "91985852034b05b82fc51cf7cb3c39718b813cdcd59ac554f83a56eff7ec2a78"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "fd0c5fe6b3b58612f97d15d95296c856b736578968cd9ca9950768558fa60e4d"
  end

  on_macos do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.20.1/kongctl_darwin_arm64.zip"
      sha256 "2c4eb85de31bac53cc5a042f8a6ea1a8eef808c563d5b0189b756c98384aee1f"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.20.1/kongctl_darwin_amd64.zip"
      sha256 "1cc43fa1264b83280955f706c0c7eb22a0e2ed56ab552f2e15bfe7d728a72df7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kong/kongctl/releases/download/v1.20.1/kongctl_linux_arm64.zip"
      sha256 "50cdc5d7317b45866cfcc3a13cabae71e613e9369d07cfe82e5d4c7e3db0dcf2"
    end
    on_intel do
      url "https://github.com/Kong/kongctl/releases/download/v1.20.1/kongctl_linux_amd64.zip"
      sha256 "b00d490b96453f515005489c7a3a656786ef3f2b0dc751e4509b1fdf01eac33c"
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
