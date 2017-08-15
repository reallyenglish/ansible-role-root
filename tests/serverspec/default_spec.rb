require "spec_helper"
require "serverspec"

password_hash = {
  "freebsd" => "$6$PpED2zOZC14NLWz9$2RKmCl3mqlMcWTWiAScNcfEvKd9eDWLDzv1kAVb24eB4IvOXtdyFBBR.TTZzmklb87RZKvsPYLByFqMVVxhu81",
  "openbsd" => "$2b$10$dIiJRZhsAuX.1iV3.VXqx.zg9Ywpo6.WgHuMyPaqx9RmyJV1FFXw.",
  "ubuntu" => "$6$BY8YTOTd$LTlN7gVLa3KOVVhHjVYj.dzrjxZEPxd5OSbq0AuahD4Na8trGjXbskwH49qiIibA3gnrYHWSQ/jnhBZKPF/T..",
  "redhat" => "$6$EU/YQpV1$9tZvYw9Ifw2bnZUnKQAXeisZVWR10OV4ERPlojDUiUqzMFngi9SeSTX7NWoq.eXS1t/tUlqx6DvqyEdTU7Wpn1"
}
describe file("/root/.ssh") do
  it { should be_directory }
  it { should be_mode 700 }
  it { should be_owned_by "root" }
end

describe file("/root/.ssh/authorized_keys") do
  it { should be_file }
  it { should be_mode 600 }
  it { should be_owned_by "root" }
end

describe user("root") do
  it { should exist }
  it do
    should have_authorized_key "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"
  end
  its(:encrypted_password) do
    pending "OpenBSD fails because `getent passwd root` does not display password field" if os[:family] == "openbsd"
    should match(/^#{ Regexp.escape(password_hash[os[:family]]) }$/)
  end
end
