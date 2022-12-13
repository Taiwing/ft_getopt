# ft\_getopt

Implementation of getopt in C. Handle arguments for unix programs. Is a weird
mix of the GNU and macos implementation. It handles everything pretty much like
the GNU version, except errors where it is close to the mac version. Except
that it lists possibilities when confronted with ambiguous long options. It
also handles the '-' and '+' flags in optstring like the GNU version.

One of the differences with the standard getopt implementation is that it is
reentrant and thread-safe by default, the only drawback being that it needs an
init function.

## Setup

```shell
# clone this repo
git clone https://github.com/Taiwing/ft_getopt.git
# build it
cd ft_getopt/ && make
```

## Usage

Compile the ft\_getopt library with this C program:

```C
#include <stdio.h>
#include "ft_getopt.h"

int	main(int argc, char **argv)
{
	int			opt;
	t_optdata	o = { 0 };
	
	init_getopt(&o, "Bic", NULL, NULL);

	while ((opt = ft_getopt(argc, argv, &o)) >= 0)
		switch (opt)
		{
			case 'B':	printf("B is the answer in hex: %02x\n", opt);	break;
			case 'i':	printf("i is nice in hex: %02x\n", opt);		break;
			case 'c':	printf("c is just c in hex: %02x\n", opt);		break;
			default:	printf("ERROR\n");	break;
		}

	return (0);
}
```

```shell
# compile this program
gcc -o test my_program.c -I includes/ libftgetopt.a
# and run it
./test -Bic
```

## Development

This project is a light-weight version of ft\_getopt without the full libft. The
libft functions needed for ft\_getopt are located in the src/libft C files with
"libft.h" as their header. There is an other version of ft\_getopt in libft,
that probably will be more up to date than this one. This one should be updated
with the libft version each time it is used.
