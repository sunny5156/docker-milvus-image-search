From milvusdb/milvus:1.1.0-cpu-d050721-5e559c

COPY ./wait-for-mysql.sh /var/lib/milvus/wait-for-mysql.sh
RUN chmod a+x /var/lib/milvus/wait-for-mysql.sh
CMD ["/var/lib/milvus/wait-for-mysql.sh", "/var/lib/milvus/bin/milvus_server", "-c", "/var/lib/milvus/conf/server_config.yaml"]
