local = 1 

from pwn import * 

context.log_level = 'debug'
context.terminal = ['tmux', 'splitw', '-h']

%HERE%
if local:
    cn = process('./')
else:
    cn = remote( )

elf = ELF('./')
context(os='linux', arch='')

def gdba(mun):
    if local:
        gdb.attach(cn, 'b * '+str(mun))
        pause()
    else:
        pass

re  = lambda m, t : cn.recv(numb=m, timeout=t)
ru  = lambda x    : cn.recvuntil(x)
rl  = lambda      : cn.recvline()
sd  = lambda x    : cn.send(x)
sl  = lambda x    : cn.sendline(x)
ia  = lambda      : cn.interactive()
sla = lambda a, b : cn.sendlineafter(a, b)
sa  = lambda a, b : cn.sendafter(a, b)
# after a, send b;



success('get shell')
sl('ls')
sl('cat flag')
ia()
