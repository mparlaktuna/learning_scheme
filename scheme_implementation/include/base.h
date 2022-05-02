#pragma once


#define NNODES		262144
#define NVCELLS		262144
#define NPORTS		20
#define TOKLEN		80
#define CHUNKSIZE	1024
#define MXMAX		2000
#define NTRACE		10
#define PRDEPTH		1024

#define ATOM_TAG	0x01	/* Atom, CAR = type, CDR = next */
#define MARK_TAG	0x02	/* Mark */
#define TRAV_TAG	0x04	/* Traversal */
#define VECTOR_TAG	0x08	/* Vector, CAR = type, CDR = content */
#define PORT_TAG	0x10	/* Atom is an I/O port (with ATOM_TAG) */
#define USED_TAG	0x20	/* Port: used flag */
#define LOCK_TAG	0x40	/* Port: locked (do not close) */
#define CONST_TAG	0x80	/* Node is immutable */

