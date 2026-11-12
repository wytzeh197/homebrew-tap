class Gyro < Formula
  desc "Open-source local-first coding agent workspace CLI"
  homepage "https://github.com/wytzeh197/Gyro"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wytzeh197/Gyro/releases/download/v0.1.3/gyro-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1414885becc04777f634bb334f8559c36a45e9c51b34fcd33805cfecd242386e"
    end

    on_intel do
      url "https://github.com/wytzeh197/Gyro/releases/download/v0.1.3/gyro-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e955f2c3581d3fb350eb5f15e191e0b6f4f195905d849a4eccdaac793370dd76"
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
