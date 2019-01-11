FROM centos

RUN yum install -y http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm && \
    yum install -y http://mirrors.aliyun.com/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm && \
    yum install -y yum-utils nginx supervisor git && \
    yum-config-manager --enable remi-php71 && \
    yum install -y php php-fpm php-phalcon3 php-gd php-mysqlnd && \
    yum clean all && \
    mkdir /run/php-fpm

COPY supervisord.conf /etc/supervisord.conf
COPY www.conf /etc/php-fpm.d/www.conf

CMD ["supervisord"]