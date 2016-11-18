require 'serverspec'

# Required by serverspec
set :backend, :exec

describe command('dig +short crackhackforum.com') do
  its(:stdout) { should match /10\.0\.6\.66/ }
end
describe command('dig +short ogrean.com') do
  its(:stdout) { should match /10\.0\.6\.66/ }
end
describe command('host register.science') do
  its(:stdout) { should match /10\.0\.6\.66/ }
end

