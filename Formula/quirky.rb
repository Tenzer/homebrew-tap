class Quirky < Formula
  desc "QR code printer for your terminal"
  homepage "https://github.com/Tenzer/quirky"
  url "https://github.com/Tenzer/quirky/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "b70b7a98f36d874539dfdcbc8e0434293a1ee46779328945dbd6258ba8b92002"
  license "MIT"

  bottle do
    root_url "https://github.com/Tenzer/homebrew-tap/releases/download/quirky-1.0.2"
    sha256 cellar: :any_skip_relocation, catalina:     "f8d977e60646138fdbe5409d8d6994d137ac26c05935ac177eb4dc698fee5bfd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6b91df5d012ca39c3189489a5b1e90288204b15abad7023d68333c3c04345255"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system bin/"quirky", "--help"
  end
end
