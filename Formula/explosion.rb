class Explosion < Formula
  desc "Command-line image viewer with support for 24-bit output"
  homepage "https://github.com/Tenzer/explosion"
  url "https://github.com/Tenzer/explosion/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "ce8809a3d78b2bda5e9e3826712e9ddc98b57723e15baa7c965634be4e2178a1"
  license "MIT"

  bottle do
    root_url "https://github.com/Tenzer/homebrew-tap/releases/download/explosion-1.1.2"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "05343e8f2b98023a66038a962e13c919683195518ca640533fe3710168f90269"
    sha256 cellar: :any_skip_relocation, catalina:      "172ca40969bce62f88a6b6df73fbd354f7b8e869e6ed727b8dbf32bdf1e499dd"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b71ea7230d6b92392c70a194491338c9533379f3ad5391e177b1d68a0fec5f5b"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system bin/"explosion", "--help"
  end
end
