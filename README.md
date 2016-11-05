# ansible-role-root

Configures password and authorized keys of Unix root account.

# Requirements

None

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| root\_user | user name of root | root |
| root\_home | $HOME of root | /root |
| root\_password | dict of encrypted password of root | {} |
| root\_ssh\_authorized\_keys\_array | list of authorized\_key | [] |

## root\_password

`root_password` must have keys of `ansible_os_family`. Each key must have encrypted password.

```yaml
root_password:
  FreeBSD: '$6$PpED2zOZC14NLWz9$2RKmCl3mqlMcWTWiAScNcfEvKd9eDWLDzv1kAVb24eB4IvOXtdyFBBR.TTZzmklb87RZKvsPYLByFqMVVxhu81' # password
  OpenBSD: '$2b$10$dIiJRZhsAuX.1iV3.VXqx.zg9Ywpo6.WgHuMyPaqx9RmyJV1FFXw.' # Password
  Debian: '$6$BY8YTOTd$LTlN7gVLa3KOVVhHjVYj.dzrjxZEPxd5OSbq0AuahD4Na8trGjXbskwH49qiIibA3gnrYHWSQ/jnhBZKPF/T..' # password
  RedHat: '$6$EU/YQpV1$9tZvYw9Ifw2bnZUnKQAXeisZVWR10OV4ERPlojDUiUqzMFngi9SeSTX7NWoq.eXS1t/tUlqx6DvqyEdTU7Wpn1' # password

```

Created by [yaml2readme.rb](https://gist.github.com/trombik/b2df709657c08d845b1d3b3916e592d3)

# Dependencies

None

# Example Playbook

```yaml
- hosts: localhost
  roles:
    - ansible-role-root
  vars:
    root_password:
      FreeBSD: '$6$PpED2zOZC14NLWz9$2RKmCl3mqlMcWTWiAScNcfEvKd9eDWLDzv1kAVb24eB4IvOXtdyFBBR.TTZzmklb87RZKvsPYLByFqMVVxhu81' # password
      OpenBSD: '$2b$10$dIiJRZhsAuX.1iV3.VXqx.zg9Ywpo6.WgHuMyPaqx9RmyJV1FFXw.' # Password
      Debian: '$6$BY8YTOTd$LTlN7gVLa3KOVVhHjVYj.dzrjxZEPxd5OSbq0AuahD4Na8trGjXbskwH49qiIibA3gnrYHWSQ/jnhBZKPF/T..' # password
      RedHat: '$6$EU/YQpV1$9tZvYw9Ifw2bnZUnKQAXeisZVWR10OV4ERPlojDUiUqzMFngi9SeSTX7NWoq.eXS1t/tUlqx6DvqyEdTU7Wpn1' # password
    root_ssh_authorized_keys_array:
      - "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"
```

# License

Copyright (c) 2016 Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

# Author Information

Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

This README was created by [ansible-role-init](https://gist.github.com/trombik/d01e280f02c78618429e334d8e4995c0)
