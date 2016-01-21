require 'spec_helper_acceptance'

describe 'hari class' do

  context 'basic hari class' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      class { 'hari':
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe file("/.hari") do
      it { should be_file }
      its(:content) { should match 'HARi was HERE' }
    end
  end

  context 'hari files' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      class { 'hari':
      }

      hari::file { '/.hari.file1': }

      hari::file { '/.hari.file2': }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe file("/.hari.file1") do
      it { should be_file }
      its(:content) { should match 'HARi was HERE' }
    end

    describe file("/.hari.file2") do
      it { should be_file }
      its(:content) { should match 'HARi was HERE' }
    end
  end

  context 'hari concats' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      class { 'hari':
      }

      hari::file { '/.hari.file1': }

      hari::file { '/.hari.file2': }

      hari::concatfile { 'hari3':
        file => '/.hari.file3',
      }

      hari::concatfile { 'hari4':
        file => '/.hari.file4',
      }

      hari::concatfile_fragment { 'base hari3':
        file => '/.hari.file3'
      }

      hari::concatfile_fragment { 'base hari4':
        file => '/.hari.file4',
      }

      hari::concatfile_fragment { 'extra hari 3':
        file => '/.hari.file3',
        content => 'someone else was HERE',
      }

      hari::concatfile_fragment { 'extra hari 4':
        file => '/.hari.file4',
        content => 'someone else that wasnt HERE',
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe file("/.hari.file3") do
      it { should be_file }
      its(:content) { should match 'HARi was HERE' }
      its(:content) { should match 'someone else was HERE' }
    end

    describe file("/.hari.file4") do
      it { should be_file }
      its(:content) { should match 'HARi was HERE' }
      its(:content) { should match 'someone else that wasnt HERE' }
    end
  end

end
