# Dobby OS - Hit Worker

* Hit Worker
> 构建一个Hit Worker(打工人)开发环境, 目前由于公司开发环境统一更换为Macbook Pro M1芯片电脑，目前主流的生产集群还是主流的AMD64. 开发打包过程中会遇到跨平台交叉编译的需求。因此基于AMD64 Ubuntu 20.04基础镜像，安装Golang和Nodejs开发环境.


## How to

* 制作镜像

> $ docker build -t hitworker .

* 上传镜像到Docker Hub

> $ docker tag hitworker:latest user_name/hitworker:latest

> $ docker push user_name/hitworker:latest
