# EV planner

route/navigation planning for user who used EV car (Senior Project)

## Set Up

```bash
flutter create .
flutter doctor -v
flutter pub get
flutter pub run build_runner build
```

Get-Process | Where-Object { $_.Name -like "java*" } | Stop-Process -Force
Remove-Item -Recurse -Force $env:USERPROFILE\.gradle\caches
Remove-Item -Recurse -Force $env:USERPROFILE\.gradle\daemon  

./gradlew --no-daemon --info

./gradlew --stop
./gradlew signingReport  
./gradlew clean build

