FROM wnameless/oracle-xe-11g
COPY init.sql /init.sql

ENV ORACLE_HOME /u01/app/oracle/product/11.2.0/xe
ENV PATH $ORACLE_HOME/bin:$PATH
ENV ORACLE_SID XE

CMD sed -i -E "s/HOST = [^)]+/HOST = $HOSTNAME/g" /u01/app/oracle/product/11.2.0/xe/network/admin/listener.ora; \
    service oracle-xe start; \
    /u01/app/oracle/product/11.2.0/xe/bin/sqlplus system/oracle < /init.sql; \
    /usr/sbin/sshd -D
