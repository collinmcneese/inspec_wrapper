# copyright: 2018, The Authors

title 'profile1'
control 'profile1_control_1' do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'Create /tmp directory'             # A human-readable title
  desc 'An optional description...'

  only_if { os.redhat? }

  describe file('/tmp') do                  # The actual test
    it { should be_directory }
  end
end

