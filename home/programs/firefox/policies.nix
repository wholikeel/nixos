{
  programs.firefox.policies = {
    "NetworkPrediction" = false;
    "CaptivePortal" = false;
    "DNSOverHTTPS" = {
      "Enabled" = false;
    };
    "DisabledFirefoxStudies" = true;
    "DisableTelemetry" = true;
    "DisablePocket" = true;
  };
}
