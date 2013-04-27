lolvm
=====

- Install Puppet >2.7
- Install Puppet modules: pdxcat-autofs ajjahn-puppet_samba puppetlabs-stdlib haraldsk-nfs rcoleman-netatalk
- Copy manifests to /etc/puppet
- Copy lolvm.yaml to your Hiera datasource dir (/var/lib/hiera by default)
- Symlink /etc/hiera.yaml with /etc/puppet/hiera.yaml
- Edit /var/lib/hiera/lolvm.yaml and set your filesystem URI there
- Test `hiera lustre` command and see output
- Enable YAML provider for Hiera
- Run `update-conf` to apply Puppet configuration


