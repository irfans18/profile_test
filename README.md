# ngrok
clientid : ae8c6e2fabce362a2605
client secret : cba64f5a75593b751ae9adcdd0d59bf1fca8be48

docker run \
    --volume=drone-server-data:/data \
    --env=DRONE_GITHUB_CLIENT_ID=ae8c6e2fabce362a2605 \
    --env=DRONE_GITHUB_CLIENT_SECRET=cba64f5a75593b751ae9adcdd0d59bf1fca8be48 \
    --env=DRONE_RPC_SECRET=b014154316bfe1de52559ad3dd306386 \
    --env=DRONE_SERVER_HOST=3484-111-68-25-162.ngrok-free.app \
    --env=DRONE_SERVER_PROTO=https \
    --env=DRONE_USER_CREATE=username:irfans18,admin:true \
    --publish=9000:80 \
    --publish=9443:443 \
    --restart=always \
    --detach=true \
    --name=drone \
    drone/drone:2

docker run --detach \
--volume=/var/run/docker.sock:/var/run/docker.sock \
--env=DRONE_RPC_PROTO=https \
--env=DRONE_RPC_HOST=3484-111-68-25-162.ngrok-free.app \
--env=DRONE_RPC_SECRET=b014154316bfe1de52559ad3dd306386 \
--env=DRONE_RUNNER_CAPACITY=2 \
--env=DRONE_RUNNER_NAME=runner \
--publish=3000:3000 \
--restart=always \
--name=runner \
drone/drone-runner-docker:1

kind: pipeline
type: exec
name: default

platform:
  os: linux
  arch: amd64
  
steps:
- name: build-docker
  environment:
    PASSWORD:
      from_secret: docker_pass
  commands:
  - docker build -t localhost:5000/dotnet-test .
  - docker push localhost:5000/dotnet-test

  
# profile_test
 TES Front End

## Cara menjalankan program

1. Clone project
2. Buka project dengan VS Code.
3. Buka directory build > web > index.html.
lalu klik kanan > open with live server.
 ![alt text][num1]
4. Maka hasilnya
 ![alt text][num2]


[num1]: https://github.com/irfans18/profile_test/blob/main/tutorial.png "tutorial"
[num2]: https://github.com/irfans18/profile_test/blob/main/result.png "Hasil"
 

 
