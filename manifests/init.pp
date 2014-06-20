class stageit {

  case $::kernel {
    'windows': { include stageit::windows }
    default:   { include stageit::nix  }
  }

}
