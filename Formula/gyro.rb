class Gyro < Formula
  desc "Open-source local-first coding agent workspace CLI"
  homepage "https://github.com/wytzeh197/Gyro"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wytzeh197/Gyro/releases/download/v0.1.4/gyro-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "43c4c5740c7ab7806835cde9613154ac5ad91d5270888462ddff8878148e6545"
    end

    on_intel do
      url "https://github.com/wytzeh197/Gyro/releases/download/v0.1.4/gyro-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e77ac94f009c93cbee80f61bb1fc2537449a1a003cf0eeec050c3e407c6bee8d"
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
