FROM centos

RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm && \
    rpm -Uvh http://mirrors.aliyun.com/epel/epel-release-latest-7.noarch.rpm && \
    rpm -Uvh https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm && \
    yum install -y nginx supervisor git && \
    yum clean all

COPY supervisord.conf /etc/supervisord.conf
COPY remi-php71.repo /etc/yum.repos.d/remi-php71.repo

RUN yum install -y php php-fpm php-phalcon3 php-gd php-mysqlnd && \
    yum clean all && \
    mkdir /run/php-fpm

COPY www.conf /etc/php-fpm.d/www.conf

CMD ["supervisord"]