FROM rockylinux/rockylinux:9.5.20241118
ENV TZ=Asia/Tokyo

RUN dnf install -y \
    nginx \
    yum-utils createrepo \
    wget \
    && dnf clean all

COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /yum
RUN mkdir -p /var/run/nginx/
RUN chown -R nginx:nginx /yum /var/log/nginx /etc/nginx /var/run/nginx

USER nginx
WORKDIR /yum
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
