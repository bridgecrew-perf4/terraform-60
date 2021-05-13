locals {
  files = ["ips.json", "report.csv", "sitemap.xml"]
  file_extensions = [for file in local.files : regex("\\.[0-9a-z]+$", file) ]
  file_extensions_upper = {for f in local.file_extensions : f => upper(f) if f != ".json"}

  ips = [
    {
      public: "1.1.1.0"
      private: "1.1.1.1"
    },
    {
      public: "2.2.2.0"
      private: "2.2.2.1"
    }
  ]
}