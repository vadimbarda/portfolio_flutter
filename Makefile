.PHONY: setup
setup: flutter packages assets strings

.PHONY: flutter
flutter:
	fvm install

.PHONY: packages
packages:
	fvm flutter pub get

.PHONY: assets
assets:
	fvm dart run build_runner build --delete-conflicting-outputs

.PHONY: strings
strings:
	fvm dart run intl_utils:generate

.PHONY: splash
splash:
	fvm dart run flutter_native_splash:create

.PHONY: analysis
analysis:
	fvm flutter analyze

.PHONY: clean
clean:
	fvm flutter clean
