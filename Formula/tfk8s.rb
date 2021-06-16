class Tfk8s < Formula
  desc "Converts Kubernetes YAML manifests to Terraform HCL"
  homepage "https://github.com/jrhouston/tfk8s"
  url "https://github.com/jrhouston/tfk8s/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "d33e90dcd474a181aa7b401300a9772c09e0b63651fb01fdf897acba89310848"
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
