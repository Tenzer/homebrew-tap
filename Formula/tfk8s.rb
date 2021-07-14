class Tfk8s < Formula
  desc "Converts Kubernetes YAML manifests to Terraform HCL"
  homepage "https://github.com/jrhouston/tfk8s"
  url "https://github.com/jrhouston/tfk8s/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "60c71cb8b56208bc00aafec40711a880e43fb34dcb161e8a389f46d747a29df1"
  license "MIT"

  bottle do
    root_url "https://github.com/Tenzer/homebrew-tap/releases/download/tfk8s-0.1.4"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "c58a9c72f98f9bb38a6fe2624cc8d26da2249fc4eda3025c55424782d9a47faa"
    sha256 cellar: :any_skip_relocation, catalina:      "f91e4d78c2a65f7423a5997973871eec96a285c4b3264c03b9e10284785f6bfc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d0a5e0db99259ef1bdef858e5e053fc3a8af433d261bba0072bbe44b43c8636c"
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
