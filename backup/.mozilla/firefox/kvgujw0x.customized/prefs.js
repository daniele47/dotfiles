// custom tweaks
user_pref("ui.key.menuAccessKeyFocuses", false); // disable alt menu
user_pref("widget.use-xdg-desktop-portal.file-picker", 1); // use correct file picker

// ui tweaks
user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org"); // set dark theme
user_pref("browser.tabs.inTitlebar", 0); // use native title bar
user_pref("browser.translations.automaticallyPopup", false); // no popups for translation
user_pref("browser.tabs.hoverPreview.showThumbnails", false); // disable image preview on tab hover
user_pref("browser.toolbars.bookmarks.visibility", "never"); // never show bookmarks
user_pref("sidebar.revamp.defaultLauncherVisible", false); // disable horizontal tabs icon
user_pref("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"customizableui-special-spring1\",\"vertical-spacer\",\"urlbar-container\",\"customizableui-special-spring2\",\"downloads-button\",\"unified-extensions-button\",\"ublock0_raymondhill_net-browser-action\",\"addon_darkreader_org-browser-action\",\"sponsorblocker_ajay_app-browser-action\",\"plasma-browser-integration_kde_org-browser-action\",\"_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action\",\"vpn_proton_ch-browser-action\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"firefox-view-button\",\"tabbrowser-tabs\",\"new-tab-button\"],\"vertical-tabs\":[],\"PersonalToolbar\":[\"personal-bookmarks\"]},\"seen\":[\"save-to-pocket-button\",\"developer-button\",\"screenshot-button\",\"addon_darkreader_org-browser-action\",\"sponsorblocker_ajay_app-browser-action\",\"_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"vpn_proton_ch-browser-action\"],\"dirtyAreaCache\":[\"nav-bar\",\"vertical-tabs\",\"toolbar-menubar\",\"TabsToolbar\",\"PersonalToolbar\",\"unified-extensions-area\"],\"currentVersion\":23,\"newElementCount\":3}");
user_pref("extensions.webextensions.uuids", "{\"formautofill@mozilla.org\":\"6700d8c0-31f9-4f18-b110-e7a6be55dc57\",\"ipp-activator@mozilla.com\":\"40a5a2f5-7f1b-4f7b-b92c-d18008a532b5\",\"pictureinpicture@mozilla.org\":\"85921c4e-0dfe-46e7-966f-97011b412802\",\"addons-search-detection@mozilla.com\":\"0632d735-5e56-4421-9b45-e86ed2ba57cb\",\"webcompat@mozilla.org\":\"9a310967-e580-48bf-b3e8-4eafebbc122d\",\"addon@darkreader.org\":\"45494f8a-8099-415c-989f-346472077e69\",\"newtab@mozilla.org\":\"70bd630c-4fd6-45dd-aed6-beed6e179263\",\"sponsorBlocker@ajay.app\":\"efad74ba-7a43-4c19-9c9c-1e4edd789b5f\",\"uBlock0@raymondhill.net\":\"4c24f0c8-23cc-4a81-908b-3bbde9f94bc5\",\"{446900e4-71c2-419f-a6a7-df9c091e268b}\":\"884a75c8-3f19-4d8e-8b23-93190972bbd5\",\"firefox-compact-dark@mozilla.org\":\"a05abbca-af37-4e8c-b65d-a90846c8b17d\",\"vpn@proton.ch\":\"e3e710fc-8fd2-4b45-96c3-5fbec08ac8bf\",\"data-leak-blocker@mozilla.com\":\"c7f31f7c-2907-4066-959a-e4e994fa24fe\"}");

// disable first run page
user_pref("startup.homepage_welcome_url", ""); 
user_pref("startup.homepage_welcome_url.additional", ""); 
user_pref("datareporting.policy.firstRunURL", "");
user_pref("datareporting.policy.dataSubmissionPolicyAcceptedVersion", 2);
user_pref("datareporting.policy.dataSubmissionPolicyNotifiedTime", "9000000000000");
user_pref("browser.startup.homepage_override.mstone", "141.0");

// disable bloat on new tab pages
user_pref("browser.newtabpage.activity-stream.showSponsoredCheckboxes", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.startup.homepage", "about:home");

// passwords
user_pref("signon.rememberSignons", false);
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);

// safety / privacy
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("dom.security.https_only_mode", true); 
user_pref("dom.security.https_only_mode_ever_enabled", true);
user_pref("browser.contentblocking.category", "custom"); 
user_pref("privacy.fingerprintingProtection", true);
user_pref("privacy.globalprivacycontrol.was_ever_enabled", true);
user_pref("privacy.trackingprotection.emailtracking.enabled", true);
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.socialtracking.enabled", true);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.usage.uploadEnabled", false);
