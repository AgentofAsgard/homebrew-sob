class HomebrewSob < Formula
    desc "Single Binary"
    homepage "https://github.com/AgentofAsgard/sg"
    head "https://github.com/AgentofAsgard/sg.git"
    depends_on "go" => :build
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "docutils" => :build
    depends_on "pkg-config" => :build
    depends_on "sourcegraph/src-cli/src-cli" => :build
    depends_on "universal-ctags" => :build
    depends_on "seaweedfs" => :build

    def install
        ldflags = %W[
          -s -w
          -X github.com/AgentofAsgard/sg/internal/version.version=${VERSION-0.0.0+dev}
          -X github.com/AgentofAsgard/sg/internal/version.timestamp=$(date +%s)
          -X github.com/AgentofAsgard/sg/internal/conf/deploy.forceType=single-program
        ]
        system "ENTERPRISE=1", "DEV_WEB_BUILDER='esbuild yarn run build-web'", "go", "build", *std_go_args(output: bin/"sbtest", ldflags: ldflags), "./enterprise/cmd/sourcegraph"
      end

end
