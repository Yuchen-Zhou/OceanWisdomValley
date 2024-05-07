# 使用 Ubuntu 22.04 作为基础镜像
FROM ubuntu:22.04

# 更新软件包列表并安装必要的工具
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y curl wget \
    && rm -rf /var/lib/apt/lists/*

# 安装 Python 3.8
RUN  mkdir -p /miniconda3
RUN  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /miniconda3/miniconda.sh
RUN  bash /miniconda3/miniconda.sh -b -u -p /miniconda3
RUN  rm -rf /miniconda3/miniconda.sh

RUN /miniconda3/bin/conda init bash
RUN conda create -n ocean python=3.8

# 安装 Vue
RUN apt install nodejs
RUN nodejs --version
RUN apt install npm
RUN npm install -g @vue/cli && npm update -g @vue/cli


# 安装 Nginx
RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    nginx \
    && rm -rf /var/lib/apt/lists/*

# 安装 MySQL
RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    mysql-server \
    && rm -rf /var/lib/apt/lists/*

# 清理不必要的文件和缓存
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 将容器内 80 端口暴露出来
EXPOSE 80

# 设置默认工作目录
WORKDIR /app

# 默认启动命令
CMD ["bash"]
