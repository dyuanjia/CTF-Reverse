import sys
import struct
from terrynini import *
if len(sys.argv) != 2:
    print('Usage: python3 H0W.py filename')
    exit(0)
# opens output.txt for writing
nini3()

f = open(sys.argv[1], 'rb').read()
if len(f) % 4 != 0:
    f += (4 - len(f) % 4) * b'\x00'

# init seed as current time
# srand(seed)
nini1()
nini4()

for i in range(0, len(f), 4):
    # take 4 bytes each iteration
    tmp = struct.unpack('<i', f[i:i + 4])[0]
    print(tmp)
    # apply a random operation on it
    tmp = nini5(tmp)
    print(tmp)
    # writes to output.txt
    nini6(tmp)

# print timestamp (seed) at the end
print(nini2())
for i in list(map(ord, nini2())):
    # writes to output.txt
    nini6(i)

print('Complete')
