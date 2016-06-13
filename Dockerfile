FROM ruby:2.3
MAINTAINER xiaoqin <xiaoqin@qiniu.com>

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN apt-get update && apt-get install -y nodejs \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app

COPY . /app/
RUN bundle install

CMD ["bundle", "exec", "middleman", "server", "--force-polling"]

EXPOSE 4567
