# openracontainer
An OpenRA dedicated server running in a Docker Container. The goal of this project is to use the latest mono packages while lowering the overall image size. This image is about 300 MB smaller than current ones in Docker Hub. 

## Notes
* The time zone is set on the container in order to avoid issues updating the tzdata package during build.
* The official mono repository is used to avoid build issues with the latest release. It also addresses the missing "msbuild" package from Ubuntu repositories.  
* Ubuntu 20.04 used for compatibility with the mono repo.
* OpenRA.net Release 20210321.

## Docker Actions:
* docker build -t openracontainer .
* docker run -it -p 1234:1234 -e Name="My Test Server" -e Mod=ra -e EnableSingleplayer="True" --name openra openracontainer

## Other
https://github.com/OpenRA/OpenRA/wiki/Dedicated