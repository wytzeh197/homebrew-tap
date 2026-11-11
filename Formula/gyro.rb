class Gyro < Formula
  desc "Open-source local-first coding agent workspace CLI"
  homepage "https://github.com/wytzeh197/Gyro"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wytzeh197/Gyro/releases/download/v0.1.2/gyro-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "09698db3e0e6ca3b497fc673dd27581af4f51f02e87c58430c5755b2b39a82e5"
    end

    on_intel do
      url "https://github.com/wytzeh197/Gyro/releases/download/v0.1.2/gyro-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "8cbf6e266abd7a585ffaf32c8a4be0f6f6e31f8bb8c40bf1bc8cc7c9ad415137"
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
