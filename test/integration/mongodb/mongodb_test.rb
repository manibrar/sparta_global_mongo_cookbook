describe package "mongodb-org" do
  it { should be_installed }
  its('version') { should match /3\./ }
end
