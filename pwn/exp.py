#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2020 wlz <wlz@kyria>
#
# Distributed under terms of the MIT license.

from pwn import *

pie  =
arch =
bps  = []

def exp():


context.os='linux'

context.log_level = 'debug'
context.terminal = ['tmux', 'splitw', '-h']

slog = {'name' : 111}
local = int(sys.argv[1])

if arch==64:
    context.arch='amd64'
if arch==32:
    context.arch='i386'

if local:
    cn = process('./bin')
else:
    cn = remote( )

elf = ELF('./bin')

def gdba():
    if local == 0:
        return 0;
    cmd ='set follow-fork-mode parent\n'
    #cmd=''
    if pie:
        base =int(os.popen("pmap {}|awk '{{print $1}}'".format(cn.pid)).readlines()[1],16)
        cmd +=''.join(['b *{:#x}\n'.format(b+base) for b in bps])
        cmd +='set $base={:#x}\n'.format(base)
        slog['base'] = base	
    else:
        cmd+=''.join(['b *{:#x}\n'.format(b) for b in bps])
    gdb.attach(cn,cmd)

re  = lambda m, t : cn.recv(numb=m, timeout=t)
recv= lambda      : cn.recv()
ru  = lambda x    : cn.recvuntil(x)
rl  = lambda      : cn.recvline()
sd  = lambda x    : cn.send(x)
sl  = lambda x    : cn.sendline(x)
ia  = lambda      : cn.interactive()
sla = lambda a, b : cn.sendlineafter(a, b)
sa  = lambda a, b : cn.sendafter(a, b)
# after a, send b;

def slog_show():
    for i in slog:
        success(i + ' ==> ' + hex(slog[i]))

exp()

slog_show()

ia()