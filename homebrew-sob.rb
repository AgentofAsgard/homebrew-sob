class HomebrewSob < Formula
    version "0.0.0"
    desc "Single Binary"
    homepage "https://github.com/AgentofAsgard/sg"
    url "https://github.com/AgentofAsgard/sg.git", :branch => "new-main"

    def install
        bin.install "enterprise/cmd/sourcegraph/build.sh"
    end
end
