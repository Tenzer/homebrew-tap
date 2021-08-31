class Tfk8s < Formula
  desc "Converts Kubernetes YAML manifests to Terraform HCL"
  homepage "https://github.com/jrhouston/tfk8s"
  url "https://github.com/jrhouston/tfk8s/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "02607090e93ed081dc0f926db4ca08cded6b31243977726b8374d435e25beab9"
  license "MIT"

  bottle do
    root_url "https://github.com/Tenzer/homebrew-tap/releases/download/tfk8s-0.1.7"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "4de1b3bcaad739c887937a177355657657b2df7ece8ee887b3884461e0796925"
    sha256 cellar: :any_skip_relocation, catalina:      "02c4a0b9e11e6c816a18342c425a0e49e0c0d45f521cf75bb49129d24c047058"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f36cf7de4b7decaa6aa1b0f40ec7476dc178276fe23047a8eb4e27efc0812ca1"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.toolVersion=#{version}")
  end

  test do
    (testpath/"test.yaml").write <<~EOS
      ---
      apiVersion: v1
      kind: ConfigMap
      metadata:
        name: test
      data:
        TEST: test
    EOS

    system bin/"tfk8s", "--file=test.yaml"
  end
end
