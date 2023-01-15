#/bin/sh

docker run --rm --privileged multiarch/qemu-user-static:register --reset

echo "begin build full version ..."
docker image rm -f docker.io/maxmib/typecho:amd64
#docker image rm -f registry.cn-shenzhen.aliyuncs.com/ttys0/docker-typecho-alpine-s6:amd64
docker image prune -f
docker build -f ./docker/Dockerfile -t maxmib/typecho:amd64 .
docker push maxmib/typecho:amd64
#docker tag maxmib/typecho:amd64 registry.cn-shenzhen.aliyuncs.com/ttys0/docker-typecho-alpine-s6:amd64
#docker push registry.cn-shenzhen.aliyuncs.com/ttys0/docker-typecho-alpine-s6:amd64

docker image rm -f maxmib/typecho:arm64
#docker image rm -f registry.cn-shenzhen.aliyuncs.com/ttys0/docker-typecho-alpine-s6:arm64
docker image prune -f
docker build -f ./docker/Dockerfile.arm64 -t maxmib/typecho:arm64 .
docker push maxmib/typecho:arm64
#docker tag maxmib/typecho:arm64 registry.cn-shenzhen.aliyuncs.com/ttys0/docker-typecho-alpine-s6:arm64
#docker push registry.cn-shenzhen.aliyuncs.com/ttys0/docker-typecho-alpine-s6:arm64
echo "end build full version ..."

./multi.sh
