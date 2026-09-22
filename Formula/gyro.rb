class Gyro < Formula
  desc "Open-source local-first coding agent workspace CLI"
  homepage "https://github.com/wytzeh197/Gyro"
  version "0.1.0-alpha.49.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wytzeh197/Gyro/releases/download/v#{version}/gyro-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0adf36670c50729fd436a36308edc9d8669e275f4f8bd08fed90324ef5a6af7b"
    end

    on_intel do
      url "https://github.com/wytzeh197/Gyro/releases/download/v#{version}/gyro-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "687faf63ae01978224db8d43d2f6f7fe7f8cc219c71afb297824807dce5b6faa"
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
