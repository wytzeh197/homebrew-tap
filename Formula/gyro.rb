class Gyro < Formula
  desc "Open-source local-first coding agent workspace CLI"
  homepage "https://github.com/wytzeh197/Gyro"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wytzeh197/Gyro/releases/download/v0.1.1/gyro-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a7a978ea4f1ed4f42482e4834f936f2e0a48957225de013558c5965dc300dfc4"
    end

    on_intel do
      url "https://github.com/wytzeh197/Gyro/releases/download/v0.1.1/gyro-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e11a9fa99350fbc82e7a93c7065daaffe770013339a3172e65b110e424424e2d"
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
