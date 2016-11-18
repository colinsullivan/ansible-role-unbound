require 'serverspec'

# Required by serverspec
set :backend, :exec

describe service('unbound') do  
  it { should be_enabled   }
  it { should be_running   }
end  

describe process("unbound") do

  its(:user) { should eq "unbound" }
#  its(:user) { should eq "root" }

  it "is listening on port 53" do
    expect(port(53)).to be_listening
  end

end

describe port(53) do
  it { should be_listening.on('127.0.0.1') }
end

describe command('unbound -h') do
  its(:stdout) { should match /usage:  unbound \[options\]/ }
  its(:stdout) { should match /OpenSSL/ }
## centos only
#  its(:stdout) { should match /ldns/ }
end
describe command('unbound-checkconf') do
  its(:stdout) { should match /no errors in/ }
end
