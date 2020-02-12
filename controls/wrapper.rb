# Wrapper Inspec profile to load appropriate controls based upon OS
#  All controls referenced as an include MUST have a `depends` callout in root `inspec.yml`

# Load default controls which apply to any OS

# Load OS-specific controls
case os[:family]
when 'linux'
  include_controls 'linux_baseline'
when 'windows'
  case os[:release].to_f
  when 10
    include_controls 'windows_baseline'
  when 6.3, 6.2
    include_recipe 'windows_baseline'
  when 6.1
    include_recipe 'windows_baseline'
  end
else
  puts 'no match found!'
end
