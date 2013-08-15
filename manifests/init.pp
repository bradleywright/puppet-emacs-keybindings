# Public: Use Emacs keybindings on OSX
#
# Requires applications to be restarted.
#
# This is based on http://lelf.lu/posts/emacs-keybindings-mac-os-x.html
#
# Examples
#
#   include emacs-keybindings

class emacs-keybindings {

  $home = "/Users/${::luser}"
  $keybindings_directory = "${home}/Library/KeyBindings"

  file { "${keybindings_directory}":
    ensure => directory
  }

  file { "${keybindings_directory}/DefaultKeyBinding.dict":
    source  => 'puppet:///modules/emacs-keybindings/EmacsKeyBindings.dict',
    require => File["${keybindings_directory}"]
  }
}
