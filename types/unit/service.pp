# @summary Possible keys for the [Service] section of a unit file
# @see https://www.freedesktop.org/software/systemd/man/systemd.service.html
# @see https://www.freedesktop.org/software/systemd/man/systemd.exec.html
#
type Systemd::Unit::Service = Struct[
  {
    Optional['AmbientCapabilities']       => Variant[Pattern[/^CAP_[A-Z_]+$/],Array[Pattern[/^CAP_[A-Z_]+$/],1]],
    Optional['User']                      => String[1],
    Optional['Group']                     => String[1],
    Optional['WorkingDirectory']          => String[0],
    Optional['Type']                      => Enum['simple', 'exec', 'forking', 'oneshot', 'dbus', 'notify', 'idle'],
    Optional['ExitType']                  => Enum['main', 'cgroup'],
    Optional['RemainAfterExit']           => Boolean,
    Optional['GuessMainPID']              => Boolean,
    Optional['PIDFile']                   => Stdlib::Unixpath,
    Optional['BusName']                   => String[1],
    Optional['ExecStart']                 => Variant[Systemd::Unit::Service::Exec,Array[Systemd::Unit::Service::Exec,1]],
    Optional['ExecStartPre']              => Variant[Systemd::Unit::Service::Exec,Array[Systemd::Unit::Service::Exec,1]],
    Optional['ExecStartPost']             => Variant[Systemd::Unit::Service::Exec,Array[Systemd::Unit::Service::Exec,1]],
    Optional['ExecCondition']             => Variant[Systemd::Unit::Service::Exec,Array[Systemd::Unit::Service::Exec,1]],
    Optional['ExecReload']                => Variant[Systemd::Unit::Service::Exec,Array[Systemd::Unit::Service::Exec,1]],
    Optional['ExecStop']                  => Variant[Systemd::Unit::Service::Exec,Array[Systemd::Unit::Service::Exec,1]],
    Optional['ExecStopPost']              => Variant[Systemd::Unit::Service::Exec,Array[Systemd::Unit::Service::Exec,1]],
    Optional['KillSignal']                => Pattern[/^SIG[A-Z]+$/],
    Optional['KillMode']                  => Enum['control-group', 'mixed', 'process', 'none'],
    Optional['SyslogIdentifier']          => String,
    Optional['LimitCORE']                 => Pattern['^(infinity|((\d+(K|M|G|T|P|E)?(:\d+(K|M|G|T|P|E)?)?)))$'],
    Optional['RestartSec']                => String,
    Optional['TimeoutStartSec']           => String,
    Optional['TimeoutStopSec']            => String,
    Optional['TimeoutAbortSec']           => String,
    Optional['TimeoutAbortSec']           => String,
    Optional['TimeoutSec']                => String,
    Optional['TimeoutStartFailureMode']   => Enum['terminate', 'abort', 'kill'],
    Optional['TimeoutStopFailureMode']    => Enum['terminate', 'abort', 'kill'],
    Optional['RuntimeMaxSec']             => String,
    Optional['RuntimeRandomizedExtraSec'] => String,
    Optional['WatchdogSec']               => String,
    Optional['Restart']                   => Enum['no', 'on-success', 'on-failure', 'on-abnormal', 'on-watchdog', 'on-abort', 'always'],
    Optional['SuccessExitStatus']         => String,
    Optional['RestartPreventExitStatus']  => String,
    Optional['RestartForceExitStatus']    => String,
    Optional['RootDirectoryStartOnly']    => Boolean,
    Optional['NonBlocking']               => Boolean,
    Optional['NotifyAccess']              => Enum['none', 'default', 'main', 'exec',  'all'],
    Optional['OOMPolicy']                 => Enum['continue', 'stop','kill'],
    Optional['OOMScoreAdjust']            => Integer[-1000,1000],
    Optional['Environment']               => String,
    Optional['EnvironmentFile']           => Variant[
      Stdlib::Unixpath,Pattern[/-\/.+/],
      Array[Variant[Stdlib::Unixpath,Pattern[/-\/.+/]],1],
    ],
    Optional['StandardOutput']            => Variant[Enum['inherit','null','tty','journal','kmsg','journal+console','kmsg+console','socket'],Pattern[/\A(file:|append:|truncate:).+$\z/]],
    Optional['StandardError']             => Variant[Enum['inherit','null','tty','journal','kmsg','journal+console','kmsg+console','socket'],Pattern[/\A(file:|append:|truncate:).+$\z/]],
  }
]
