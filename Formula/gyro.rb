class Gyro < Formula
  desc "Open-source local-first coding agent workspace CLI"
  homepage "https://github.com/wytzeh197/Gyro"
  version "0.1.0-alpha.49.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wytzeh197/Gyro/releases/download/v#{version}/gyro-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "956fdf4d114b40b727877506583629cc32f9e134a330062246efaf68fcf27fb6"
    end

    on_intel do
      url "https://github.com/wytzeh197/Gyro/releases/download/v#{version}/gyro-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "a94242869e42629322ea0473ae28ac2c6e963b28c258cb5ec709a244e0938740"
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
