class HomebrewSob < Formula
    version "0.0.0"
    desc "Single Binary"
    homepage "https://github.com/AgentofAsgard/sg"
    url "https://github.com/AgentofAsgard/sg.git", :branch => "new-main"

    def install
        ENV["ENTERPRISE"] = "1"
        ENV["DEV_WEB_BUILDER"] = "esbuild yarn run build-web"
        ldflags = %W[
          -X github.com/AgentofAsgard/sg/internal/conf/deploy.forceType=single-program
        ]
        system "go", "build", *std_go_args(output: bin/"sgapp", ldflags: ldflags), "#{Formula["homebrew-sob"].libexec}/enterprise/cmd/sourcegraph"
    end
end
