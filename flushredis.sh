#!/bin/bash
echo "查询redis的主节点"
# 连接到redis集群并查看集群节点  查找出所有和master相关的 选取第二列也就是ip:port列 以:为界分割字符串输出第二列也就是端口列

PORT=$(redis-cli -h 192.168.99.157 -p 6379 -c cluster nodes | grep master |awk '{print $2}'|awk -F '[:]' '{print $2}')
IP=$(redis-cli -h 192.168.99.157 -p 6379 -c cluster nodes | grep master |awk '{print $2}'|awk -F '[:]' '{print $1}')

PORT3=$(echo $PORT | awk '{print $1}')
PORT2=$(echo $PORT | awk '{print $2}')
PORT1=$(echo $PORT | awk '{print $3}')
IP1=$(echo $IP | awk '{print $1}')
IP2=$(echo $IP | awk '{print $2}')
IP3=$(echo $IP | awk '{print $3}')

redis-cli -h $IP1 -p $PORT1 -c flushdb
redis-cli -h $IP2 -p $PORT2 -c flushdb
redis-cli -h $IP3 -p $PORT3 -c flushdb
