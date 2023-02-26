# openracontainer
An OpenRA dedicated server running in a container. The goal of this project is to use the latest packages while lowering the overall image size. 

## Notes
* Ubuntu 22.04 used with the dotnet-sdk-6.0
* OpenRA.net release-20230225.

## Docker Actions:
* docker build -t openracontainer .
* docker run -it -p 1234:1234 -e Name="My Test Server" -e Mod=ra -e EnableSingleplayer="True" -e MOTD="Some sample message." --name openra openracontainer

## Other
https://github.com/OpenRA/OpenRA/wiki/Dedicated