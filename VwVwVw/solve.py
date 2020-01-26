import binascii
import struct
import io


def byte(x):
    s = io.BytesIO()
    s.write(bytearray((x,)))
    return s.getvalue()


def xor_string(s1, s2):
    """
    Exclusive OR (XOR) @s1, @s2 byte by byte
    return the xor result with minimun length of s1,s2
    """
    if type(s1) != type(s2):
        raise TypeError('Input must be the same type, both str or bytes.')
    if type(s1) == type(s2) == bytes:
        return b''.join([byte(a ^ b) for a, b in zip(s1, s2)])
    return ''.join([chr(ord(a) ^ ord(b)) for a, b in zip(s1, s2)])


def and_string(s1, s2):
    """
    AND @s1, @s2 byte by byte
    return the AND result with minimun length of s1,s2
    """
    if type(s1) != type(s2):
        raise TypeError('Input must be the same type, both str or bytes.')
    if type(s1) == type(s2) == bytes:
        return b''.join([byte(a & b) for a, b in zip(s1, s2)])
    return ''.join([chr(ord(a) ^ ord(b)) for a, b in zip(s1, s2)])


def or_string(s1, s2):
    """
    OR @s1, @s2 byte by byte
    return the OR result with minimun length of s1,s2
    """
    if type(s1) != type(s2):
        raise TypeError('Input must be the same type, both str or bytes.')
    if type(s1) == type(s2) == bytes:
        return b''.join([byte(a | b) for a, b in zip(s1, s2)])
    return ''.join([chr(ord(a) ^ ord(b)) for a, b in zip(s1, s2)])


flag = b"0123456789ABCDEFGHIJKLMN"
path = b"/var/www/files/294ce70a3"
# little endian
final_check = b"\x69\x7a\x12\x2d\x34\x02\x28\x1a\x6a\x6e\x0e\x01\x25\x13\x05\x31\x6b\x57\x19\x21\x26\x11\x16\x32\x69\x6e\x2c\x26\x36\x3f\x30\x20"
mask = b"\x01\x00\x02\x01\x04\x03\x05\x04\x07\x06\x08\x07\x0a\x09\x0b\x0a" * 2

modified_flag = xor_string(flag, path)
concat = modified_flag[:16] + modified_flag[12:] + b"\x00\x4c\x53\x5f"
l = list(concat)
# shuffle
shuffled = [b"\x00"] * 32
for i, m in enumerate(list(mask)):
    if(i < 16):
        shuffled[i] = concat[m]
    else:
        shuffled[i] = concat[m+16]
shuffled = b''.join([byte(b) for b in shuffled])

broadcast_mask1 = b"\x00\xfc\xc0\x0f" * 8
and_result1 = and_string(shuffled, broadcast_mask1)

broadcast_mask2 = b"\x40\x00\x00\x04" * 8
# high 16 bit multiply
mulhuw_result = []
for i in range(0, 32, 2):
    # * broadcast_mask2[i:i+2]
    a = int.from_bytes(and_result1[i:i+2], "little")
    b = int.from_bytes(broadcast_mask2[i:i+2], "little")
    mulhuw_result.append((a*b) >> 16)
mulhuw_result = b''.join([b.to_bytes(2, "little") for b in mulhuw_result])

broadcast_mask3 = b"\xf0\x03\x3f\x00" * 8
and_result2 = and_string(shuffled, broadcast_mask3)

broadcast_mask4 = b"\x10\x00\x00\x01" * 8
# low 16 bit multiply
mullw_result = []
for i in range(0, 32, 2):
    # * broadcast_mask2[i:i+2]
    a = int.from_bytes(and_result2[i:i+2], "little")
    b = int.from_bytes(broadcast_mask4[i:i+2], "little")
    mullw_result.append((a*b) & 0xFFFF)
mullw_result = b''.join([b.to_bytes(2, "little") for b in mullw_result])

or_result = or_string(mulhuw_result, mullw_result)
print(list(or_result))

# entered a function
func_mask = b"\x1e" * 32
and_result3 = and_string(or_result, func_mask)
xor_result = xor_string(or_result, and_result3)

# shift right by 1
srlw_result1 = []
for i in range(0, 32, 2):
    a = int.from_bytes(and_result3[i:i+2], "little")
    srlw_result1.append(a >> 1)
srlw_result1 = b''.join([b.to_bytes(2, "little") for b in srlw_result1])

func_mask2 = (b"\x00"*10 + b"\x04"*3 + b"\x08"*2 + b"\x0c")*2
# shuffle
shuffled = [b"\x00"] * 32
for i, m in enumerate(list(srlw_result1)):
    if(i < 16):
        shuffled[i] = func_mask2[m]
    else:
        shuffled[i] = func_mask2[m+16]
shuffled = b''.join([byte(b) for b in shuffled])

# shift right by 4
srlw_result2 = []
for i in range(0, 32, 2):
    a = int.from_bytes(xor_result[i:i+2], "little")
    srlw_result2.append(a >> 4)
srlw_result2 = b''.join([b.to_bytes(2, "little") for b in srlw_result2])
or_result2 = or_string(srlw_result2, xor_result)
or_result3 = or_string(or_result2, shuffled)

func_mask3 = b"\x41\x41\x47\x47\x41\x41\xfc\xfc\x47\x47\xfc\xfc\x47\x47\xed\xf0" * 8
# shuffle
shuffled = [b"\x00"] * 32
for i, m in enumerate(list(or_result3)):
    if(i < 16):
        shuffled[i] = func_mask3[m]
    else:
        shuffled[i] = func_mask3[m+16]
shuffled = b''.join([byte(b) for b in shuffled])

# add shuffle result with or_result1
final_result = [(shuffled[i]+or_result[i]) % 256 for i in range(32)]
final_result = b''.join([b.to_bytes(1, "little") for b in final_result])
print(final_result)
print(list(final_result))

test_path32 = b"/var/www/files/294ce70a36bfe8ec1"
# xor with path again
xor_path = xor_string(final_result, test_path32)
print("Final result")
print(xor_path)
print(list(xor_path))
print(final_check)
print(list(final_check))
print(xor_path == final_check)

# Is this correct?
test_path32 = b"./verify./verify./verify./verify"
print(xor_string(test_path32, final_check))
