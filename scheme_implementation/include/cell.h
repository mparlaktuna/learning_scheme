#pragma once

#include "types.h"

class Memory
{
  static cell Car[NNODES];
  static cell Cdr[NNODES];
  static byte Tag[NNODES];
  static cell Vectors[NVCELLS];
  
 public:

  cell car(size_t a)
  {
    return Car[a];
  }

  cell cdr(size_t a)
  {
    return Cdr[a];
  }

  cell tag(size_t a)
  {
    return Tag[a];
  }

};


