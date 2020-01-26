import string

valid = string.printable[:62]

# 48-57, 65-90, 97-122
# inp = "0123456789ABCDEFGHIJ"
a = []
sums = [185, 212, 172, 145, 185, 212, 172, 177, 217, 212,
        204, 177, 185, 212, 204, 209, 161, 124, 172, 177]
print(sum(sums))

candidates = []
for s in sums:
    tmp = {}
    for i in valid:
        for j in valid:
            if(ord(i) + ord(j) == s):
                tmp[i] = j
    candidates.append(tmp)

print(candidates[0])
print()
for c in candidates[0].keys():
    key = candidates[0][c]
    result = [c, key]
    for i in range(1, 20):
        value = candidates[i].get(key, "")
        if(value == ""):
            break
        result.append(value)
        key = value

    if(len(result) == 21):
        if(result[0] == result[-1]):
            print("\nsuccess")
            print(result)
            for i in result:
                print(i, end='')


# solve a+b=185, b+c=212, c+d=172, d+e=145, e+f=185, f+g=212, g+h=172, h+i=177, i+j=217, j+k=212, k+l=204, l+m=177, m+n=185, n+o=212, o+p=204, p+q=209, q+r=161, r+s=124, s+t=172, t+a=177
