FROM exherbo/exherbo-x86_64-pc-linux-gnu-base

ENV LANG=en_US.utf8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.utf8
ENV PALUDIS_DO_NOTHING_SANDBOXY=1

COPY paludis/net.conf /etc/paludis/repositories/net.conf
COPY paludis/x11.conf /etc/paludis/repositories/x11.conf
COPY paludis/rust.conf /etc/paludis/repositories/rust.conf

RUN chgrp paludisbuild /dev/tty && source /etc/profile && ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

RUN cave sync
RUN cave resolve --recommendations ignore --suggestions ignore -z -1 dev-lang/rust -x
