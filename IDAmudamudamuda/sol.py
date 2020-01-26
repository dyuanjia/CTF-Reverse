# values at 0x002D4058
# pre = " 0F 09 02 0C F8 FA 30 F0 22 22 FA 30 F0 22 22 FA 30 F0 22 22 35 ED E4 F6 FA E4 EC 35 E1 22 22 C6"
# print(pre.replace(" ", " \\x"))

check = b'\x0F \x09 \x02 \x0C \xF8 \xFA \x30 \xF0 \x22 \x22 \xFA \x30 \xF0 \x22 \x22 \xFA \x30 \xF0 \x22 \x22 \x35 \xED \xE4 \xF6 \xFA \xE4 \xEC \x35 \xE1 \x22 \x22 \xC6'
for i in check.split():
    tmp = int.from_bytes(i, "little") ^ 102
    tmp -= 35
    print(chr(tmp), end='')
