class Tfk8s < Formula
  desc "Converts Kubernetes YAML manifests to Terraform HCL"
  homepage "https://github.com/jrhouston/tfk8s"
  url "https://github.com/jrhouston/tfk8s/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "d33e90dcd474a181aa7b401300a9772c09e0b63651fb01fdf897acba89310848"
  license "MIT"

  bottle do
    root_url "https://github.com/Tenzer/homebrew-tap/releases/download/tfk8s-0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "8c4d71c3a5b6de861d1ac9f53a041822a17aa854783dc1a68344ecd1c9f56bb0"
    sha256 cellar: :any_skip_relocation, catalina:      "7f74f763151c7bcd6c498a608ebb71c71e96eb258976cfcaa56dc1b08bb6f768"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a1b652062d7c68a805d084d28456b9b292dfb634b38e2d68edf9de27d0d429c0"
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
