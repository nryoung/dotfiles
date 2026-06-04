{ ... }: {
  services.cross-seed = {
    enable = true;
    user = "nic";
    group = "media";
    settings = {
      dataDirs = [ "/media" ];
      linkDirs = [ "/cross-seeds" ];
      linkType = "hardlink";
      action = "inject";
      matchMode = "partial";
      skipRecheck = true;
      duplicateCategories = true;
      searchCadence = "1 day";
      excludeOlder = "2 weeks";
      excludeRecentSearch = "3 days";
    };
    settingsFile = "/home/nic/cross-seed-secrets.json";
  };
}
