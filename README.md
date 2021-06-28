# eZ Platform Enterprise Edition

[![Latest release](https://img.shields.io/github/release/ezsystems/ezplatform-ee.svg?style=flat-square)](https://github.com/ezsystems/ezplatform-ee/releases)
[![License](https://img.shields.io/packagist/l/ezsystems/ezplatform-ee.svg?style=flat-square)](LICENSE)

## What is eZ Platform Enterprise Edition?
*eZ Platform Enterprise Edition* is commercial CMS (Content Management System) software developed by eZ Systems.

*eZ Platform Enterprise Edition* derives from *[eZ Platform](https://github.com/ezsystems/ezplatform)*.
It is composed of a set of bundles. eZ Platform Enterprise Edition, like eZ Platform, is built on top of the Symfony framework (Full Stack). It has been in development since 2014.

### How to get access to eZ Platform Enterprise Edition?

While this meta repository, `ezplatform-ee`, is public to ease installation and upgrades, the full access can be obtained in one of the following ways:

- Request an online demo on [ez.no](https://ez.no/Products/eZ-Platform-Enterprise-Edition).
- As a partner, download the trial version from [Partner Portal](http://ez.no/Partner-Portal).
- As a customer with the eZ Enterprise subscription, get full version from [Service Portal](https://support.ez.no/Downloads).
  Alternatively, you can set up [Composer Authentication Tokens](https://doc.ezplatform.com/en/latest/getting_started/install_ez_enterprise/#create-project) for use in combination with this repository.

### eZ Platform Enterprise Edition vs. eZ Platform
[eZ Platform Enterprise Edition](https://ez.no/Products/eZ-Platform-Enterprise-Edition) is a distribution flavor of [eZ Platform](http://ezplatform.com/), our Symfony-based enterprise level open source CMS.
In short, Enterprise comes with additional features and services that extend the eZ Platform functionality for media industry and team collaboration.


#### Further information:
eZ Platform is fully open source and is the foundation for the commercial *eZ Platform Enterprise Edition* software, which adds advanced features for editorial teams, fully built on top of *eZ Platform* APIs.

For more details, see:

- eZ Platform Developer Hub: [ezplatform.com](https://ezplatform.com/)
- [eZ Platform Open Source and Enterprise Edition roadmap](http://doc.ez.no/roadmap)
- eZ Systems (commercial products and services): [ez.no](https://ez.no/)

## Installation

**Note:** For simplified installation, consider using community-supported [eZ Launchpad](https://ezsystems.github.io/launchpad/) which takes care of the whole server setup for you.

Installation instructions below are for installing a clean installation of the latest version of eZ Platform Enterprise Edition _without_ demo content or demo website.

The latest full installation documentation is [in the online docs](https://doc.ezplatform.com/en/latest/getting_started/install_using_composer/)
It includes instructions for installing other distributions _(like [ezplatform "clean"](https://github.com/ezsystems/ezplatform) and [ezplatform-ee-demo](https://github.com/ezsystems/ezplatform-ee-demo) enterprise edition)_, or other versions.

#### Prerequisites

These instructions assume you have already installed:

- PHP _(7.1 or higher)_
- Web Server _(Recommeneded: Apache / Nginx. Use of PHP's built-in development server is also possible)_
- Database server _(MySQL 5.5+ or MariaDB 10.0+)_
- [Composer](https://doc.ezplatform.com/en/latest/getting_started/about_composer/)
- Git _(for development)_

For more details on requirements, see [online documentation](https://doc.ezplatform.com/en/latest/getting_started/requirements_and_system_configuration/).

#### Install eZ Platform _(clean enterprise distribution)_

Assuming you have prerequisites sorted out, you can get the install up and running with the following commands in your terminal:

``` bash
composer create-project --keep-vcs ezsystems/ezplatform-ee ezplatform ^2
cd ezplatform
```

**Note:** If composer is installed locally instead of globally, the first command will start with `php composer.phar`.

During the installation process you will be asked to provide database host name, login, password, etc.
The configuration details will be placed in `<ezplatform>/app/config/parameters.yml`.

Next, you will receive instructions on how to install data into the database, and how to run a simplified dev server using the `bin/console server:run` command.

**Tip:** For a more complete and better performing setup using Apache or Nginx, see how to [install eZ Platform manually](https://doc.ezplatform.com/en/latest/getting_started/install_manually/).

## Issue tracker
Submitting bugs, improvements and stories is possible on [https://jira.ez.no/browse/EZEE](https://jira.ez.no/browse/EZEE).
If you discover a security issue, please see how to responsibly report such issues in ["Reporting security issues in eZ Systems products"](https://doc.ezplatform.com/en/latest/guide/reporting_issues/#reporting-security-issues-in-ez-systems-products).

## Backwards compatibility
eZ Platform aims to be **fully content compatible** with eZ Publish 5.x, meaning that the content in these versions of the CMS can be upgraded using
[online documentation](https://doc.ezplatform.com/en/latest/migrating/migrating_from_ez_publish_platform/) to eZ Platform.

Unlike eZ Publish Platform 5.x, eZ Platform does not ship with eZ Publish Legacy (4.x). But this is available by optionally installing [LegacyBridge](https://github.com/ezsystems/LegacyBridge/releases/) (available in v1.13 or lower) to allow eZ Platform and eZ Publish Legacy to run together.
This is only recommended for migration use cases and not for new installations.

## COPYRIGHT
Copyright (C) 1999-2020 eZ Systems AS. All rights reserved.

## LICENSE
- http://ez.no/Products/About-our-Software/Licenses-and-agreements/eZ-Business-Use-License-Agreement-eZ-BUL-Version-2.1 eZ Business Use License Agreement eZ BUL Version 2.1
- https://ez.no/About-our-Software/Licenses-and-agreements/eZ-Trial-and-Test-License-Agreement-eZ-TTL-v2.0 eZ Trial and Test License Agreement (eZ TTL) v2.0
