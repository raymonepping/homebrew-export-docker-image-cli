class ExportDockerImageCli < Formula
  desc "Export, audit, and report your Docker Hub images with zero hassle"
  homepage "https://github.com/raymonepping/export-docker-image-cli"
  url "https://github.com/raymonepping/homebrew-export-docker-image-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PUT_THE_REAL_SHA256_HERE" # Replace with your tarball’s SHA256
  license "MIT"
  version "1.0.0"

  depends_on "bash"
  depends_on "jq"

  def install
    bin.install "bin/export_docker_image.sh" => "export_docker_image"
  end

  def caveats
    <<~EOS
      To get started, run:
        export_docker_image --help

      Config is read from:
        $HOME/.docker-config.env or ./.docker-config.env
      Sample:
        DOCKERHUB_REPO=your_dockerhub_username

      This CLI exports image metadata (name, tag, size, date) in JSON format.
      Full docs: https://github.com/raymonepping/export-docker-image-cli
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/export_docker_image --help")
  end
end
