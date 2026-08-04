class Gyro < Formula
  desc "Open-source local-first coding agent workspace CLI"
  homepage "https://github.com/wytzeh197/Gyro"
  version "0.1.0-alpha.34.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wytzeh197/Gyro/releases/download/v#{version}/gyro-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "eb446bb4eacb5789a77ee03d703015e1ac169f4c83fcdfd225423e0fc547f74e"
    end

    on_intel do
      url "https://github.com/wytzeh197/Gyro/releases/download/v#{version}/gyro-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d0b3f0fed0227a49d3fe54c7c01450258359f1ee1df4437e57a59e0fa7788430"
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
