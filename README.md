Copied from https://github.com/mkroli/karaf-docker
and adapted for Raspberry PI (archlinux)

docker build -t matteoredaelli/docker-docker-rpi .

docker run -d -t \
  --name karaf \
  -p 1099:1099 \
  -p 8101:8101 \
  -p 44444:44444 \
  -v /apps/karaf-share:/apps/karaf-share \
  --restart=on-failure:100 \
  matteoredaelli/docker-karaf-rpi
