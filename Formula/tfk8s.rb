class Tfk8s < Formula
  desc "Converts Kubernetes YAML manifests to Terraform HCL"
  homepage "https://github.com/jrhouston/tfk8s"
  url "https://github.com/jrhouston/tfk8s/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "0dfb441441ab270e745e31830918efab2e51d38e9535c3293d797bf90c944822"
  license "MIT"

  bottle do
    root_url "https://github.com/Tenzer/homebrew-tap/releases/download/tfk8s-0.1.3"
    sha256 cellar: :any_skip_relocation, catalina:     "7f74f763151c7bcd6c498a608ebb71c71e96eb258976cfcaa56dc1b08bb6f768"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a1b652062d7c68a805d084d28456b9b292dfb634b38e2d68edf9de27d0d429c0"
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
