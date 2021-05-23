class Go2fa < Formula
  desc "Two-factor authentication on the command-line"
  homepage "https://github.com/rsc/2fa"
  url "https://github.com/rsc/2fa/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "d8db6b9a714c9146a4b82fd65b54f9bdda3e58380bce393f45e1ef49e4e9bee5"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/Tenzer/homebrew-tap/releases/download/go2fa-1.2.0"
    sha256 cellar: :any_skip_relocation, catalina:     "01bed36e526f8ea7fa6e69ef865d6d492228b216d4c40d8fc93ed2a83ebfbb12"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "12b910b019ac6663a67361b9e9fdd9cbace5b69cc608d70adb251d01dfd4d281"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-mod=mod", "-o=#{bin/"2fa"}"
  end

  test do
    system bin/"2fa", "-list"
  end
end
