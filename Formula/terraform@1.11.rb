class TerraformAT111 < Formula
  desc "Automate infrastructure on any cloud with Terraform"
  homepage "https://github.com/hashicorp/terraform"
  url "https://github.com/hashicorp/terraform.git",
    tag:      "v1.11.4",
    revision: "35645b8fca68ff7e0b8785a3b563724a529a0caf"
  license "BUSL-1.1"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    inreplace "go.mod", "godebug tlskyber=0", "godebug tlsmlkem=0"
    system "go", "build", *std_go_args, "-ldflags", "-s -w -X main.version=#{version}", "-o", bin/"terraform111", "."
  end

  test do
    system bin/"terraform111", "--help"
  end
end
