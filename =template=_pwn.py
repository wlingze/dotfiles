#! /usr/bin/env python
# pwm ===>>  %FILE% 
# Distributed under terms of the MIT license.

from pwn import * 

local = 1 
context.log_level = 'debug'

if local:
    cn = process('./%FILE%')
else:
    cn = remote( )

context.terminal = ['tmux', 'splitw', '-h']

elf = ELF('%FILE%')
libc = ELF(' ')

def gdb(mun):
    if local:
        gdb.attach(cn, 'b * '+str(mun))
        pause()
    else:
        pass

ru = lambda x : cn.recvuntil(x)
rl = lambda x : cn.recvline(x)
sd = lambda x : cn.send(x)
sl = lambda x : cn.sendline(x)
ia = lambda   : cn.interactive()

elf_addr  = lambda x : p32(elf.symbols[x])
libc_addr = lambda x : p32(libc.symbols[x])

%HERE%

success('get shell')
ia()
