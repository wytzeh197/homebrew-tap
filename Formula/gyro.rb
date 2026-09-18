class Gyro < Formula
  desc "Open-source local-first coding agent workspace CLI"
  homepage "https://github.com/wytzeh197/Gyro"
  version "0.1.0-alpha.48.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wytzeh197/Gyro/releases/download/v#{version}/gyro-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f584c8a909a14d1ab08e3e48ce888bead1ba05a74735e626fefff67a25b0325f"
    end

    on_intel do
      url "https://github.com/wytzeh197/Gyro/releases/download/v#{version}/gyro-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "44645cbb0d298383a34e61a32f1326949d3efb8cc66b40667f26563b1d9ebccc"
    end
  end

  def install
    bin.install "gyro"
    generate_completions_from_executable(bin/"gyro", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gyro --version")
    assert_match 'gyro.cli.v1', shell_output("#{bin}/gyro doctor --json")
  end
end
