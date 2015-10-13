require 'spec_helper'

describe Travis::Build::Script::Crystal, :sexp do
  let(:data)   { payload_for(:push, :crystal) }
  let(:script) { described_class.new(data) }
  subject      { script.sexp }

  it_behaves_like 'a build script sexp'

  it "announces `crystal --version`" do
    should include_sexp [:cmd, "crystal --version", echo: true]
  end

  it "announces `crystal deps --version`" do
    should include_sexp [:cmd, "crystal deps --version", echo: true]
  end

  it "runs tests by default" do
    should include_sexp [:cmd,
      "crystal spec",
      echo: true, timing: true]
  end

  context "versions" do
    it "installs latest released version by default" do
      should include_sexp [:cmd, "sudo apt-get install crystal"]
    end

    it "installs nightly when specified" do
      data[:config][:crystal] = 'nightly'
      should include_sexp [:cmd, "sudo apt-get install crystal-nightly"]
    end
  end
end
