#!/bin/sh

docker manifest create maxmib/typecho:latest maxmib/typecho:amd64 maxmib/typecho:arm64
docker manifest annotate maxmib/typecho:latest maxmib/typecho:amd64 --os linux --arch amd64
docker manifest annotate maxmib/typecho:latest maxmib/typecho:arm64 --os linux --arch arm64
docker manifest push maxmib/typecho:latest --purge
