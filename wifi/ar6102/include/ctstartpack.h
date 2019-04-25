/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@file: ctstartpack.h

@abstract: start compiler-specific structure packing
 
@notice: Copyright (c), 2006 Atheros Communications, Inc.
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

#ifdef VXWORKS
#endif /* VXWORKS */

#ifdef LINUX
#endif /* LINUX */

#ifdef QNX
#endif /* QNX */

#ifdef INTEGRITY
#include "integrity/ctstartpack_integrity.h"
#endif /* INTEGRITY */

#ifdef NUCLEUS
#endif /* NUCLEUS */

#ifdef UNDER_CE
#include "wince/ctstartpack_wince.h"
#endif /* WINCE */

