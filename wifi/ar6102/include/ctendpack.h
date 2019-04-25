/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@file: ctendpack.h

@abstract: end compiler-specific structure packing
 
@notice: Copyright (c), 2006 Atheros Communications, Inc.
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
#ifdef VXWORKS
#endif /* VXWORKS */

#ifdef LINUX
#endif /* LINUX */

#ifdef QNX
#endif /* QNX */

#ifdef INTEGRITY
#include "integrity/ctendpack_integrity.h"
#endif /* INTEGRITY */

#ifdef NUCLEUS
#endif /* NUCLEUS */

#ifdef UNDER_CE
#include "wince/ctendpack_wince.h"
#endif /* WINCE */

