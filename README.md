---

#### This projet is currently in developpement ⚠️

please open a issue if you see any bug

---

# Grow 🌱

Grow is a plant store with a smart design inspirate by ['Food store app design on Dribbble'](https://dribbble.com/shots/10812162-Sweets-Mobile-App)


## Requirement

Grow work with a local rest api [GrowAPI](https://github.com/frnikho/GrowAPI) (GrowAPI required a MariaDB Database)
Grow is created with flutter so you need to install it to build this app for android or ios

## build

Android:
```
$ git clone https://github.com/frnikho/GrowAPI.git
$ cd growapp/
$ flutter build apk --split-per-abi
```
[read more](https://flutter.dev/docs/deployment/android)

IOS:

To build a ios app, you need to have a Mac and to be enroll into the [Apple Developper Program](https://developer.apple.com/programs/)


```
$ git clone https://github.com/frnikho/GrowAPI.git
$ cd growapp/
$ flutter build ios
```
[read more](https://flutter.dev/docs/deployment/ios)

## Dependencies
  
  | Library | Link |
| ------ | ----------- |
| cupertino_icons   | https://pub.dev/packages/cupertino_icons |
| font_awesome_flutter | https://pub.dev/packages/font_awesome_flutter |
| provider | https://pub.dev/packages/provider |
| outline_material_icons | https://pub.dev/packages/outline_material_icons |
| google_fonts | https://pub.dev/packages/google_fonts |
| shared_preferences | https://pub.dev/packages/shared_preferences |
| animations | https://pub.dev/packages/animations |
| url_launcher | https://pub.dev/packages/url_launcher |
