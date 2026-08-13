#!/bin/bash

: <<'COMMENT'
Red='\e[31m'
Green='\e[32m'
Yellow='\e[33m'
Blue='\e[34m'

echo -e "${Red}This is red color${NC}"
echo -e "${Green}This is green color${NC}"
echo -e "${Yellow}This is yellow color${NC}"
echo -e "${Blue}This is blue color${NC}"
COMMENT

echo -e "\e[31m hello world"