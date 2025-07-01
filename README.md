# openracontainer
An OpenRA dedicated server running in a container. The goal of this project is to use the latest packages while reducing vulnerabilities. 

## Notes
* Ubuntu:22.04 is used due to dotnet 6.0 dependencies.
* OpenRA.net release-20250330.

## Docker Actions:
* docker build -t openracontainer .
* docker run -it -p 1234:1234 -e Name="My Test Server" -e Mod=ra -e EnableSingleplayer="True" -e MOTD="Some sample message." --name openra openracontainer

## Other
https://github.com/OpenRA/OpenRA/wiki/Dedicated