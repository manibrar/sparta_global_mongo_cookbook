require 'spec_helper'

describe 'mongo::mongodb' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end
      it 'should update the source list' do
        expect( chef_run ).to update_apt_update 'update'
      end
      it 'should add mongodb to the source list' do
        expect(chef_run ).to add_apt_repository 'mongodb-org'
      end
      it 'should install and upgrade mongodb' do
        expect( chef_run ).to upgrade_package 'mongodb-org'
      end
      at_exit { ChefSpec::Coverage.report! }
  end
end
