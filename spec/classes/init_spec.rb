require 'spec_helper'
describe 'hari' do

  context 'with defaults for all parameters' do
    let :facts do
    {
            :osfamily => 'Debian',
            :operatingsystem => 'Ubuntu',
            :operatingsystemrelease => '14.0',
    }
    end

    it { should contain_class('hari') }
  end
end
