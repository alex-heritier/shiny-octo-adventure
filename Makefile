.PHONY: models android ios clean

android: project
	flutter build appbundle -v --target-platform=android-arm64

ios: project
	flutter build ios --release -v

models:	
	flutter packages pub run build_runner build --delete-conflicting-outputs

clean:
	flutter clean
	rm -rf ios/Pods ios/.symlinks ios/Flutter/Flutter.framework
