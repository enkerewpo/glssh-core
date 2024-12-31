import gleam/option.{type Option}

/// SSH configuration
pub type SshConfig {
  SshConfig(
    hostname: String,
    port: Int,
    username: String,
    password: Option(String),
    private_key: Option(String),
  )
}

pub type SshSessionState {
  Disconnected
  Connected
}

/// SSH session
pub type SshSession {
  SshSession(config: SshConfig, state: SshSessionState)
}

// core functions
pub fn new_session(config: SshConfig) -> SshSession {
  SshSession(config, Disconnected)
}

pub fn connect(session: SshSession) -> SshSession {
  SshSession(session.config, Connected)
}

pub fn disconnect(session: SshSession) -> SshSession {
  SshSession(session.config, Disconnected)
}
