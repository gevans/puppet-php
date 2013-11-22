# Public: Configuration values for php
class php::params {
  case $::osfamily {
    'Darwin': {
      include boxen::config

      $phpenv_root = "${boxen::config::home}/phpenv"
      $logdir      = "${boxen::config::logdir}/php"
      $configdir   = "${boxen::config::configdir}/php"
      $datadir     = "${boxen::config::datadir}/php"
      $user        = $::boxen_user
    }

    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

  $phpenv_version = 'v0.4.0'

  $phpenv_plugins = {
    'php-build' => {
      'ensure' => '02e53a5484e2b84d1184dce40c9c05447ae0a934',
      'source' => 'CHH/php-build'
    }
  }

  $phpenv_pluginsdir = "${phpenv_root}/plugins"

  $cachedir          = "${datadir}/cache"
  $extensioncachedir = "${datadir}/cache/extensions"
}