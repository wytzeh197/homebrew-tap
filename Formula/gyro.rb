class Gyro < Formula
  desc "Open-source local-first coding agent workspace CLI"
  homepage "https://github.com/wytzeh197/Gyro"
  version "0.1.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wytzeh197/Gyro/releases/download/v0.1.6/gyro-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "340b7bf0b664ae258e4800e4f02cf5331a875fe6164e81f0326221caf7d55140"
    end

    on_intel do
      url "https://github.com/wytzeh197/Gyro/releases/download/v0.1.6/gyro-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c6040a5fe182d636f05b0f8fb15e18cc168af74a7a377200eac92e4bac8ddc9f"
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
