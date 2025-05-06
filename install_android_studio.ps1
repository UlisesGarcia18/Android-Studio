# Instalar Winget si no está disponible (Windows 10)
# Este paso requiere intervención manual si no tienes Winget

# Descargar e instalar JDK (Adoptium)
Invoke-WebRequest -Uri "https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.11+9/OpenJDK17U-jdk_x64_windows_hotspot_17.0.11_9.msi" -OutFile "OpenJDK17.msi"
Start-Process msiexec.exe -Wait -ArgumentList '/i OpenJDK17.msi /quiet'

# Establecer JAVA_HOME
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-17.0.11.9-hotspot"
[System.Environment]::SetEnvironmentVariable("JAVA_HOME", $env:JAVA_HOME, [System.EnvironmentVariableTarget]::Machine)
$env:Path += ";$env:JAVA_HOME\bin"
[System.Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::Machine)

# Descargar Android Studio 2022.3.1.21
Invoke-WebRequest -Uri "https://redirector.gvt1.com/edgedl/android/studio/install/2022.3.1.21/android-studio-2022.3.1.21-windows.exe" -OutFile "android-studio.exe"

# Ejecutar instalador de Android Studio
Start-Process -FilePath ".\android-studio.exe" -Wait

# Instalar SDK, Build-Tools y Platform-tools con sdkmanager
# Esto se ejecuta desde la terminal de Android Studio, NO PowerShell
# cd C:\Users\TU_USUARIO\AppData\Local\Android\Sdk\cmdline-tools\latest\bin
# .\sdkmanager.bat "platform-tools" "platforms;android-34" "build-tools;34.0.0" "emulator"