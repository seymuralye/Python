provider "vcd" {
  user         = "your-vcd-username"
  password     = "your-vcd-password"
  org          = "your-org"
  url          = "https://vcd.example.com/api"
  vdc          = "your-vdc"
  allow_unverified_ssl = true
}
