# Puppet module to manage Kapacitor

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with kapacitor](#setup)
    * [What kapacitor affects](#what-kapacitor-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with kapacitor](#beginning-with-kapacitor)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

Installs, configures and manages the the [Kapacitor](https://github.com/influxdata/kapacitor),
which processes, monitores, and alerts on time series data.
## Setup

### What kapacitor affects

Default configuration

- manages GPG key, repository (use `$manage_repo` to deactivate when another influxdata module takes the lead)

- manages package

- manages user and group kapacitor

- manages directories and configuration files (referring to templates)

  * /etc/kapacitor/kapacitor.conf

  * /lib/systemd/system/kapacitor.service

  * /etc/default/kapacitor

- starts service "kapacitor" immediately

- service subscribes to "package", "configuration", "service" and "defaults"


### Setup Requirements

-   `puppetlabs/apt`
    version `>= 2.0.0 < 8.0.0`

-   `puppetlabs/concat`
    version `>= 5.0.0 < 7.0.0`

-   `puppetlabs/stdlib`
    version `>= 4.25.0 < 7.0.0`

-   `puppetlabs/translate`
    version `>= 1.0.0 < 3.0.0`

-   `puppet`
    version `>= 5.5.8 < 7.0.0`

For an extensive list of requirements, see `metadata.json`.

### Beginning with kapacitor

The module comes along with several configuration files, which you can find in
`templates`. Change configuration settings in according Hiera level or by using hashes.

- `kapacitor.conf.erb`
- `service-defaults.erb`
- `systemd.service.erb`

Please refer to [Kapacitor documentation](https://www.influxdata.com/time-series-platform/kapacitor/)
for the defaults used.

## Usage

### Configuration

Change basic configuration setting via the according variables.
For topics like "kubernetes", "smtp", etc. use Hiera or Hashes.

### In combination with other influxdata module

* when one of the other influxdata modules already handles GPG keys and repository

```
class { 'kapacitor':
  manage_repo => false,
}
```

* when kapacitor shall handle GPG keys and repository

```
class { 'kapacitor':
  manage_repo => true,
}
```

## Reference

Please see document `REFERENCE.md`.

## Limitations

 This module uses "Hiera".

For an extensive list of supported operating systems, see `metadata.json`.

## Development

-   pdk-version     1.17.0
-   template-url    pdk-default 1.17.0
-   template-ref    tags/1.17.0-0-g0bc522e

## Release Notes/Contributors/Etc.

-   module:     kogitoapp-kapacitor
-   version:    0.1.0
-   author:     Kogito UG <hello@kogito.network>
-   summary:    Module for configuring Kapacitor
-   license:    Apache-2.0
-   source:     https://github.com/kogitoapp/puppet-kapacitor
