class HomebrewSob < Formula
    version "0.0.0"
    desc "Single Binary"
    homepage "https://github.com/AgentofAsgard/sg"
    url "https://github.com/AgentofAsgard/sg.git", :branch => "new-main"

    def install
        system "bash", "enterprise/cmd/sourcegraph/build.sh"
        system "mv", ".bin/sourcegraph-darwin-arm64-dist", "bin/sgapp"
    end
end
