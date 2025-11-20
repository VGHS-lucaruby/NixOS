{ self, config, pkgs, ... }:

{
	programs.firefox = {
		enable = true;
		policies = {
			AppAutoUpdate = false;
			BackgroundAppUpdate = false;
			DisableBuiltinPDFViewer = true;
			DisableFirefoxStudies = true;
			DisableFirefoxAccounts = true;
			DisableSetDesktopBackground = true;
			# DisplayMenuBar = "default-off";
			DisablePocket = true;
			DisableTelemetry = true;
			DisableFormHistory = true;
			DisablePasswordReveal = true;
			DontCheckDefaultBrowser = true;
			OfferToSaveLogins = false;
			EnableTrackingProtection = {
				Value = true;
				Locked = true;
				Cryptomining = true;
				Fingerprinting = true;
				EmailTracking = true;
			};
			EncryptedMediaExtensions = {
				Enabled = true;
				Locked = true;
			};
			ExtensionSettings = with builtins;
        let extension = shortId: uuid: {
          name = uuid;
          value = {
            install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
            installation_mode = "force_installed";
          };
        };
        in listToAttrs [
          (extension "ublock-origin" "uBlock0@raymondhill.net")
          (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
          (extension "behave" "{17c7f098-dbb8-4f15-ad39-8b578da80f7e}")
          (extension "sponsorblock" "sponsorBlocker@ajay.app")
          (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
					(extension "tampermonkey" "firefox@tampermonkey.net")
					(extension "keepa" "amptra@keepa.com")
        ];
			"3rdparty".Extensions = {
				# https://github.com/gorhill/uBlock/blob/master/platform/common/managed_storage.json
				"uBlock0@raymondhill.net".adminSettings = {
					userSettings = rec {
						uiTheme = "dark";
						uiAccentCustom = true;
						uiAccentCustom0 = "#FE8019";
						cloudStorageEnabled = false;
					};
					selectedFilterLists = [
						"ublock-filters"
    				"ublock-badware"
    				"ublock-privacy"
    				"ublock-quick-fixes"
    				"ublock-unbreak"
    				"easylist"
    				"adguard-generic"
    				"easyprivacy"
    				"adguard-spyware"
    				"adguard-spyware-url"
    				"block-lan"
    				"urlhaus-1"
    				"curben-phishing"
    				"plowe-0"
    				"dpollock-0"
    				"fanboy-cookiemonster"
    				"ublock-cookies-easylist"
    				"adguard-cookies"
    				"ublock-cookies-adguard"
    				"fanboy-social"
    				"adguard-social"
    				"fanboy-thirdparty_social"
    				"easylist-chat"
    				"easylist-newsletters"
    				"easylist-notifications"
    				"easylist-annoyances"
    				"adguard-mobile-app-banners"
    				"adguard-other-annoyances"
    				"adguard-popup-overlays"
    				"adguard-widgets"
    				"ublock-annoyances"
					];
				};
			};
			FirefoxHome = {
				Search = true;
				TopSites = false;
				SponsoredTopSites = false;
				Highlights = false;
				Pocket = false;
				SponsoredPocket = false;
				Snippets = false;
				Locked = true;
			};
			FirefoxSuggest = {
				WebSuggestions = false;
				SponsoredSuggestions = false;
				ImproveSuggest = false;
				Locked = true;
			};
			Handlers = {
				mimeTypes."application/pdf".action = "saveToDisk";
			};
			NoDefaultBookmarks = true;
			PasswordManagerEnabled = false;
			PDFjs = {
				Enabled = false;
				EnablePermissions = false;
			};
			PictureInPicture = {
				Enabled = true;
				Locked = true;
			};
			SanitizeOnShutdown = {
				Cache = true;
				Cookies = false;
				Downloads = true;
				FormData = true;
				History = false;
				Sessions = false;
				SiteSettings = false;
				OfflineApps = true;
				Locked = true;
			};
			SearchEngines = {
				PreventInstalls = true;
				Add = [
					{
						Name = "StartPage";
						URLTemplate = "https://www.startpage.com/do/search?q={searchTerms}";
						Method = "GET";
						Alias = "@StartPage";
						SuggestURLTemplate = "https://www.startpage.com/do/search?q={searchTerms}";
						IconURL = "https://www.startpage.com/favicon.ico";
					}
					{
						Name = "NixOS Package Search";
						URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
						Method = "GET";
						Alias = "@NP";
						IconURL = "https://nixos.org/favicon.ico";
					}
					{
						Name = "NixOS Package Options";
						URLTemplate = "https://search.nixos.org/options?query={searchTerms}";
						Method = "GET";
						Alias = "@NO";
						IconURL = "https://nixos.org/favicon.ico";
					}
					{
						Name = "My NixOS Search";
						URLTemplate = "https://mynixos.com/search?q={searchTerms}";
						Method = "GET";
						Alias = "@MNO";
						IconURL = "https://mynixos.com/favicon.ico";
					}
				];
				Remove = [
					"Amazon.com"
					"Bing"
					"Google"
          "eBay"
				];
				Default = "StartPage";
			};
			SearchSuggestEnabled = true;
			ShowHomeButton = true;
			SSLVersionMin = "tls1.2";
			# SupportMenu = {
			# 	Title = Support Menu;
			# 	URL = http =//example.com/support;
			# 	AccessKey = S
			# };
			StartDownloadsInTempDirectory = true;
			UserMessaging = {
				ExtensionRecommendations = false;
				FeatureRecommendations = false;
				Locked = true;
				MoreFromMozilla = false;
				SkipOnboarding = true;
				UrlbarInterventions = false;
				WhatsNew = false;
			};
			UseSystemPrintDialog = true;
		};
	};
}