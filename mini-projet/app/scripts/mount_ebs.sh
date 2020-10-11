#!/bin/bash

sudo mkfs -t xfs /dev/xvdb
sudo mkdir /media/additional
sudo mount  /dev/xvdb /media/additional