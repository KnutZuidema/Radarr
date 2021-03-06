; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define AppName "Radarr"
#define AppPublisher "Team Radarr"
#define AppURL "https://radarr.video/"
#define ForumsURL "https://github.com/Radarr/Radarr/issues"
#define AppExeName "Radarr.exe"
#define BuildNumber "2.0"
#define BuildVersion GetEnv('APPVEYOR_BUILD_VERSION')
#define BranchName StringChange(GetEnv('APPVEYOR_REPO_BRANCH'), "/", "-")

#if BuildVersion == ""

#define BuildVersion GetEnv('BUILD_VERSION') + GetEnv('$CIRCLE_BUILD_NUM')
#define BranchName StringChange(GetEnv('CIRCLE_BRANCH'), "/", "-")

#endif

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{56C1065D-3523-4025-B76D-6F73F67F7F82}
AppName={#AppName}
AppVersion=0.2
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#ForumsURL}
AppUpdatesURL={#AppURL}
DefaultDirName={commonappdata}\Radarr\bin
DisableDirPage=yes
DefaultGroupName={#AppName}
DisableProgramGroupPage=yes
OutputBaseFilename=Radarr.{#BranchName}.{#BuildVersion}.installer
SolidCompression=yes
AppCopyright=Creative Commons 3.0 License
AllowUNCPath=False
UninstallDisplayIcon={app}\Radarr.exe
DisableReadyPage=True
CompressionThreads=2
Compression=lzma2/normal
AppContact={#ForumsURL}
VersionInfoVersion={#BuildNumber}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
;Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "windowsService"; Description: "Install as a Windows Service"

[Files]
Source: "..\_output\Radarr.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\_output\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#AppName}"; Filename: "{app}\{#AppExeName}"; Parameters: "/icon"
Name: "{commondesktop}\{#AppName}"; Filename: "{app}\{#AppExeName}"; Parameters: "/icon"

[Run]
Filename: "{app}\radarr.console.exe"; Parameters: "/u"; Flags: waituntilterminated;
Filename: "{app}\radarr.console.exe"; Parameters: "/i"; Flags: waituntilterminated; Tasks: windowsService

[UninstallRun]
Filename: "{app}\radarr.console.exe"; Parameters: "/u"; Flags: waituntilterminated skipifdoesntexist
