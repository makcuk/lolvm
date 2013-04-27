lolvm
=====

- Install Puppet >2.7
- Install Puppet modules: pdxcat-autofs ajjahn-puppet_samba puppetlabs-stdlib haraldsk-nfs rcoleman-netatalk
- Copy manifests to /etc/puppet
- Copy lolvm.yaml to your Hiera datasource dir (/var/lib/hiera by default)
- Enable YAML provider for Hiera
- Run `update-conf` to apply Puppet configuration


