# Simple example starter
FROM nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

# FROM ubuntu
# RUN apt-get update && apt-get install curl -y
# CMD ["sleep", "infinity"]