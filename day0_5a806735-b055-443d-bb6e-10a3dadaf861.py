#!/usr/bin/env python
import subprocess
import os

def main():
    print str(os.environ['HOME'])
    proc = subprocess.Popen("screen -d -m -S server iperf -s".split(), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out1, err1 = proc.communicate()
    return out1

main()
