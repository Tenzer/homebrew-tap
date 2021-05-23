class Explosion < Formula
  desc "Command-line image viewer with support for 24-bit output"
  homepage "https://github.com/Tenzer/explosion"
  url "https://github.com/Tenzer/explosion/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "ce8809a3d78b2bda5e9e3826712e9ddc98b57723e15baa7c965634be4e2178a1"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system bin/"explosion", "--help"
  end
end
