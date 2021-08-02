class Tfk8s < Formula
  desc "Converts Kubernetes YAML manifests to Terraform HCL"
  homepage "https://github.com/jrhouston/tfk8s"
  url "https://github.com/jrhouston/tfk8s/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "1a38e29645d2e27ffab50da6514a90e4d6e84b3b5261e1c2fd1b4054249b401f"
  license "MIT"

  bottle do
    root_url "https://github.com/Tenzer/homebrew-tap/releases/download/tfk8s-0.1.6"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "fbd6f345c91b44dcdf612fa37e41d467af432146b4323a4251380d0a7bba9220"
    sha256 cellar: :any_skip_relocation, catalina:      "3eebfe4bda90ff59fb1d8c83e4569eb22ac835e028e046cd2a1a2ebde3043265"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5ed25a3cc74b0f5c0d345eb022791bf6b87a0131c34c9ff0cb4a4bf61b104392"
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
