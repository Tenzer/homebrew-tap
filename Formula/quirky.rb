class Quirky < Formula
  desc "QR code printer for your terminal"
  homepage "http://github.com/Tenzer/quirky"
  url "https://github.com/Tenzer/quirky/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "b70b7a98f36d874539dfdcbc8e0434293a1ee46779328945dbd6258ba8b92002"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system bin/"quirky", "--help"
  end
end
