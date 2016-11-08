**What are some of the key design philosophies of the Linux operating system?**
(Research from Wikipedia)
 - modular Unix-like operating system
   - Unix-like: term varies, uses open source software?!
 - Monolithic kernel/Linux kernel: handles process control, networking, access to peripherals, file systems
   - Entire OS is working in kernel space and is alone in supervisor mode
     - kernel space def: strictly reserved for running a privileged OS kernel, device drivers
     - supervisor mode def: in a monolithic kernel, OS runs in supervisor mode and apps run in user mode
   - define a high-level virtual interface over computer hardware
 - GNU userland: has C library and Unix tools
   - Userland or user space - all code that runs outside the OS kernel
   - i.e. applications
   - Have their own VM space, memory protecting, etc.

**In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?**

 - a virtual machine sold as a service by an internet hosting service
 - advantages:
   - can install any software that runs on that OS
   - functionally equivalent to a dedicated physical server
   - -more easily created and configued
   - lower priced
   - time sharing >> so cheaper?

**Optional bonus question: Why is it considered a bad idea to run programs as the root user on a Linux system?**
If you run a program in root and a security flaw is exploited, your entire OS could be comprised.