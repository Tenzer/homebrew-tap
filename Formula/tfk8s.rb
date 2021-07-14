class Tfk8s < Formula
  desc "Converts Kubernetes YAML manifests to Terraform HCL"
  homepage "https://github.com/jrhouston/tfk8s"
  url "https://github.com/jrhouston/tfk8s/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "60c71cb8b56208bc00aafec40711a880e43fb34dcb161e8a389f46d747a29df1"
  license "MIT"

  bottle do
    root_url "https://github.com/Tenzer/homebrew-tap/releases/download/tfk8s-0.1.5"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "eaa9d0510951082d14d0216228ead0488a83657d6c6f4bc0328937f7dde3d49a"
    sha256 cellar: :any_skip_relocation, catalina:      "7c13860c009760199fd8c8106a1c6099f574311e58efdddf12f877d33a6c653c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0a94e8dd972aad97f4c63818aa2c65209b2b44f110288e087426d51236c38217"
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
