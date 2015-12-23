require 'spec_helper'

describe "ipaddress" do
  let(:node) { JSON.parse(IO.read(File.join(ENV["TEMP"] || "/tmp", "kitchen/chef_node.json"))) }

  it "should not be null" do
  	expect(node["automatic"]["ipaddress"]).not_to eq nil
  end

  it "should not be localhost" do
  	expect(node["automatic"]["ipaddress"]).not_to eq "127.0.0.1"
  end

  it 'should not be the default gateway interface' do
    ipaddress = node["automatic"]["network"]["interfaces"][
                            node["automatic"]["network"]["default_interface"]
                          ]["addresses"]
                          .select { |ip,params| params['family'] == 'inet' }.keys.first

    expect(node["automatic"]["ipaddress"]).not_to eq ipaddress
  end
end
