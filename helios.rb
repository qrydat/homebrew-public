require "formula"

class Helios < Formula
  homepage "https://github.com/spotify/helios"
  url "https://oss.sonatype.org/service/local/repositories/releases/content/com/spotify/helios-tools/0.8.96/helios-tools-0.8.96-shaded.jar"
  sha1 "c7ede96a2bc82349e563453b67adcd048c2fe198"
  version "0.8.96"

  depends_on :java => "1.7"

  def install
    libexec.install "helios-tools-0.8.96-shaded.jar"
    bin.write_jar_script libexec/"helios-tools-0.8.96-shaded.jar", "helios", "-XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none"
  end

  test do
    system "#{bin}/helios", "--version"
  end
end
