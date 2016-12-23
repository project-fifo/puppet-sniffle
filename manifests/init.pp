class sniffle {
  class { sniffle::deps:    }
  class { sniffle::clone:   }
  class { sniffle::compile: }
  class { sniffle::link:    }
  class { sniffle::config:  }
  class { sniffle::svcs:    }

  }
