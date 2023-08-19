#include <stdio.h>
#include "hello.h"

void helloworld()
{
    printf("%s - %d, hello world\n", __func__, __LINE__);
}