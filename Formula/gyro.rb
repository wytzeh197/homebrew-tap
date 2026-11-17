class Gyro < Formula
  desc "Open-source local-first coding agent workspace CLI"
  homepage "https://github.com/wytzeh197/Gyro"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wytzeh197/Gyro/releases/download/v0.1.5/gyro-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9d0db8c831550ae49a49a05ded1eb89ebe8f45d403837c0882acb9e93e058241"
    end

    on_intel do
      url "https://github.com/wytzeh197/Gyro/releases/download/v0.1.5/gyro-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d726b262356314356e504a4d1a170cd3406c750af64c548278ed3c69ea966024"
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
