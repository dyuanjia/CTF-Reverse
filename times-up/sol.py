#!/usr/bin/python
import subprocess
import sys


def run(cmd):
    proc = subprocess.Popen(cmd,
                            stdin=subprocess.PIPE,
                            stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE,
                            cwd=r'/problems/time-s-up_3_37ba6326d772bf884eab8f28e480e580'
                            )

    return proc


proc = run(['/problems/time-s-up_3_37ba6326d772bf884eab8f28e480e580/times-up'])

challenge = proc.stdout.readline()
print(challenge)
challenge = challenge.replace('(', '')
challenge = challenge.replace(')', '')
ops = challenge.split()[1:]
result = int(ops[0])
for i in range(2, len(ops), 2):
    if (ops[i-1] == '+'):
        result += int(ops[i])
    else:
        result -= int(ops[i])

print(result)
out, err = proc.communicate(str(result))  # send input
print(out)
