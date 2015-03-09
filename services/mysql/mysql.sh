#!/bin/bash

USQL="zabbix"
PASSWORDSQL="zabbix"
MYSQLBIN="/usr/bin/mysql"

  case $1 in
      Uptime) ${MYSQLBIN} -u ${USQL} -p${PASSWORDSQL} -e "\s"| grep -i "uptime"| cut -d':' -f2| awk {'print $1,$2,$3,$4,$5,$6,$7,$8'} ;;
      ConnectionId) ${MYSQLBIN} -u ${USQL} -p${PASSWORDSQL} -e "\s"| grep -i "Connection id"| cut -d':' -f2| awk {'print $1'} ;;
      Connection) ${MYSQLBIN} -u ${USQL} -p${PASSWORDSQL} -e "\s"| grep -i "Connection"| grep -i "Unix"| cut -d':' -f2| awk {'print $1,$2,$3,$4,$5,$6,$8,$9,$10'} ;;
      ServerVersion) ${MYSQLBIN} -u ${USQL} -p${PASSWORDSQL} -e "\s"| grep -i "Server Version"| cut -d':' -f2| awk {'print $1'} ;;
      UnixSocket) ${MYSQLBIN} -u ${USQL} -p${PASSWORDSQL} -e "\s"| grep -i "Unix Socket"| nl | grep 2| cut -d':' -f2|awk {'print $1'} ;;
      SSL) ${MYSQLBIN} -u ${USQL} -p${PASSWORDSQL} -e "\s"| grep -i "SSL"| cut -d':' -f2|awk {'print $1,$2,$3,$4,$5'} ;;
      QtdDataBases) ${MYSQLBIN} -u ${USQL} -p${PASSWORDSQL} -e "SHOW DATABASES" | grep -v Database| wc -l ;;
      DataBaseNames) ${MYSQLBIN} -u ${USQL} -p${PASSWORDSQL} -e "SHOW DATABASES" | grep -v Database ;;
      *) echo "Parameter invalid!" ;;
  esac