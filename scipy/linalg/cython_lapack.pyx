"""
LAPACK functions for Cython
===========================

Usable from Cython via::

    cimport scipy.linalg.cython_lapack

This module provides Cython-level wrappers for all primary routines included
in LAPACK 3.1.0 and some of the fixed-api auxiliary routines.

The signature for dcgesv changed from LAPACK 3.1.1 to LAPACK 3.2.0.
The version here is the newer of the two since it matches the signature
from later versions of LAPACK and the version in the CLAPACK included in OSX.

Raw function pointers (Fortran-style pointer arguments):

- cbdsqr
- cgbbrd
- cgbcon
- cgbequ
- cgbrfs
- cgbsv
- cgbsvx
- cgbtf2
- cgbtrf
- cgbtrs
- cgebak
- cgebal
- cgebd2
- cgebrd
- cgecon
- cgeequ
- cgees
- cgeesx
- cgeev
- cgeevx
- cgegs
- cgegv
- cgehd2
- cgehrd
- cgelq2
- cgelqf
- cgels
- cgelsd
- cgelss
- cgelsx
- cgelsy
- cgeql2
- cgeqlf
- cgeqp3
- cgeqpf
- cgeqr2
- cgeqrf
- cgerfs
- cgerq2
- cgerqf
- cgesc2
- cgesdd
- cgesv
- cgesvd
- cgesvx
- cgetc2
- cgetf2
- cgetrf
- cgetri
- cgetrs
- cggbak
- cggbal
- cgges
- cggesx
- cggev
- cggevx
- cggglm
- cgghrd
- cgglse
- cggqrf
- cggrqf
- cggsvd
- cggsvp
- cgtcon
- cgtrfs
- cgtsv
- cgtsvx
- cgttrf
- cgttrs
- cgtts2
- chbev
- chbevd
- chbevx
- chbgst
- chbgv
- chbgvd
- chbgvx
- chbtrd
- checon
- cheev
- cheevd
- cheevr
- cheevx
- chegs2
- chegst
- chegv
- chegvd
- chegvx
- cherfs
- chesv
- chesvx
- chetd2
- chetf2
- chetrd
- chetrf
- chetri
- chetrs
- chgeqz
- chpcon
- chpev
- chpevd
- chpevx
- chpgst
- chpgv
- chpgvd
- chpgvx
- chprfs
- chpsv
- chpsvx
- chptrd
- chptrf
- chptri
- chptrs
- chsein
- chseqr
- clacn2
- clacon
- clangb
- clange
- clangt
- clanhb
- clanhe
- clanhp
- clanhs
- clanht
- clansb
- clansp
- clansy
- clantb
- clantp
- clantr
- clarf
- clarz
- claswp
- clauum
- cpbcon
- cpbequ
- cpbrfs
- cpbstf
- cpbsv
- cpbsvx
- cpbtf2
- cpbtrf
- cpbtrs
- cpocon
- cpoequ
- cporfs
- cposv
- cposvx
- cpotf2
- cpotrf
- cpotri
- cpotrs
- cppcon
- cppequ
- cpprfs
- cppsv
- cppsvx
- cpptrf
- cpptri
- cpptrs
- cptcon
- cpteqr
- cptrfs
- cptsv
- cptsvx
- cpttrf
- cpttrs
- cptts2
- crot
- cspcon
- cspmv
- cspr
- csprfs
- cspsv
- cspsvx
- csptrf
- csptri
- csptrs
- csrscl
- cstedc
- cstegr
- cstein
- cstemr
- csteqr
- csycon
- csymv
- csyr
- csyrfs
- csysv
- csysvx
- csytf2
- csytrf
- csytri
- csytrs
- ctbcon
- ctbrfs
- ctbtrs
- ctgevc
- ctgex2
- ctgexc
- ctgsen
- ctgsja
- ctgsna
- ctgsy2
- ctgsyl
- ctpcon
- ctprfs
- ctptri
- ctptrs
- ctrcon
- ctrevc
- ctrexc
- ctrrfs
- ctrsen
- ctrsna
- ctrsyl
- ctrti2
- ctrtri
- ctrtrs
- ctzrqf
- ctzrzf
- cung2l
- cung2r
- cungbr
- cunghr
- cungl2
- cunglq
- cungql
- cungqr
- cungr2
- cungrq
- cungtr
- cunm2l
- cunm2r
- cunmbr
- cunmhr
- cunml2
- cunmlq
- cunmql
- cunmqr
- cunmr2
- cunmr3
- cunmrq
- cunmrz
- cunmtr
- cupgtr
- cupmtr
- dbdsdc
- dbdsqr
- ddisna
- dgbbrd
- dgbcon
- dgbequ
- dgbrfs
- dgbsv
- dgbsvx
- dgbtf2
- dgbtrf
- dgbtrs
- dgebak
- dgebal
- dgebd2
- dgebrd
- dgecon
- dgeequ
- dgees
- dgeesx
- dgeev
- dgeevx
- dgegs
- dgegv
- dgehd2
- dgehrd
- dgelq2
- dgelqf
- dgels
- dgelsd
- dgelss
- dgelsx
- dgelsy
- dgeql2
- dgeqlf
- dgeqp3
- dgeqpf
- dgeqr2
- dgeqrf
- dgerfs
- dgerq2
- dgerqf
- dgesc2
- dgesdd
- dgesv
- dgesvd
- dgesvx
- dgetc2
- dgetf2
- dgetrf
- dgetri
- dgetrs
- dggbak
- dggbal
- dgges
- dggesx
- dggev
- dggevx
- dggglm
- dgghrd
- dgglse
- dggqrf
- dggrqf
- dggsvd
- dggsvp
- dgtcon
- dgtrfs
- dgtsv
- dgtsvx
- dgttrf
- dgttrs
- dgtts2
- dhgeqz
- dhsein
- dhseqr
- disnan
- dlacn2
- dlacon
- dlamch
- dlangb
- dlange
- dlangt
- dlanhs
- dlansb
- dlansp
- dlanst
- dlansy
- dlantb
- dlantp
- dlantr
- dlanv2
- dlarf
- dlarz
- dlaswp
- dlauum
- dopgtr
- dopmtr
- dorg2l
- dorg2r
- dorgbr
- dorghr
- dorgl2
- dorglq
- dorgql
- dorgqr
- dorgr2
- dorgrq
- dorgtr
- dorm2l
- dorm2r
- dormbr
- dormhr
- dorml2
- dormlq
- dormql
- dormqr
- dormr2
- dormr3
- dormrq
- dormrz
- dormtr
- dpbcon
- dpbequ
- dpbrfs
- dpbstf
- dpbsv
- dpbsvx
- dpbtf2
- dpbtrf
- dpbtrs
- dpocon
- dpoequ
- dporfs
- dposv
- dposvx
- dpotf2
- dpotrf
- dpotri
- dpotrs
- dppcon
- dppequ
- dpprfs
- dppsv
- dppsvx
- dpptrf
- dpptri
- dpptrs
- dptcon
- dpteqr
- dptrfs
- dptsv
- dptsvx
- dpttrf
- dpttrs
- dptts2
- drscl
- dsbev
- dsbevd
- dsbevx
- dsbgst
- dsbgv
- dsbgvd
- dsbgvx
- dsbtrd
- dsgesv
- dspcon
- dspev
- dspevd
- dspevx
- dspgst
- dspgv
- dspgvd
- dspgvx
- dsprfs
- dspsv
- dspsvx
- dsptrd
- dsptrf
- dsptri
- dsptrs
- dstebz
- dstedc
- dstegr
- dstein
- dstemr
- dsteqr
- dsterf
- dstev
- dstevd
- dstevr
- dstevx
- dsycon
- dsyev
- dsyevd
- dsyevr
- dsyevx
- dsygs2
- dsygst
- dsygv
- dsygvd
- dsygvx
- dsyrfs
- dsysv
- dsysvx
- dsytd2
- dsytf2
- dsytrd
- dsytrf
- dsytri
- dsytrs
- dtbcon
- dtbrfs
- dtbtrs
- dtgevc
- dtgex2
- dtgexc
- dtgsen
- dtgsja
- dtgsna
- dtgsy2
- dtgsyl
- dtpcon
- dtprfs
- dtptri
- dtptrs
- dtrcon
- dtrevc
- dtrexc
- dtrrfs
- dtrsen
- dtrsna
- dtrsyl
- dtrti2
- dtrtri
- dtrtrs
- dtzrqf
- dtzrzf
- dzsum1
- icmax1
- ieeeck
- ilaenv
- iparmq
- izmax1
- lsamen
- sbdsdc
- sbdsqr
- scsum1
- sdisna
- sgbbrd
- sgbcon
- sgbequ
- sgbrfs
- sgbsv
- sgbsvx
- sgbtf2
- sgbtrf
- sgbtrs
- sgebak
- sgebal
- sgebd2
- sgebrd
- sgecon
- sgeequ
- sgees
- sgeesx
- sgeev
- sgeevx
- sgegs
- sgegv
- sgehd2
- sgehrd
- sgelq2
- sgelqf
- sgels
- sgelsd
- sgelss
- sgelsx
- sgelsy
- sgeql2
- sgeqlf
- sgeqp3
- sgeqpf
- sgeqr2
- sgeqrf
- sgerfs
- sgerq2
- sgerqf
- sgesc2
- sgesdd
- sgesv
- sgesvd
- sgesvx
- sgetc2
- sgetf2
- sgetrf
- sgetri
- sgetrs
- sggbak
- sggbal
- sgges
- sggesx
- sggev
- sggevx
- sggglm
- sgghrd
- sgglse
- sggqrf
- sggrqf
- sggsvd
- sggsvp
- sgtcon
- sgtrfs
- sgtsv
- sgtsvx
- sgttrf
- sgttrs
- sgtts2
- shgeqz
- shsein
- shseqr
- slacn2
- slacon
- slamch
- slangb
- slange
- slangt
- slanhs
- slansb
- slansp
- slanst
- slansy
- slantb
- slantp
- slantr
- slanv2
- slarf
- slarz
- slaswp
- slauum
- sopgtr
- sopmtr
- sorg2l
- sorg2r
- sorgbr
- sorghr
- sorgl2
- sorglq
- sorgql
- sorgqr
- sorgr2
- sorgrq
- sorgtr
- sorm2l
- sorm2r
- sormbr
- sormhr
- sorml2
- sormlq
- sormql
- sormqr
- sormr2
- sormr3
- sormrq
- sormrz
- sormtr
- spbcon
- spbequ
- spbrfs
- spbstf
- spbsv
- spbsvx
- spbtf2
- spbtrf
- spbtrs
- spocon
- spoequ
- sporfs
- sposv
- sposvx
- spotf2
- spotrf
- spotri
- spotrs
- sppcon
- sppequ
- spprfs
- sppsv
- sppsvx
- spptrf
- spptri
- spptrs
- sptcon
- spteqr
- sptrfs
- sptsv
- sptsvx
- spttrf
- spttrs
- sptts2
- srscl
- ssbev
- ssbevd
- ssbevx
- ssbgst
- ssbgv
- ssbgvd
- ssbgvx
- ssbtrd
- sspcon
- sspev
- sspevd
- sspevx
- sspgst
- sspgv
- sspgvd
- sspgvx
- ssprfs
- sspsv
- sspsvx
- ssptrd
- ssptrf
- ssptri
- ssptrs
- sstebz
- sstedc
- sstegr
- sstein
- sstemr
- ssteqr
- ssterf
- sstev
- sstevd
- sstevr
- sstevx
- ssycon
- ssyev
- ssyevd
- ssyevr
- ssyevx
- ssygs2
- ssygst
- ssygv
- ssygvd
- ssygvx
- ssyrfs
- ssysv
- ssysvx
- ssytd2
- ssytf2
- ssytrd
- ssytrf
- ssytri
- ssytrs
- stbcon
- stbrfs
- stbtrs
- stgevc
- stgex2
- stgexc
- stgsen
- stgsja
- stgsna
- stgsy2
- stgsyl
- stpcon
- stprfs
- stptri
- stptrs
- strcon
- strevc
- strexc
- strrfs
- strsen
- strsna
- strsyl
- strti2
- strtri
- strtrs
- stzrqf
- stzrzf
- xerbla
- zbdsqr
- zcgesv
- zdrscl
- zgbbrd
- zgbcon
- zgbequ
- zgbrfs
- zgbsv
- zgbsvx
- zgbtf2
- zgbtrf
- zgbtrs
- zgebak
- zgebal
- zgebd2
- zgebrd
- zgecon
- zgeequ
- zgees
- zgeesx
- zgeev
- zgeevx
- zgegs
- zgegv
- zgehd2
- zgehrd
- zgelq2
- zgelqf
- zgels
- zgelsd
- zgelss
- zgelsx
- zgelsy
- zgeql2
- zgeqlf
- zgeqp3
- zgeqpf
- zgeqr2
- zgeqrf
- zgerfs
- zgerq2
- zgerqf
- zgesc2
- zgesdd
- zgesv
- zgesvd
- zgesvx
- zgetc2
- zgetf2
- zgetrf
- zgetri
- zgetrs
- zggbak
- zggbal
- zgges
- zggesx
- zggev
- zggevx
- zggglm
- zgghrd
- zgglse
- zggqrf
- zggrqf
- zggsvd
- zggsvp
- zgtcon
- zgtrfs
- zgtsv
- zgtsvx
- zgttrf
- zgttrs
- zgtts2
- zhbev
- zhbevd
- zhbevx
- zhbgst
- zhbgv
- zhbgvd
- zhbgvx
- zhbtrd
- zhecon
- zheev
- zheevd
- zheevr
- zheevx
- zhegs2
- zhegst
- zhegv
- zhegvd
- zhegvx
- zherfs
- zhesv
- zhesvx
- zhetd2
- zhetf2
- zhetrd
- zhetrf
- zhetri
- zhetrs
- zhgeqz
- zhpcon
- zhpev
- zhpevd
- zhpevx
- zhpgst
- zhpgv
- zhpgvd
- zhpgvx
- zhprfs
- zhpsv
- zhpsvx
- zhptrd
- zhptrf
- zhptri
- zhptrs
- zhsein
- zhseqr
- zlacn2
- zlacon
- zlangb
- zlange
- zlangt
- zlanhb
- zlanhe
- zlanhp
- zlanhs
- zlanht
- zlansb
- zlansp
- zlansy
- zlantb
- zlantp
- zlantr
- zlarf
- zlarz
- zlaswp
- zlauum
- zpbcon
- zpbequ
- zpbrfs
- zpbstf
- zpbsv
- zpbsvx
- zpbtf2
- zpbtrf
- zpbtrs
- zpocon
- zpoequ
- zporfs
- zposv
- zposvx
- zpotf2
- zpotrf
- zpotri
- zpotrs
- zppcon
- zppequ
- zpprfs
- zppsv
- zppsvx
- zpptrf
- zpptri
- zpptrs
- zptcon
- zpteqr
- zptrfs
- zptsv
- zptsvx
- zpttrf
- zpttrs
- zptts2
- zrot
- zspcon
- zspmv
- zspr
- zsprfs
- zspsv
- zspsvx
- zsptrf
- zsptri
- zsptrs
- zstedc
- zstegr
- zstein
- zstemr
- zsteqr
- zsycon
- zsymv
- zsyr
- zsyrfs
- zsysv
- zsysvx
- zsytf2
- zsytrf
- zsytri
- zsytrs
- ztbcon
- ztbrfs
- ztbtrs
- ztgevc
- ztgex2
- ztgexc
- ztgsen
- ztgsja
- ztgsna
- ztgsy2
- ztgsyl
- ztpcon
- ztprfs
- ztptri
- ztptrs
- ztrcon
- ztrevc
- ztrexc
- ztrrfs
- ztrsen
- ztrsna
- ztrsyl
- ztrti2
- ztrtri
- ztrtrs
- ztzrqf
- ztzrzf
- zung2l
- zung2r
- zungbr
- zunghr
- zungl2
- zunglq
- zungql
- zungqr
- zungr2
- zungrq
- zungtr
- zunm2l
- zunm2r
- zunmbr
- zunmhr
- zunml2
- zunmlq
- zunmql
- zunmqr
- zunmr2
- zunmr3
- zunmrq
- zunmrz
- zunmtr
- zupgtr
- zupmtr


"""

cdef extern from "fortran_defs.h":
    pass


cdef extern from "_lapack_subroutines.h":
    void _fortran_clangb "F_FUNC(clangbwrp, CLANGBWRP)"(s *out, char *norm, int *n, int *kl, int *ku, c *ab, int *ldab, s *work) nogil
cdef s clangb(char *norm, int *n, int *kl, int *ku, c *ab, int *ldab, s *work) nogil:
    cdef s out
    _fortran_clangb(&out, norm, n, kl, ku, ab, ldab, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_clange "F_FUNC(clangewrp, CLANGEWRP)"(s *out, char *norm, int *m, int *n, c *a, int *lda, s *work) nogil
cdef s clange(char *norm, int *m, int *n, c *a, int *lda, s *work) nogil:
    cdef s out
    _fortran_clange(&out, norm, m, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_clangt "F_FUNC(clangtwrp, CLANGTWRP)"(s *out, char *norm, int *n, c *dl, c *d, c *du) nogil
cdef s clangt(char *norm, int *n, c *dl, c *d, c *du) nogil:
    cdef s out
    _fortran_clangt(&out, norm, n, dl, d, du)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_clanhb "F_FUNC(clanhbwrp, CLANHBWRP)"(s *out, char *norm, char *uplo, int *n, int *k, c *ab, int *ldab, s *work) nogil
cdef s clanhb(char *norm, char *uplo, int *n, int *k, c *ab, int *ldab, s *work) nogil:
    cdef s out
    _fortran_clanhb(&out, norm, uplo, n, k, ab, ldab, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_clanhe "F_FUNC(clanhewrp, CLANHEWRP)"(s *out, char *norm, char *uplo, int *n, c *a, int *lda, s *work) nogil
cdef s clanhe(char *norm, char *uplo, int *n, c *a, int *lda, s *work) nogil:
    cdef s out
    _fortran_clanhe(&out, norm, uplo, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_clanhp "F_FUNC(clanhpwrp, CLANHPWRP)"(s *out, char *norm, char *uplo, int *n, c *ap, s *work) nogil
cdef s clanhp(char *norm, char *uplo, int *n, c *ap, s *work) nogil:
    cdef s out
    _fortran_clanhp(&out, norm, uplo, n, ap, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_clanhs "F_FUNC(clanhswrp, CLANHSWRP)"(s *out, char *norm, int *n, c *a, int *lda, s *work) nogil
cdef s clanhs(char *norm, int *n, c *a, int *lda, s *work) nogil:
    cdef s out
    _fortran_clanhs(&out, norm, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_clanht "F_FUNC(clanhtwrp, CLANHTWRP)"(s *out, char *norm, int *n, s *d, c *e) nogil
cdef s clanht(char *norm, int *n, s *d, c *e) nogil:
    cdef s out
    _fortran_clanht(&out, norm, n, d, e)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_clansb "F_FUNC(clansbwrp, CLANSBWRP)"(s *out, char *norm, char *uplo, int *n, int *k, c *ab, int *ldab, s *work) nogil
cdef s clansb(char *norm, char *uplo, int *n, int *k, c *ab, int *ldab, s *work) nogil:
    cdef s out
    _fortran_clansb(&out, norm, uplo, n, k, ab, ldab, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_clansp "F_FUNC(clanspwrp, CLANSPWRP)"(s *out, char *norm, char *uplo, int *n, c *ap, s *work) nogil
cdef s clansp(char *norm, char *uplo, int *n, c *ap, s *work) nogil:
    cdef s out
    _fortran_clansp(&out, norm, uplo, n, ap, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_clansy "F_FUNC(clansywrp, CLANSYWRP)"(s *out, char *norm, char *uplo, int *n, c *a, int *lda, s *work) nogil
cdef s clansy(char *norm, char *uplo, int *n, c *a, int *lda, s *work) nogil:
    cdef s out
    _fortran_clansy(&out, norm, uplo, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_clantb "F_FUNC(clantbwrp, CLANTBWRP)"(s *out, char *norm, char *uplo, char *diag, int *n, int *k, c *ab, int *ldab, s *work) nogil
cdef s clantb(char *norm, char *uplo, char *diag, int *n, int *k, c *ab, int *ldab, s *work) nogil:
    cdef s out
    _fortran_clantb(&out, norm, uplo, diag, n, k, ab, ldab, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_clantp "F_FUNC(clantpwrp, CLANTPWRP)"(s *out, char *norm, char *uplo, char *diag, int *n, c *ap, s *work) nogil
cdef s clantp(char *norm, char *uplo, char *diag, int *n, c *ap, s *work) nogil:
    cdef s out
    _fortran_clantp(&out, norm, uplo, diag, n, ap, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_clantr "F_FUNC(clantrwrp, CLANTRWRP)"(s *out, char *norm, char *uplo, char *diag, int *m, int *n, c *a, int *lda, s *work) nogil
cdef s clantr(char *norm, char *uplo, char *diag, int *m, int *n, c *a, int *lda, s *work) nogil:
    cdef s out
    _fortran_clantr(&out, norm, uplo, diag, m, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_disnan "F_FUNC(disnanwrp, DISNANWRP)"(bint *out, d *din) nogil
cdef bint disnan(d *din) nogil:
    cdef bint out
    _fortran_disnan(&out, din)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_dlamch "F_FUNC(dlamchwrp, DLAMCHWRP)"(d *out, char *cmach) nogil
cdef d dlamch(char *cmach) nogil:
    cdef d out
    _fortran_dlamch(&out, cmach)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_dlangb "F_FUNC(dlangbwrp, DLANGBWRP)"(d *out, char *norm, int *n, int *kl, int *ku, d *ab, int *ldab, d *work) nogil
cdef d dlangb(char *norm, int *n, int *kl, int *ku, d *ab, int *ldab, d *work) nogil:
    cdef d out
    _fortran_dlangb(&out, norm, n, kl, ku, ab, ldab, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_dlange "F_FUNC(dlangewrp, DLANGEWRP)"(d *out, char *norm, int *m, int *n, d *a, int *lda, d *work) nogil
cdef d dlange(char *norm, int *m, int *n, d *a, int *lda, d *work) nogil:
    cdef d out
    _fortran_dlange(&out, norm, m, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_dlangt "F_FUNC(dlangtwrp, DLANGTWRP)"(d *out, char *norm, int *n, d *dl, d *d_, d *du) nogil
cdef d dlangt(char *norm, int *n, d *dl, d *d_, d *du) nogil:
    cdef d out
    _fortran_dlangt(&out, norm, n, dl, d_, du)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_dlanhs "F_FUNC(dlanhswrp, DLANHSWRP)"(d *out, char *norm, int *n, d *a, int *lda, d *work) nogil
cdef d dlanhs(char *norm, int *n, d *a, int *lda, d *work) nogil:
    cdef d out
    _fortran_dlanhs(&out, norm, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_dlansb "F_FUNC(dlansbwrp, DLANSBWRP)"(d *out, char *norm, char *uplo, int *n, int *k, d *ab, int *ldab, d *work) nogil
cdef d dlansb(char *norm, char *uplo, int *n, int *k, d *ab, int *ldab, d *work) nogil:
    cdef d out
    _fortran_dlansb(&out, norm, uplo, n, k, ab, ldab, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_dlansp "F_FUNC(dlanspwrp, DLANSPWRP)"(d *out, char *norm, char *uplo, int *n, d *ap, d *work) nogil
cdef d dlansp(char *norm, char *uplo, int *n, d *ap, d *work) nogil:
    cdef d out
    _fortran_dlansp(&out, norm, uplo, n, ap, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_dlanst "F_FUNC(dlanstwrp, DLANSTWRP)"(d *out, char *norm, int *n, d *d_, d *e) nogil
cdef d dlanst(char *norm, int *n, d *d_, d *e) nogil:
    cdef d out
    _fortran_dlanst(&out, norm, n, d_, e)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_dlansy "F_FUNC(dlansywrp, DLANSYWRP)"(d *out, char *norm, char *uplo, int *n, d *a, int *lda, d *work) nogil
cdef d dlansy(char *norm, char *uplo, int *n, d *a, int *lda, d *work) nogil:
    cdef d out
    _fortran_dlansy(&out, norm, uplo, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_dlantb "F_FUNC(dlantbwrp, DLANTBWRP)"(d *out, char *norm, char *uplo, char *diag, int *n, int *k, d *ab, int *ldab, d *work) nogil
cdef d dlantb(char *norm, char *uplo, char *diag, int *n, int *k, d *ab, int *ldab, d *work) nogil:
    cdef d out
    _fortran_dlantb(&out, norm, uplo, diag, n, k, ab, ldab, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_dlantp "F_FUNC(dlantpwrp, DLANTPWRP)"(d *out, char *norm, char *uplo, char *diag, int *n, d *ap, d *work) nogil
cdef d dlantp(char *norm, char *uplo, char *diag, int *n, d *ap, d *work) nogil:
    cdef d out
    _fortran_dlantp(&out, norm, uplo, diag, n, ap, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_dlantr "F_FUNC(dlantrwrp, DLANTRWRP)"(d *out, char *norm, char *uplo, char *diag, int *m, int *n, d *a, int *lda, d *work) nogil
cdef d dlantr(char *norm, char *uplo, char *diag, int *m, int *n, d *a, int *lda, d *work) nogil:
    cdef d out
    _fortran_dlantr(&out, norm, uplo, diag, m, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_dzsum1 "F_FUNC(dzsum1wrp, DZSUM1WRP)"(d *out, int *n, z *cx, int *incx) nogil
cdef d dzsum1(int *n, z *cx, int *incx) nogil:
    cdef d out
    _fortran_dzsum1(&out, n, cx, incx)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_icmax1 "F_FUNC(icmax1wrp, ICMAX1WRP)"(int *out, int *n, c *cx, int *incx) nogil
cdef int icmax1(int *n, c *cx, int *incx) nogil:
    cdef int out
    _fortran_icmax1(&out, n, cx, incx)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_ieeeck "F_FUNC(ieeeckwrp, IEEECKWRP)"(int *out, int *ispec, s *zero, s *one) nogil
cdef int ieeeck(int *ispec, s *zero, s *one) nogil:
    cdef int out
    _fortran_ieeeck(&out, ispec, zero, one)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_ilaenv "F_FUNC(ilaenvwrp, ILAENVWRP)"(int *out, int *ispec, char *name, char *opts, int *n1, int *n2, int *n3, int *n4) nogil
cdef int ilaenv(int *ispec, char *name, char *opts, int *n1, int *n2, int *n3, int *n4) nogil:
    cdef int out
    _fortran_ilaenv(&out, ispec, name, opts, n1, n2, n3, n4)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_iparmq "F_FUNC(iparmqwrp, IPARMQWRP)"(int *out, int *ispec, char *name, char *opts, int *n, int *ilo, int *ihi, int *lwork) nogil
cdef int iparmq(int *ispec, char *name, char *opts, int *n, int *ilo, int *ihi, int *lwork) nogil:
    cdef int out
    _fortran_iparmq(&out, ispec, name, opts, n, ilo, ihi, lwork)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_izmax1 "F_FUNC(izmax1wrp, IZMAX1WRP)"(int *out, int *n, z *cx, int *incx) nogil
cdef int izmax1(int *n, z *cx, int *incx) nogil:
    cdef int out
    _fortran_izmax1(&out, n, cx, incx)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_lsamen "F_FUNC(lsamenwrp, LSAMENWRP)"(bint *out, int *n, char *ca, char *cb) nogil
cdef bint lsamen(int *n, char *ca, char *cb) nogil:
    cdef bint out
    _fortran_lsamen(&out, n, ca, cb)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_scsum1 "F_FUNC(scsum1wrp, SCSUM1WRP)"(s *out, int *n, c *cx, int *incx) nogil
cdef s scsum1(int *n, c *cx, int *incx) nogil:
    cdef s out
    _fortran_scsum1(&out, n, cx, incx)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_slamch "F_FUNC(slamchwrp, SLAMCHWRP)"(s *out, char *cmach) nogil
cdef s slamch(char *cmach) nogil:
    cdef s out
    _fortran_slamch(&out, cmach)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_slangb "F_FUNC(slangbwrp, SLANGBWRP)"(s *out, char *norm, int *n, int *kl, int *ku, s *ab, int *ldab, s *work) nogil
cdef s slangb(char *norm, int *n, int *kl, int *ku, s *ab, int *ldab, s *work) nogil:
    cdef s out
    _fortran_slangb(&out, norm, n, kl, ku, ab, ldab, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_slange "F_FUNC(slangewrp, SLANGEWRP)"(s *out, char *norm, int *m, int *n, s *a, int *lda, s *work) nogil
cdef s slange(char *norm, int *m, int *n, s *a, int *lda, s *work) nogil:
    cdef s out
    _fortran_slange(&out, norm, m, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_slangt "F_FUNC(slangtwrp, SLANGTWRP)"(s *out, char *norm, int *n, s *dl, s *d, s *du) nogil
cdef s slangt(char *norm, int *n, s *dl, s *d, s *du) nogil:
    cdef s out
    _fortran_slangt(&out, norm, n, dl, d, du)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_slanhs "F_FUNC(slanhswrp, SLANHSWRP)"(s *out, char *norm, int *n, s *a, int *lda, s *work) nogil
cdef s slanhs(char *norm, int *n, s *a, int *lda, s *work) nogil:
    cdef s out
    _fortran_slanhs(&out, norm, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_slansb "F_FUNC(slansbwrp, SLANSBWRP)"(s *out, char *norm, char *uplo, int *n, int *k, s *ab, int *ldab, s *work) nogil
cdef s slansb(char *norm, char *uplo, int *n, int *k, s *ab, int *ldab, s *work) nogil:
    cdef s out
    _fortran_slansb(&out, norm, uplo, n, k, ab, ldab, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_slansp "F_FUNC(slanspwrp, SLANSPWRP)"(s *out, char *norm, char *uplo, int *n, s *ap, s *work) nogil
cdef s slansp(char *norm, char *uplo, int *n, s *ap, s *work) nogil:
    cdef s out
    _fortran_slansp(&out, norm, uplo, n, ap, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_slanst "F_FUNC(slanstwrp, SLANSTWRP)"(s *out, char *norm, int *n, s *d, s *e) nogil
cdef s slanst(char *norm, int *n, s *d, s *e) nogil:
    cdef s out
    _fortran_slanst(&out, norm, n, d, e)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_slansy "F_FUNC(slansywrp, SLANSYWRP)"(s *out, char *norm, char *uplo, int *n, s *a, int *lda, s *work) nogil
cdef s slansy(char *norm, char *uplo, int *n, s *a, int *lda, s *work) nogil:
    cdef s out
    _fortran_slansy(&out, norm, uplo, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_slantb "F_FUNC(slantbwrp, SLANTBWRP)"(s *out, char *norm, char *uplo, char *diag, int *n, int *k, s *ab, int *ldab, s *work) nogil
cdef s slantb(char *norm, char *uplo, char *diag, int *n, int *k, s *ab, int *ldab, s *work) nogil:
    cdef s out
    _fortran_slantb(&out, norm, uplo, diag, n, k, ab, ldab, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_slantp "F_FUNC(slantpwrp, SLANTPWRP)"(s *out, char *norm, char *uplo, char *diag, int *n, s *ap, s *work) nogil
cdef s slantp(char *norm, char *uplo, char *diag, int *n, s *ap, s *work) nogil:
    cdef s out
    _fortran_slantp(&out, norm, uplo, diag, n, ap, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_slantr "F_FUNC(slantrwrp, SLANTRWRP)"(s *out, char *norm, char *uplo, char *diag, int *m, int *n, s *a, int *lda, s *work) nogil
cdef s slantr(char *norm, char *uplo, char *diag, int *m, int *n, s *a, int *lda, s *work) nogil:
    cdef s out
    _fortran_slantr(&out, norm, uplo, diag, m, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_zlangb "F_FUNC(zlangbwrp, ZLANGBWRP)"(d *out, char *norm, int *n, int *kl, int *ku, z *ab, int *ldab, d *work) nogil
cdef d zlangb(char *norm, int *n, int *kl, int *ku, z *ab, int *ldab, d *work) nogil:
    cdef d out
    _fortran_zlangb(&out, norm, n, kl, ku, ab, ldab, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_zlange "F_FUNC(zlangewrp, ZLANGEWRP)"(d *out, char *norm, int *m, int *n, z *a, int *lda, d *work) nogil
cdef d zlange(char *norm, int *m, int *n, z *a, int *lda, d *work) nogil:
    cdef d out
    _fortran_zlange(&out, norm, m, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_zlangt "F_FUNC(zlangtwrp, ZLANGTWRP)"(d *out, char *norm, int *n, z *dl, z *d_, z *du) nogil
cdef d zlangt(char *norm, int *n, z *dl, z *d_, z *du) nogil:
    cdef d out
    _fortran_zlangt(&out, norm, n, dl, d_, du)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_zlanhb "F_FUNC(zlanhbwrp, ZLANHBWRP)"(d *out, char *norm, char *uplo, int *n, int *k, z *ab, int *ldab, d *work) nogil
cdef d zlanhb(char *norm, char *uplo, int *n, int *k, z *ab, int *ldab, d *work) nogil:
    cdef d out
    _fortran_zlanhb(&out, norm, uplo, n, k, ab, ldab, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_zlanhe "F_FUNC(zlanhewrp, ZLANHEWRP)"(d *out, char *norm, char *uplo, int *n, z *a, int *lda, d *work) nogil
cdef d zlanhe(char *norm, char *uplo, int *n, z *a, int *lda, d *work) nogil:
    cdef d out
    _fortran_zlanhe(&out, norm, uplo, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_zlanhp "F_FUNC(zlanhpwrp, ZLANHPWRP)"(d *out, char *norm, char *uplo, int *n, z *ap, d *work) nogil
cdef d zlanhp(char *norm, char *uplo, int *n, z *ap, d *work) nogil:
    cdef d out
    _fortran_zlanhp(&out, norm, uplo, n, ap, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_zlanhs "F_FUNC(zlanhswrp, ZLANHSWRP)"(d *out, char *norm, int *n, z *a, int *lda, d *work) nogil
cdef d zlanhs(char *norm, int *n, z *a, int *lda, d *work) nogil:
    cdef d out
    _fortran_zlanhs(&out, norm, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_zlanht "F_FUNC(zlanhtwrp, ZLANHTWRP)"(d *out, char *norm, int *n, d *d_, z *e) nogil
cdef d zlanht(char *norm, int *n, d *d_, z *e) nogil:
    cdef d out
    _fortran_zlanht(&out, norm, n, d_, e)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_zlansb "F_FUNC(zlansbwrp, ZLANSBWRP)"(d *out, char *norm, char *uplo, int *n, int *k, z *ab, int *ldab, d *work) nogil
cdef d zlansb(char *norm, char *uplo, int *n, int *k, z *ab, int *ldab, d *work) nogil:
    cdef d out
    _fortran_zlansb(&out, norm, uplo, n, k, ab, ldab, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_zlansp "F_FUNC(zlanspwrp, ZLANSPWRP)"(d *out, char *norm, char *uplo, int *n, z *ap, d *work) nogil
cdef d zlansp(char *norm, char *uplo, int *n, z *ap, d *work) nogil:
    cdef d out
    _fortran_zlansp(&out, norm, uplo, n, ap, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_zlansy "F_FUNC(zlansywrp, ZLANSYWRP)"(d *out, char *norm, char *uplo, int *n, z *a, int *lda, d *work) nogil
cdef d zlansy(char *norm, char *uplo, int *n, z *a, int *lda, d *work) nogil:
    cdef d out
    _fortran_zlansy(&out, norm, uplo, n, a, lda, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_zlantb "F_FUNC(zlantbwrp, ZLANTBWRP)"(d *out, char *norm, char *uplo, char *diag, int *n, int *k, z *ab, int *ldab, d *work) nogil
cdef d zlantb(char *norm, char *uplo, char *diag, int *n, int *k, z *ab, int *ldab, d *work) nogil:
    cdef d out
    _fortran_zlantb(&out, norm, uplo, diag, n, k, ab, ldab, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_zlantp "F_FUNC(zlantpwrp, ZLANTPWRP)"(d *out, char *norm, char *uplo, char *diag, int *n, z *ap, d *work) nogil
cdef d zlantp(char *norm, char *uplo, char *diag, int *n, z *ap, d *work) nogil:
    cdef d out
    _fortran_zlantp(&out, norm, uplo, diag, n, ap, work)
    return out


cdef extern from "_lapack_subroutines.h":
    void _fortran_zlantr "F_FUNC(zlantrwrp, ZLANTRWRP)"(d *out, char *norm, char *uplo, char *diag, int *m, int *n, z *a, int *lda, d *work) nogil
cdef d zlantr(char *norm, char *uplo, char *diag, int *m, int *n, z *a, int *lda, d *work) nogil:
    cdef d out
    _fortran_zlantr(&out, norm, uplo, diag, m, n, a, lda, work)
    return out

cdef extern from "_lapack_subroutines.h":
    void _fortran_cbdsqr "F_FUNC(cbdsqr,CBDSQR)"(char *uplo, int *n, int *ncvt, int *nru, int *ncc, s *d, s *e, c *vt, int *ldvt, c *u, int *ldu, c *c, int *ldc, s *rwork, int *info) nogil
cdef void cbdsqr(char *uplo, int *n, int *ncvt, int *nru, int *ncc, s *d, s *e, c *vt, int *ldvt, c *u, int *ldu, c *c, int *ldc, s *rwork, int *info) nogil:
    _fortran_cbdsqr(uplo, n, ncvt, nru, ncc, d, e, vt, ldvt, u, ldu, c, ldc, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgbbrd "F_FUNC(cgbbrd,CGBBRD)"(char *vect, int *m, int *n, int *ncc, int *kl, int *ku, c *ab, int *ldab, s *d, s *e, c *q, int *ldq, c *pt, int *ldpt, c *c, int *ldc, c *work, s *rwork, int *info) nogil
cdef void cgbbrd(char *vect, int *m, int *n, int *ncc, int *kl, int *ku, c *ab, int *ldab, s *d, s *e, c *q, int *ldq, c *pt, int *ldpt, c *c, int *ldc, c *work, s *rwork, int *info) nogil:
    _fortran_cgbbrd(vect, m, n, ncc, kl, ku, ab, ldab, d, e, q, ldq, pt, ldpt, c, ldc, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgbcon "F_FUNC(cgbcon,CGBCON)"(char *norm, int *n, int *kl, int *ku, c *ab, int *ldab, int *ipiv, s *anorm, s *rcond, c *work, s *rwork, int *info) nogil
cdef void cgbcon(char *norm, int *n, int *kl, int *ku, c *ab, int *ldab, int *ipiv, s *anorm, s *rcond, c *work, s *rwork, int *info) nogil:
    _fortran_cgbcon(norm, n, kl, ku, ab, ldab, ipiv, anorm, rcond, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgbequ "F_FUNC(cgbequ,CGBEQU)"(int *m, int *n, int *kl, int *ku, c *ab, int *ldab, s *r, s *c, s *rowcnd, s *colcnd, s *amax, int *info) nogil
cdef void cgbequ(int *m, int *n, int *kl, int *ku, c *ab, int *ldab, s *r, s *c, s *rowcnd, s *colcnd, s *amax, int *info) nogil:
    _fortran_cgbequ(m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgbrfs "F_FUNC(cgbrfs,CGBRFS)"(char *trans, int *n, int *kl, int *ku, int *nrhs, c *ab, int *ldab, c *afb, int *ldafb, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void cgbrfs(char *trans, int *n, int *kl, int *ku, int *nrhs, c *ab, int *ldab, c *afb, int *ldafb, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_cgbrfs(trans, n, kl, ku, nrhs, ab, ldab, afb, ldafb, ipiv, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgbsv "F_FUNC(cgbsv,CGBSV)"(int *n, int *kl, int *ku, int *nrhs, c *ab, int *ldab, int *ipiv, c *b, int *ldb, int *info) nogil
cdef void cgbsv(int *n, int *kl, int *ku, int *nrhs, c *ab, int *ldab, int *ipiv, c *b, int *ldb, int *info) nogil:
    _fortran_cgbsv(n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgbsvx "F_FUNC(cgbsvx,CGBSVX)"(char *fact, char *trans, int *n, int *kl, int *ku, int *nrhs, c *ab, int *ldab, c *afb, int *ldafb, int *ipiv, char *equed, s *r, s *c, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void cgbsvx(char *fact, char *trans, int *n, int *kl, int *ku, int *nrhs, c *ab, int *ldab, c *afb, int *ldafb, int *ipiv, char *equed, s *r, s *c, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_cgbsvx(fact, trans, n, kl, ku, nrhs, ab, ldab, afb, ldafb, ipiv, equed, r, c, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgbtf2 "F_FUNC(cgbtf2,CGBTF2)"(int *m, int *n, int *kl, int *ku, c *ab, int *ldab, int *ipiv, int *info) nogil
cdef void cgbtf2(int *m, int *n, int *kl, int *ku, c *ab, int *ldab, int *ipiv, int *info) nogil:
    _fortran_cgbtf2(m, n, kl, ku, ab, ldab, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgbtrf "F_FUNC(cgbtrf,CGBTRF)"(int *m, int *n, int *kl, int *ku, c *ab, int *ldab, int *ipiv, int *info) nogil
cdef void cgbtrf(int *m, int *n, int *kl, int *ku, c *ab, int *ldab, int *ipiv, int *info) nogil:
    _fortran_cgbtrf(m, n, kl, ku, ab, ldab, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgbtrs "F_FUNC(cgbtrs,CGBTRS)"(char *trans, int *n, int *kl, int *ku, int *nrhs, c *ab, int *ldab, int *ipiv, c *b, int *ldb, int *info) nogil
cdef void cgbtrs(char *trans, int *n, int *kl, int *ku, int *nrhs, c *ab, int *ldab, int *ipiv, c *b, int *ldb, int *info) nogil:
    _fortran_cgbtrs(trans, n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgebak "F_FUNC(cgebak,CGEBAK)"(char *job, char *side, int *n, int *ilo, int *ihi, s *scale, int *m, c *v, int *ldv, int *info) nogil
cdef void cgebak(char *job, char *side, int *n, int *ilo, int *ihi, s *scale, int *m, c *v, int *ldv, int *info) nogil:
    _fortran_cgebak(job, side, n, ilo, ihi, scale, m, v, ldv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgebal "F_FUNC(cgebal,CGEBAL)"(char *job, int *n, c *a, int *lda, int *ilo, int *ihi, s *scale, int *info) nogil
cdef void cgebal(char *job, int *n, c *a, int *lda, int *ilo, int *ihi, s *scale, int *info) nogil:
    _fortran_cgebal(job, n, a, lda, ilo, ihi, scale, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgebd2 "F_FUNC(cgebd2,CGEBD2)"(int *m, int *n, c *a, int *lda, s *d, s *e, c *tauq, c *taup, c *work, int *info) nogil
cdef void cgebd2(int *m, int *n, c *a, int *lda, s *d, s *e, c *tauq, c *taup, c *work, int *info) nogil:
    _fortran_cgebd2(m, n, a, lda, d, e, tauq, taup, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgebrd "F_FUNC(cgebrd,CGEBRD)"(int *m, int *n, c *a, int *lda, s *d, s *e, c *tauq, c *taup, c *work, int *lwork, int *info) nogil
cdef void cgebrd(int *m, int *n, c *a, int *lda, s *d, s *e, c *tauq, c *taup, c *work, int *lwork, int *info) nogil:
    _fortran_cgebrd(m, n, a, lda, d, e, tauq, taup, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgecon "F_FUNC(cgecon,CGECON)"(char *norm, int *n, c *a, int *lda, s *anorm, s *rcond, c *work, s *rwork, int *info) nogil
cdef void cgecon(char *norm, int *n, c *a, int *lda, s *anorm, s *rcond, c *work, s *rwork, int *info) nogil:
    _fortran_cgecon(norm, n, a, lda, anorm, rcond, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgeequ "F_FUNC(cgeequ,CGEEQU)"(int *m, int *n, c *a, int *lda, s *r, s *c, s *rowcnd, s *colcnd, s *amax, int *info) nogil
cdef void cgeequ(int *m, int *n, c *a, int *lda, s *r, s *c, s *rowcnd, s *colcnd, s *amax, int *info) nogil:
    _fortran_cgeequ(m, n, a, lda, r, c, rowcnd, colcnd, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgees "F_FUNC(cgees,CGEES)"(char *jobvs, char *sort, cselect1 *select, int *n, c *a, int *lda, int *sdim, c *w, c *vs, int *ldvs, c *work, int *lwork, s *rwork, bint *bwork, int *info) nogil
cdef void cgees(char *jobvs, char *sort, cselect1 *select, int *n, c *a, int *lda, int *sdim, c *w, c *vs, int *ldvs, c *work, int *lwork, s *rwork, bint *bwork, int *info) nogil:
    _fortran_cgees(jobvs, sort, select, n, a, lda, sdim, w, vs, ldvs, work, lwork, rwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgeesx "F_FUNC(cgeesx,CGEESX)"(char *jobvs, char *sort, cselect1 *select, char *sense, int *n, c *a, int *lda, int *sdim, c *w, c *vs, int *ldvs, s *rconde, s *rcondv, c *work, int *lwork, s *rwork, bint *bwork, int *info) nogil
cdef void cgeesx(char *jobvs, char *sort, cselect1 *select, char *sense, int *n, c *a, int *lda, int *sdim, c *w, c *vs, int *ldvs, s *rconde, s *rcondv, c *work, int *lwork, s *rwork, bint *bwork, int *info) nogil:
    _fortran_cgeesx(jobvs, sort, select, sense, n, a, lda, sdim, w, vs, ldvs, rconde, rcondv, work, lwork, rwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgeev "F_FUNC(cgeev,CGEEV)"(char *jobvl, char *jobvr, int *n, c *a, int *lda, c *w, c *vl, int *ldvl, c *vr, int *ldvr, c *work, int *lwork, s *rwork, int *info) nogil
cdef void cgeev(char *jobvl, char *jobvr, int *n, c *a, int *lda, c *w, c *vl, int *ldvl, c *vr, int *ldvr, c *work, int *lwork, s *rwork, int *info) nogil:
    _fortran_cgeev(jobvl, jobvr, n, a, lda, w, vl, ldvl, vr, ldvr, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgeevx "F_FUNC(cgeevx,CGEEVX)"(char *balanc, char *jobvl, char *jobvr, char *sense, int *n, c *a, int *lda, c *w, c *vl, int *ldvl, c *vr, int *ldvr, int *ilo, int *ihi, s *scale, s *abnrm, s *rconde, s *rcondv, c *work, int *lwork, s *rwork, int *info) nogil
cdef void cgeevx(char *balanc, char *jobvl, char *jobvr, char *sense, int *n, c *a, int *lda, c *w, c *vl, int *ldvl, c *vr, int *ldvr, int *ilo, int *ihi, s *scale, s *abnrm, s *rconde, s *rcondv, c *work, int *lwork, s *rwork, int *info) nogil:
    _fortran_cgeevx(balanc, jobvl, jobvr, sense, n, a, lda, w, vl, ldvl, vr, ldvr, ilo, ihi, scale, abnrm, rconde, rcondv, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgegs "F_FUNC(cgegs,CGEGS)"(char *jobvsl, char *jobvsr, int *n, c *a, int *lda, c *b, int *ldb, c *alpha, c *beta, c *vsl, int *ldvsl, c *vsr, int *ldvsr, c *work, int *lwork, s *rwork, int *info) nogil
cdef void cgegs(char *jobvsl, char *jobvsr, int *n, c *a, int *lda, c *b, int *ldb, c *alpha, c *beta, c *vsl, int *ldvsl, c *vsr, int *ldvsr, c *work, int *lwork, s *rwork, int *info) nogil:
    _fortran_cgegs(jobvsl, jobvsr, n, a, lda, b, ldb, alpha, beta, vsl, ldvsl, vsr, ldvsr, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgegv "F_FUNC(cgegv,CGEGV)"(char *jobvl, char *jobvr, int *n, c *a, int *lda, c *b, int *ldb, c *alpha, c *beta, c *vl, int *ldvl, c *vr, int *ldvr, c *work, int *lwork, s *rwork, int *info) nogil
cdef void cgegv(char *jobvl, char *jobvr, int *n, c *a, int *lda, c *b, int *ldb, c *alpha, c *beta, c *vl, int *ldvl, c *vr, int *ldvr, c *work, int *lwork, s *rwork, int *info) nogil:
    _fortran_cgegv(jobvl, jobvr, n, a, lda, b, ldb, alpha, beta, vl, ldvl, vr, ldvr, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgehd2 "F_FUNC(cgehd2,CGEHD2)"(int *n, int *ilo, int *ihi, c *a, int *lda, c *tau, c *work, int *info) nogil
cdef void cgehd2(int *n, int *ilo, int *ihi, c *a, int *lda, c *tau, c *work, int *info) nogil:
    _fortran_cgehd2(n, ilo, ihi, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgehrd "F_FUNC(cgehrd,CGEHRD)"(int *n, int *ilo, int *ihi, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil
cdef void cgehrd(int *n, int *ilo, int *ihi, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil:
    _fortran_cgehrd(n, ilo, ihi, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgelq2 "F_FUNC(cgelq2,CGELQ2)"(int *m, int *n, c *a, int *lda, c *tau, c *work, int *info) nogil
cdef void cgelq2(int *m, int *n, c *a, int *lda, c *tau, c *work, int *info) nogil:
    _fortran_cgelq2(m, n, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgelqf "F_FUNC(cgelqf,CGELQF)"(int *m, int *n, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil
cdef void cgelqf(int *m, int *n, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil:
    _fortran_cgelqf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgels "F_FUNC(cgels,CGELS)"(char *trans, int *m, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, c *work, int *lwork, int *info) nogil
cdef void cgels(char *trans, int *m, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, c *work, int *lwork, int *info) nogil:
    _fortran_cgels(trans, m, n, nrhs, a, lda, b, ldb, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgelsd "F_FUNC(cgelsd,CGELSD)"(int *m, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, s *s, s *rcond, int *rank, c *work, int *lwork, s *rwork, int *iwork, int *info) nogil
cdef void cgelsd(int *m, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, s *s, s *rcond, int *rank, c *work, int *lwork, s *rwork, int *iwork, int *info) nogil:
    _fortran_cgelsd(m, n, nrhs, a, lda, b, ldb, s, rcond, rank, work, lwork, rwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgelss "F_FUNC(cgelss,CGELSS)"(int *m, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, s *s, s *rcond, int *rank, c *work, int *lwork, s *rwork, int *info) nogil
cdef void cgelss(int *m, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, s *s, s *rcond, int *rank, c *work, int *lwork, s *rwork, int *info) nogil:
    _fortran_cgelss(m, n, nrhs, a, lda, b, ldb, s, rcond, rank, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgelsx "F_FUNC(cgelsx,CGELSX)"(int *m, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, int *jpvt, s *rcond, int *rank, c *work, s *rwork, int *info) nogil
cdef void cgelsx(int *m, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, int *jpvt, s *rcond, int *rank, c *work, s *rwork, int *info) nogil:
    _fortran_cgelsx(m, n, nrhs, a, lda, b, ldb, jpvt, rcond, rank, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgelsy "F_FUNC(cgelsy,CGELSY)"(int *m, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, int *jpvt, s *rcond, int *rank, c *work, int *lwork, s *rwork, int *info) nogil
cdef void cgelsy(int *m, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, int *jpvt, s *rcond, int *rank, c *work, int *lwork, s *rwork, int *info) nogil:
    _fortran_cgelsy(m, n, nrhs, a, lda, b, ldb, jpvt, rcond, rank, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgeql2 "F_FUNC(cgeql2,CGEQL2)"(int *m, int *n, c *a, int *lda, c *tau, c *work, int *info) nogil
cdef void cgeql2(int *m, int *n, c *a, int *lda, c *tau, c *work, int *info) nogil:
    _fortran_cgeql2(m, n, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgeqlf "F_FUNC(cgeqlf,CGEQLF)"(int *m, int *n, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil
cdef void cgeqlf(int *m, int *n, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil:
    _fortran_cgeqlf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgeqp3 "F_FUNC(cgeqp3,CGEQP3)"(int *m, int *n, c *a, int *lda, int *jpvt, c *tau, c *work, int *lwork, s *rwork, int *info) nogil
cdef void cgeqp3(int *m, int *n, c *a, int *lda, int *jpvt, c *tau, c *work, int *lwork, s *rwork, int *info) nogil:
    _fortran_cgeqp3(m, n, a, lda, jpvt, tau, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgeqpf "F_FUNC(cgeqpf,CGEQPF)"(int *m, int *n, c *a, int *lda, int *jpvt, c *tau, c *work, s *rwork, int *info) nogil
cdef void cgeqpf(int *m, int *n, c *a, int *lda, int *jpvt, c *tau, c *work, s *rwork, int *info) nogil:
    _fortran_cgeqpf(m, n, a, lda, jpvt, tau, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgeqr2 "F_FUNC(cgeqr2,CGEQR2)"(int *m, int *n, c *a, int *lda, c *tau, c *work, int *info) nogil
cdef void cgeqr2(int *m, int *n, c *a, int *lda, c *tau, c *work, int *info) nogil:
    _fortran_cgeqr2(m, n, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgeqrf "F_FUNC(cgeqrf,CGEQRF)"(int *m, int *n, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil
cdef void cgeqrf(int *m, int *n, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil:
    _fortran_cgeqrf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgerfs "F_FUNC(cgerfs,CGERFS)"(char *trans, int *n, int *nrhs, c *a, int *lda, c *af, int *ldaf, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void cgerfs(char *trans, int *n, int *nrhs, c *a, int *lda, c *af, int *ldaf, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_cgerfs(trans, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgerq2 "F_FUNC(cgerq2,CGERQ2)"(int *m, int *n, c *a, int *lda, c *tau, c *work, int *info) nogil
cdef void cgerq2(int *m, int *n, c *a, int *lda, c *tau, c *work, int *info) nogil:
    _fortran_cgerq2(m, n, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgerqf "F_FUNC(cgerqf,CGERQF)"(int *m, int *n, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil
cdef void cgerqf(int *m, int *n, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil:
    _fortran_cgerqf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgesc2 "F_FUNC(cgesc2,CGESC2)"(int *n, c *a, int *lda, c *rhs, int *ipiv, int *jpiv, s *scale) nogil
cdef void cgesc2(int *n, c *a, int *lda, c *rhs, int *ipiv, int *jpiv, s *scale) nogil:
    _fortran_cgesc2(n, a, lda, rhs, ipiv, jpiv, scale)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgesdd "F_FUNC(cgesdd,CGESDD)"(char *jobz, int *m, int *n, c *a, int *lda, s *s, c *u, int *ldu, c *vt, int *ldvt, c *work, int *lwork, s *rwork, int *iwork, int *info) nogil
cdef void cgesdd(char *jobz, int *m, int *n, c *a, int *lda, s *s, c *u, int *ldu, c *vt, int *ldvt, c *work, int *lwork, s *rwork, int *iwork, int *info) nogil:
    _fortran_cgesdd(jobz, m, n, a, lda, s, u, ldu, vt, ldvt, work, lwork, rwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgesv "F_FUNC(cgesv,CGESV)"(int *n, int *nrhs, c *a, int *lda, int *ipiv, c *b, int *ldb, int *info) nogil
cdef void cgesv(int *n, int *nrhs, c *a, int *lda, int *ipiv, c *b, int *ldb, int *info) nogil:
    _fortran_cgesv(n, nrhs, a, lda, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgesvd "F_FUNC(cgesvd,CGESVD)"(char *jobu, char *jobvt, int *m, int *n, c *a, int *lda, s *s, c *u, int *ldu, c *vt, int *ldvt, c *work, int *lwork, s *rwork, int *info) nogil
cdef void cgesvd(char *jobu, char *jobvt, int *m, int *n, c *a, int *lda, s *s, c *u, int *ldu, c *vt, int *ldvt, c *work, int *lwork, s *rwork, int *info) nogil:
    _fortran_cgesvd(jobu, jobvt, m, n, a, lda, s, u, ldu, vt, ldvt, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgesvx "F_FUNC(cgesvx,CGESVX)"(char *fact, char *trans, int *n, int *nrhs, c *a, int *lda, c *af, int *ldaf, int *ipiv, char *equed, s *r, s *c, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void cgesvx(char *fact, char *trans, int *n, int *nrhs, c *a, int *lda, c *af, int *ldaf, int *ipiv, char *equed, s *r, s *c, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_cgesvx(fact, trans, n, nrhs, a, lda, af, ldaf, ipiv, equed, r, c, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgetc2 "F_FUNC(cgetc2,CGETC2)"(int *n, c *a, int *lda, int *ipiv, int *jpiv, int *info) nogil
cdef void cgetc2(int *n, c *a, int *lda, int *ipiv, int *jpiv, int *info) nogil:
    _fortran_cgetc2(n, a, lda, ipiv, jpiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgetf2 "F_FUNC(cgetf2,CGETF2)"(int *m, int *n, c *a, int *lda, int *ipiv, int *info) nogil
cdef void cgetf2(int *m, int *n, c *a, int *lda, int *ipiv, int *info) nogil:
    _fortran_cgetf2(m, n, a, lda, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgetrf "F_FUNC(cgetrf,CGETRF)"(int *m, int *n, c *a, int *lda, int *ipiv, int *info) nogil
cdef void cgetrf(int *m, int *n, c *a, int *lda, int *ipiv, int *info) nogil:
    _fortran_cgetrf(m, n, a, lda, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgetri "F_FUNC(cgetri,CGETRI)"(int *n, c *a, int *lda, int *ipiv, c *work, int *lwork, int *info) nogil
cdef void cgetri(int *n, c *a, int *lda, int *ipiv, c *work, int *lwork, int *info) nogil:
    _fortran_cgetri(n, a, lda, ipiv, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgetrs "F_FUNC(cgetrs,CGETRS)"(char *trans, int *n, int *nrhs, c *a, int *lda, int *ipiv, c *b, int *ldb, int *info) nogil
cdef void cgetrs(char *trans, int *n, int *nrhs, c *a, int *lda, int *ipiv, c *b, int *ldb, int *info) nogil:
    _fortran_cgetrs(trans, n, nrhs, a, lda, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cggbak "F_FUNC(cggbak,CGGBAK)"(char *job, char *side, int *n, int *ilo, int *ihi, s *lscale, s *rscale, int *m, c *v, int *ldv, int *info) nogil
cdef void cggbak(char *job, char *side, int *n, int *ilo, int *ihi, s *lscale, s *rscale, int *m, c *v, int *ldv, int *info) nogil:
    _fortran_cggbak(job, side, n, ilo, ihi, lscale, rscale, m, v, ldv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cggbal "F_FUNC(cggbal,CGGBAL)"(char *job, int *n, c *a, int *lda, c *b, int *ldb, int *ilo, int *ihi, s *lscale, s *rscale, s *work, int *info) nogil
cdef void cggbal(char *job, int *n, c *a, int *lda, c *b, int *ldb, int *ilo, int *ihi, s *lscale, s *rscale, s *work, int *info) nogil:
    _fortran_cggbal(job, n, a, lda, b, ldb, ilo, ihi, lscale, rscale, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgges "F_FUNC(cgges,CGGES)"(char *jobvsl, char *jobvsr, char *sort, cselect2 *selctg, int *n, c *a, int *lda, c *b, int *ldb, int *sdim, c *alpha, c *beta, c *vsl, int *ldvsl, c *vsr, int *ldvsr, c *work, int *lwork, s *rwork, bint *bwork, int *info) nogil
cdef void cgges(char *jobvsl, char *jobvsr, char *sort, cselect2 *selctg, int *n, c *a, int *lda, c *b, int *ldb, int *sdim, c *alpha, c *beta, c *vsl, int *ldvsl, c *vsr, int *ldvsr, c *work, int *lwork, s *rwork, bint *bwork, int *info) nogil:
    _fortran_cgges(jobvsl, jobvsr, sort, selctg, n, a, lda, b, ldb, sdim, alpha, beta, vsl, ldvsl, vsr, ldvsr, work, lwork, rwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cggesx "F_FUNC(cggesx,CGGESX)"(char *jobvsl, char *jobvsr, char *sort, cselect2 *selctg, char *sense, int *n, c *a, int *lda, c *b, int *ldb, int *sdim, c *alpha, c *beta, c *vsl, int *ldvsl, c *vsr, int *ldvsr, s *rconde, s *rcondv, c *work, int *lwork, s *rwork, int *iwork, int *liwork, bint *bwork, int *info) nogil
cdef void cggesx(char *jobvsl, char *jobvsr, char *sort, cselect2 *selctg, char *sense, int *n, c *a, int *lda, c *b, int *ldb, int *sdim, c *alpha, c *beta, c *vsl, int *ldvsl, c *vsr, int *ldvsr, s *rconde, s *rcondv, c *work, int *lwork, s *rwork, int *iwork, int *liwork, bint *bwork, int *info) nogil:
    _fortran_cggesx(jobvsl, jobvsr, sort, selctg, sense, n, a, lda, b, ldb, sdim, alpha, beta, vsl, ldvsl, vsr, ldvsr, rconde, rcondv, work, lwork, rwork, iwork, liwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cggev "F_FUNC(cggev,CGGEV)"(char *jobvl, char *jobvr, int *n, c *a, int *lda, c *b, int *ldb, c *alpha, c *beta, c *vl, int *ldvl, c *vr, int *ldvr, c *work, int *lwork, s *rwork, int *info) nogil
cdef void cggev(char *jobvl, char *jobvr, int *n, c *a, int *lda, c *b, int *ldb, c *alpha, c *beta, c *vl, int *ldvl, c *vr, int *ldvr, c *work, int *lwork, s *rwork, int *info) nogil:
    _fortran_cggev(jobvl, jobvr, n, a, lda, b, ldb, alpha, beta, vl, ldvl, vr, ldvr, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cggevx "F_FUNC(cggevx,CGGEVX)"(char *balanc, char *jobvl, char *jobvr, char *sense, int *n, c *a, int *lda, c *b, int *ldb, c *alpha, c *beta, c *vl, int *ldvl, c *vr, int *ldvr, int *ilo, int *ihi, s *lscale, s *rscale, s *abnrm, s *bbnrm, s *rconde, s *rcondv, c *work, int *lwork, s *rwork, int *iwork, bint *bwork, int *info) nogil
cdef void cggevx(char *balanc, char *jobvl, char *jobvr, char *sense, int *n, c *a, int *lda, c *b, int *ldb, c *alpha, c *beta, c *vl, int *ldvl, c *vr, int *ldvr, int *ilo, int *ihi, s *lscale, s *rscale, s *abnrm, s *bbnrm, s *rconde, s *rcondv, c *work, int *lwork, s *rwork, int *iwork, bint *bwork, int *info) nogil:
    _fortran_cggevx(balanc, jobvl, jobvr, sense, n, a, lda, b, ldb, alpha, beta, vl, ldvl, vr, ldvr, ilo, ihi, lscale, rscale, abnrm, bbnrm, rconde, rcondv, work, lwork, rwork, iwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cggglm "F_FUNC(cggglm,CGGGLM)"(int *n, int *m, int *p, c *a, int *lda, c *b, int *ldb, c *d, c *x, c *y, c *work, int *lwork, int *info) nogil
cdef void cggglm(int *n, int *m, int *p, c *a, int *lda, c *b, int *ldb, c *d, c *x, c *y, c *work, int *lwork, int *info) nogil:
    _fortran_cggglm(n, m, p, a, lda, b, ldb, d, x, y, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgghrd "F_FUNC(cgghrd,CGGHRD)"(char *compq, char *compz, int *n, int *ilo, int *ihi, c *a, int *lda, c *b, int *ldb, c *q, int *ldq, c *z, int *ldz, int *info) nogil
cdef void cgghrd(char *compq, char *compz, int *n, int *ilo, int *ihi, c *a, int *lda, c *b, int *ldb, c *q, int *ldq, c *z, int *ldz, int *info) nogil:
    _fortran_cgghrd(compq, compz, n, ilo, ihi, a, lda, b, ldb, q, ldq, z, ldz, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgglse "F_FUNC(cgglse,CGGLSE)"(int *m, int *n, int *p, c *a, int *lda, c *b, int *ldb, c *c, c *d, c *x, c *work, int *lwork, int *info) nogil
cdef void cgglse(int *m, int *n, int *p, c *a, int *lda, c *b, int *ldb, c *c, c *d, c *x, c *work, int *lwork, int *info) nogil:
    _fortran_cgglse(m, n, p, a, lda, b, ldb, c, d, x, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cggqrf "F_FUNC(cggqrf,CGGQRF)"(int *n, int *m, int *p, c *a, int *lda, c *taua, c *b, int *ldb, c *taub, c *work, int *lwork, int *info) nogil
cdef void cggqrf(int *n, int *m, int *p, c *a, int *lda, c *taua, c *b, int *ldb, c *taub, c *work, int *lwork, int *info) nogil:
    _fortran_cggqrf(n, m, p, a, lda, taua, b, ldb, taub, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cggrqf "F_FUNC(cggrqf,CGGRQF)"(int *m, int *p, int *n, c *a, int *lda, c *taua, c *b, int *ldb, c *taub, c *work, int *lwork, int *info) nogil
cdef void cggrqf(int *m, int *p, int *n, c *a, int *lda, c *taua, c *b, int *ldb, c *taub, c *work, int *lwork, int *info) nogil:
    _fortran_cggrqf(m, p, n, a, lda, taua, b, ldb, taub, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cggsvd "F_FUNC(cggsvd,CGGSVD)"(char *jobu, char *jobv, char *jobq, int *m, int *n, int *p, int *k, int *l, c *a, int *lda, c *b, int *ldb, s *alpha, s *beta, c *u, int *ldu, c *v, int *ldv, c *q, int *ldq, c *work, s *rwork, int *iwork, int *info) nogil
cdef void cggsvd(char *jobu, char *jobv, char *jobq, int *m, int *n, int *p, int *k, int *l, c *a, int *lda, c *b, int *ldb, s *alpha, s *beta, c *u, int *ldu, c *v, int *ldv, c *q, int *ldq, c *work, s *rwork, int *iwork, int *info) nogil:
    _fortran_cggsvd(jobu, jobv, jobq, m, n, p, k, l, a, lda, b, ldb, alpha, beta, u, ldu, v, ldv, q, ldq, work, rwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cggsvp "F_FUNC(cggsvp,CGGSVP)"(char *jobu, char *jobv, char *jobq, int *m, int *p, int *n, c *a, int *lda, c *b, int *ldb, s *tola, s *tolb, int *k, int *l, c *u, int *ldu, c *v, int *ldv, c *q, int *ldq, int *iwork, s *rwork, c *tau, c *work, int *info) nogil
cdef void cggsvp(char *jobu, char *jobv, char *jobq, int *m, int *p, int *n, c *a, int *lda, c *b, int *ldb, s *tola, s *tolb, int *k, int *l, c *u, int *ldu, c *v, int *ldv, c *q, int *ldq, int *iwork, s *rwork, c *tau, c *work, int *info) nogil:
    _fortran_cggsvp(jobu, jobv, jobq, m, p, n, a, lda, b, ldb, tola, tolb, k, l, u, ldu, v, ldv, q, ldq, iwork, rwork, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgtcon "F_FUNC(cgtcon,CGTCON)"(char *norm, int *n, c *dl, c *d, c *du, c *du2, int *ipiv, s *anorm, s *rcond, c *work, int *info) nogil
cdef void cgtcon(char *norm, int *n, c *dl, c *d, c *du, c *du2, int *ipiv, s *anorm, s *rcond, c *work, int *info) nogil:
    _fortran_cgtcon(norm, n, dl, d, du, du2, ipiv, anorm, rcond, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgtrfs "F_FUNC(cgtrfs,CGTRFS)"(char *trans, int *n, int *nrhs, c *dl, c *d, c *du, c *dlf, c *df, c *duf, c *du2, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void cgtrfs(char *trans, int *n, int *nrhs, c *dl, c *d, c *du, c *dlf, c *df, c *duf, c *du2, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_cgtrfs(trans, n, nrhs, dl, d, du, dlf, df, duf, du2, ipiv, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgtsv "F_FUNC(cgtsv,CGTSV)"(int *n, int *nrhs, c *dl, c *d, c *du, c *b, int *ldb, int *info) nogil
cdef void cgtsv(int *n, int *nrhs, c *dl, c *d, c *du, c *b, int *ldb, int *info) nogil:
    _fortran_cgtsv(n, nrhs, dl, d, du, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgtsvx "F_FUNC(cgtsvx,CGTSVX)"(char *fact, char *trans, int *n, int *nrhs, c *dl, c *d, c *du, c *dlf, c *df, c *duf, c *du2, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void cgtsvx(char *fact, char *trans, int *n, int *nrhs, c *dl, c *d, c *du, c *dlf, c *df, c *duf, c *du2, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_cgtsvx(fact, trans, n, nrhs, dl, d, du, dlf, df, duf, du2, ipiv, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgttrf "F_FUNC(cgttrf,CGTTRF)"(int *n, c *dl, c *d, c *du, c *du2, int *ipiv, int *info) nogil
cdef void cgttrf(int *n, c *dl, c *d, c *du, c *du2, int *ipiv, int *info) nogil:
    _fortran_cgttrf(n, dl, d, du, du2, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgttrs "F_FUNC(cgttrs,CGTTRS)"(char *trans, int *n, int *nrhs, c *dl, c *d, c *du, c *du2, int *ipiv, c *b, int *ldb, int *info) nogil
cdef void cgttrs(char *trans, int *n, int *nrhs, c *dl, c *d, c *du, c *du2, int *ipiv, c *b, int *ldb, int *info) nogil:
    _fortran_cgttrs(trans, n, nrhs, dl, d, du, du2, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cgtts2 "F_FUNC(cgtts2,CGTTS2)"(int *itrans, int *n, int *nrhs, c *dl, c *d, c *du, c *du2, int *ipiv, c *b, int *ldb) nogil
cdef void cgtts2(int *itrans, int *n, int *nrhs, c *dl, c *d, c *du, c *du2, int *ipiv, c *b, int *ldb) nogil:
    _fortran_cgtts2(itrans, n, nrhs, dl, d, du, du2, ipiv, b, ldb)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chbev "F_FUNC(chbev,CHBEV)"(char *jobz, char *uplo, int *n, int *kd, c *ab, int *ldab, s *w, c *z, int *ldz, c *work, s *rwork, int *info) nogil
cdef void chbev(char *jobz, char *uplo, int *n, int *kd, c *ab, int *ldab, s *w, c *z, int *ldz, c *work, s *rwork, int *info) nogil:
    _fortran_chbev(jobz, uplo, n, kd, ab, ldab, w, z, ldz, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chbevd "F_FUNC(chbevd,CHBEVD)"(char *jobz, char *uplo, int *n, int *kd, c *ab, int *ldab, s *w, c *z, int *ldz, c *work, int *lwork, s *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil
cdef void chbevd(char *jobz, char *uplo, int *n, int *kd, c *ab, int *ldab, s *w, c *z, int *ldz, c *work, int *lwork, s *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_chbevd(jobz, uplo, n, kd, ab, ldab, w, z, ldz, work, lwork, rwork, lrwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chbevx "F_FUNC(chbevx,CHBEVX)"(char *jobz, char *range, char *uplo, int *n, int *kd, c *ab, int *ldab, c *q, int *ldq, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, c *z, int *ldz, c *work, s *rwork, int *iwork, int *ifail, int *info) nogil
cdef void chbevx(char *jobz, char *range, char *uplo, int *n, int *kd, c *ab, int *ldab, c *q, int *ldq, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, c *z, int *ldz, c *work, s *rwork, int *iwork, int *ifail, int *info) nogil:
    _fortran_chbevx(jobz, range, uplo, n, kd, ab, ldab, q, ldq, vl, vu, il, iu, abstol, m, w, z, ldz, work, rwork, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chbgst "F_FUNC(chbgst,CHBGST)"(char *vect, char *uplo, int *n, int *ka, int *kb, c *ab, int *ldab, c *bb, int *ldbb, c *x, int *ldx, c *work, s *rwork, int *info) nogil
cdef void chbgst(char *vect, char *uplo, int *n, int *ka, int *kb, c *ab, int *ldab, c *bb, int *ldbb, c *x, int *ldx, c *work, s *rwork, int *info) nogil:
    _fortran_chbgst(vect, uplo, n, ka, kb, ab, ldab, bb, ldbb, x, ldx, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chbgv "F_FUNC(chbgv,CHBGV)"(char *jobz, char *uplo, int *n, int *ka, int *kb, c *ab, int *ldab, c *bb, int *ldbb, s *w, c *z, int *ldz, c *work, s *rwork, int *info) nogil
cdef void chbgv(char *jobz, char *uplo, int *n, int *ka, int *kb, c *ab, int *ldab, c *bb, int *ldbb, s *w, c *z, int *ldz, c *work, s *rwork, int *info) nogil:
    _fortran_chbgv(jobz, uplo, n, ka, kb, ab, ldab, bb, ldbb, w, z, ldz, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chbgvd "F_FUNC(chbgvd,CHBGVD)"(char *jobz, char *uplo, int *n, int *ka, int *kb, c *ab, int *ldab, c *bb, int *ldbb, s *w, c *z, int *ldz, c *work, int *lwork, s *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil
cdef void chbgvd(char *jobz, char *uplo, int *n, int *ka, int *kb, c *ab, int *ldab, c *bb, int *ldbb, s *w, c *z, int *ldz, c *work, int *lwork, s *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_chbgvd(jobz, uplo, n, ka, kb, ab, ldab, bb, ldbb, w, z, ldz, work, lwork, rwork, lrwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chbgvx "F_FUNC(chbgvx,CHBGVX)"(char *jobz, char *range, char *uplo, int *n, int *ka, int *kb, c *ab, int *ldab, c *bb, int *ldbb, c *q, int *ldq, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, c *z, int *ldz, c *work, s *rwork, int *iwork, int *ifail, int *info) nogil
cdef void chbgvx(char *jobz, char *range, char *uplo, int *n, int *ka, int *kb, c *ab, int *ldab, c *bb, int *ldbb, c *q, int *ldq, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, c *z, int *ldz, c *work, s *rwork, int *iwork, int *ifail, int *info) nogil:
    _fortran_chbgvx(jobz, range, uplo, n, ka, kb, ab, ldab, bb, ldbb, q, ldq, vl, vu, il, iu, abstol, m, w, z, ldz, work, rwork, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chbtrd "F_FUNC(chbtrd,CHBTRD)"(char *vect, char *uplo, int *n, int *kd, c *ab, int *ldab, s *d, s *e, c *q, int *ldq, c *work, int *info) nogil
cdef void chbtrd(char *vect, char *uplo, int *n, int *kd, c *ab, int *ldab, s *d, s *e, c *q, int *ldq, c *work, int *info) nogil:
    _fortran_chbtrd(vect, uplo, n, kd, ab, ldab, d, e, q, ldq, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_checon "F_FUNC(checon,CHECON)"(char *uplo, int *n, c *a, int *lda, int *ipiv, s *anorm, s *rcond, c *work, int *info) nogil
cdef void checon(char *uplo, int *n, c *a, int *lda, int *ipiv, s *anorm, s *rcond, c *work, int *info) nogil:
    _fortran_checon(uplo, n, a, lda, ipiv, anorm, rcond, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cheev "F_FUNC(cheev,CHEEV)"(char *jobz, char *uplo, int *n, c *a, int *lda, s *w, c *work, int *lwork, s *rwork, int *info) nogil
cdef void cheev(char *jobz, char *uplo, int *n, c *a, int *lda, s *w, c *work, int *lwork, s *rwork, int *info) nogil:
    _fortran_cheev(jobz, uplo, n, a, lda, w, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cheevd "F_FUNC(cheevd,CHEEVD)"(char *jobz, char *uplo, int *n, c *a, int *lda, s *w, c *work, int *lwork, s *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil
cdef void cheevd(char *jobz, char *uplo, int *n, c *a, int *lda, s *w, c *work, int *lwork, s *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_cheevd(jobz, uplo, n, a, lda, w, work, lwork, rwork, lrwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cheevr "F_FUNC(cheevr,CHEEVR)"(char *jobz, char *range, char *uplo, int *n, c *a, int *lda, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, c *z, int *ldz, int *isuppz, c *work, int *lwork, s *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil
cdef void cheevr(char *jobz, char *range, char *uplo, int *n, c *a, int *lda, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, c *z, int *ldz, int *isuppz, c *work, int *lwork, s *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_cheevr(jobz, range, uplo, n, a, lda, vl, vu, il, iu, abstol, m, w, z, ldz, isuppz, work, lwork, rwork, lrwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cheevx "F_FUNC(cheevx,CHEEVX)"(char *jobz, char *range, char *uplo, int *n, c *a, int *lda, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, c *z, int *ldz, c *work, int *lwork, s *rwork, int *iwork, int *ifail, int *info) nogil
cdef void cheevx(char *jobz, char *range, char *uplo, int *n, c *a, int *lda, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, c *z, int *ldz, c *work, int *lwork, s *rwork, int *iwork, int *ifail, int *info) nogil:
    _fortran_cheevx(jobz, range, uplo, n, a, lda, vl, vu, il, iu, abstol, m, w, z, ldz, work, lwork, rwork, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chegs2 "F_FUNC(chegs2,CHEGS2)"(int *itype, char *uplo, int *n, c *a, int *lda, c *b, int *ldb, int *info) nogil
cdef void chegs2(int *itype, char *uplo, int *n, c *a, int *lda, c *b, int *ldb, int *info) nogil:
    _fortran_chegs2(itype, uplo, n, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chegst "F_FUNC(chegst,CHEGST)"(int *itype, char *uplo, int *n, c *a, int *lda, c *b, int *ldb, int *info) nogil
cdef void chegst(int *itype, char *uplo, int *n, c *a, int *lda, c *b, int *ldb, int *info) nogil:
    _fortran_chegst(itype, uplo, n, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chegv "F_FUNC(chegv,CHEGV)"(int *itype, char *jobz, char *uplo, int *n, c *a, int *lda, c *b, int *ldb, s *w, c *work, int *lwork, s *rwork, int *info) nogil
cdef void chegv(int *itype, char *jobz, char *uplo, int *n, c *a, int *lda, c *b, int *ldb, s *w, c *work, int *lwork, s *rwork, int *info) nogil:
    _fortran_chegv(itype, jobz, uplo, n, a, lda, b, ldb, w, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chegvd "F_FUNC(chegvd,CHEGVD)"(int *itype, char *jobz, char *uplo, int *n, c *a, int *lda, c *b, int *ldb, s *w, c *work, int *lwork, s *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil
cdef void chegvd(int *itype, char *jobz, char *uplo, int *n, c *a, int *lda, c *b, int *ldb, s *w, c *work, int *lwork, s *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_chegvd(itype, jobz, uplo, n, a, lda, b, ldb, w, work, lwork, rwork, lrwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chegvx "F_FUNC(chegvx,CHEGVX)"(int *itype, char *jobz, char *range, char *uplo, int *n, c *a, int *lda, c *b, int *ldb, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, c *z, int *ldz, c *work, int *lwork, s *rwork, int *iwork, int *ifail, int *info) nogil
cdef void chegvx(int *itype, char *jobz, char *range, char *uplo, int *n, c *a, int *lda, c *b, int *ldb, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, c *z, int *ldz, c *work, int *lwork, s *rwork, int *iwork, int *ifail, int *info) nogil:
    _fortran_chegvx(itype, jobz, range, uplo, n, a, lda, b, ldb, vl, vu, il, iu, abstol, m, w, z, ldz, work, lwork, rwork, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cherfs "F_FUNC(cherfs,CHERFS)"(char *uplo, int *n, int *nrhs, c *a, int *lda, c *af, int *ldaf, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void cherfs(char *uplo, int *n, int *nrhs, c *a, int *lda, c *af, int *ldaf, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_cherfs(uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chesv "F_FUNC(chesv,CHESV)"(char *uplo, int *n, int *nrhs, c *a, int *lda, int *ipiv, c *b, int *ldb, c *work, int *lwork, int *info) nogil
cdef void chesv(char *uplo, int *n, int *nrhs, c *a, int *lda, int *ipiv, c *b, int *ldb, c *work, int *lwork, int *info) nogil:
    _fortran_chesv(uplo, n, nrhs, a, lda, ipiv, b, ldb, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chesvx "F_FUNC(chesvx,CHESVX)"(char *fact, char *uplo, int *n, int *nrhs, c *a, int *lda, c *af, int *ldaf, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, int *lwork, s *rwork, int *info) nogil
cdef void chesvx(char *fact, char *uplo, int *n, int *nrhs, c *a, int *lda, c *af, int *ldaf, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, int *lwork, s *rwork, int *info) nogil:
    _fortran_chesvx(fact, uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb, x, ldx, rcond, ferr, berr, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chetd2 "F_FUNC(chetd2,CHETD2)"(char *uplo, int *n, c *a, int *lda, s *d, s *e, c *tau, int *info) nogil
cdef void chetd2(char *uplo, int *n, c *a, int *lda, s *d, s *e, c *tau, int *info) nogil:
    _fortran_chetd2(uplo, n, a, lda, d, e, tau, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chetf2 "F_FUNC(chetf2,CHETF2)"(char *uplo, int *n, c *a, int *lda, int *ipiv, int *info) nogil
cdef void chetf2(char *uplo, int *n, c *a, int *lda, int *ipiv, int *info) nogil:
    _fortran_chetf2(uplo, n, a, lda, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chetrd "F_FUNC(chetrd,CHETRD)"(char *uplo, int *n, c *a, int *lda, s *d, s *e, c *tau, c *work, int *lwork, int *info) nogil
cdef void chetrd(char *uplo, int *n, c *a, int *lda, s *d, s *e, c *tau, c *work, int *lwork, int *info) nogil:
    _fortran_chetrd(uplo, n, a, lda, d, e, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chetrf "F_FUNC(chetrf,CHETRF)"(char *uplo, int *n, c *a, int *lda, int *ipiv, c *work, int *lwork, int *info) nogil
cdef void chetrf(char *uplo, int *n, c *a, int *lda, int *ipiv, c *work, int *lwork, int *info) nogil:
    _fortran_chetrf(uplo, n, a, lda, ipiv, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chetri "F_FUNC(chetri,CHETRI)"(char *uplo, int *n, c *a, int *lda, int *ipiv, c *work, int *info) nogil
cdef void chetri(char *uplo, int *n, c *a, int *lda, int *ipiv, c *work, int *info) nogil:
    _fortran_chetri(uplo, n, a, lda, ipiv, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chetrs "F_FUNC(chetrs,CHETRS)"(char *uplo, int *n, int *nrhs, c *a, int *lda, int *ipiv, c *b, int *ldb, int *info) nogil
cdef void chetrs(char *uplo, int *n, int *nrhs, c *a, int *lda, int *ipiv, c *b, int *ldb, int *info) nogil:
    _fortran_chetrs(uplo, n, nrhs, a, lda, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chgeqz "F_FUNC(chgeqz,CHGEQZ)"(char *job, char *compq, char *compz, int *n, int *ilo, int *ihi, c *h, int *ldh, c *t, int *ldt, c *alpha, c *beta, c *q, int *ldq, c *z, int *ldz, c *work, int *lwork, s *rwork, int *info) nogil
cdef void chgeqz(char *job, char *compq, char *compz, int *n, int *ilo, int *ihi, c *h, int *ldh, c *t, int *ldt, c *alpha, c *beta, c *q, int *ldq, c *z, int *ldz, c *work, int *lwork, s *rwork, int *info) nogil:
    _fortran_chgeqz(job, compq, compz, n, ilo, ihi, h, ldh, t, ldt, alpha, beta, q, ldq, z, ldz, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chpcon "F_FUNC(chpcon,CHPCON)"(char *uplo, int *n, c *ap, int *ipiv, s *anorm, s *rcond, c *work, int *info) nogil
cdef void chpcon(char *uplo, int *n, c *ap, int *ipiv, s *anorm, s *rcond, c *work, int *info) nogil:
    _fortran_chpcon(uplo, n, ap, ipiv, anorm, rcond, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chpev "F_FUNC(chpev,CHPEV)"(char *jobz, char *uplo, int *n, c *ap, s *w, c *z, int *ldz, c *work, s *rwork, int *info) nogil
cdef void chpev(char *jobz, char *uplo, int *n, c *ap, s *w, c *z, int *ldz, c *work, s *rwork, int *info) nogil:
    _fortran_chpev(jobz, uplo, n, ap, w, z, ldz, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chpevd "F_FUNC(chpevd,CHPEVD)"(char *jobz, char *uplo, int *n, c *ap, s *w, c *z, int *ldz, c *work, int *lwork, s *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil
cdef void chpevd(char *jobz, char *uplo, int *n, c *ap, s *w, c *z, int *ldz, c *work, int *lwork, s *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_chpevd(jobz, uplo, n, ap, w, z, ldz, work, lwork, rwork, lrwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chpevx "F_FUNC(chpevx,CHPEVX)"(char *jobz, char *range, char *uplo, int *n, c *ap, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, c *z, int *ldz, c *work, s *rwork, int *iwork, int *ifail, int *info) nogil
cdef void chpevx(char *jobz, char *range, char *uplo, int *n, c *ap, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, c *z, int *ldz, c *work, s *rwork, int *iwork, int *ifail, int *info) nogil:
    _fortran_chpevx(jobz, range, uplo, n, ap, vl, vu, il, iu, abstol, m, w, z, ldz, work, rwork, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chpgst "F_FUNC(chpgst,CHPGST)"(int *itype, char *uplo, int *n, c *ap, c *bp, int *info) nogil
cdef void chpgst(int *itype, char *uplo, int *n, c *ap, c *bp, int *info) nogil:
    _fortran_chpgst(itype, uplo, n, ap, bp, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chpgv "F_FUNC(chpgv,CHPGV)"(int *itype, char *jobz, char *uplo, int *n, c *ap, c *bp, s *w, c *z, int *ldz, c *work, s *rwork, int *info) nogil
cdef void chpgv(int *itype, char *jobz, char *uplo, int *n, c *ap, c *bp, s *w, c *z, int *ldz, c *work, s *rwork, int *info) nogil:
    _fortran_chpgv(itype, jobz, uplo, n, ap, bp, w, z, ldz, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chpgvd "F_FUNC(chpgvd,CHPGVD)"(int *itype, char *jobz, char *uplo, int *n, c *ap, c *bp, s *w, c *z, int *ldz, c *work, int *lwork, s *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil
cdef void chpgvd(int *itype, char *jobz, char *uplo, int *n, c *ap, c *bp, s *w, c *z, int *ldz, c *work, int *lwork, s *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_chpgvd(itype, jobz, uplo, n, ap, bp, w, z, ldz, work, lwork, rwork, lrwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chpgvx "F_FUNC(chpgvx,CHPGVX)"(int *itype, char *jobz, char *range, char *uplo, int *n, c *ap, c *bp, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, c *z, int *ldz, c *work, s *rwork, int *iwork, int *ifail, int *info) nogil
cdef void chpgvx(int *itype, char *jobz, char *range, char *uplo, int *n, c *ap, c *bp, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, c *z, int *ldz, c *work, s *rwork, int *iwork, int *ifail, int *info) nogil:
    _fortran_chpgvx(itype, jobz, range, uplo, n, ap, bp, vl, vu, il, iu, abstol, m, w, z, ldz, work, rwork, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chprfs "F_FUNC(chprfs,CHPRFS)"(char *uplo, int *n, int *nrhs, c *ap, c *afp, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void chprfs(char *uplo, int *n, int *nrhs, c *ap, c *afp, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_chprfs(uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chpsv "F_FUNC(chpsv,CHPSV)"(char *uplo, int *n, int *nrhs, c *ap, int *ipiv, c *b, int *ldb, int *info) nogil
cdef void chpsv(char *uplo, int *n, int *nrhs, c *ap, int *ipiv, c *b, int *ldb, int *info) nogil:
    _fortran_chpsv(uplo, n, nrhs, ap, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chpsvx "F_FUNC(chpsvx,CHPSVX)"(char *fact, char *uplo, int *n, int *nrhs, c *ap, c *afp, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void chpsvx(char *fact, char *uplo, int *n, int *nrhs, c *ap, c *afp, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_chpsvx(fact, uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chptrd "F_FUNC(chptrd,CHPTRD)"(char *uplo, int *n, c *ap, s *d, s *e, c *tau, int *info) nogil
cdef void chptrd(char *uplo, int *n, c *ap, s *d, s *e, c *tau, int *info) nogil:
    _fortran_chptrd(uplo, n, ap, d, e, tau, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chptrf "F_FUNC(chptrf,CHPTRF)"(char *uplo, int *n, c *ap, int *ipiv, int *info) nogil
cdef void chptrf(char *uplo, int *n, c *ap, int *ipiv, int *info) nogil:
    _fortran_chptrf(uplo, n, ap, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chptri "F_FUNC(chptri,CHPTRI)"(char *uplo, int *n, c *ap, int *ipiv, c *work, int *info) nogil
cdef void chptri(char *uplo, int *n, c *ap, int *ipiv, c *work, int *info) nogil:
    _fortran_chptri(uplo, n, ap, ipiv, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chptrs "F_FUNC(chptrs,CHPTRS)"(char *uplo, int *n, int *nrhs, c *ap, int *ipiv, c *b, int *ldb, int *info) nogil
cdef void chptrs(char *uplo, int *n, int *nrhs, c *ap, int *ipiv, c *b, int *ldb, int *info) nogil:
    _fortran_chptrs(uplo, n, nrhs, ap, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chsein "F_FUNC(chsein,CHSEIN)"(char *side, char *eigsrc, char *initv, bint *select, int *n, c *h, int *ldh, c *w, c *vl, int *ldvl, c *vr, int *ldvr, int *mm, int *m, c *work, s *rwork, int *ifaill, int *ifailr, int *info) nogil
cdef void chsein(char *side, char *eigsrc, char *initv, bint *select, int *n, c *h, int *ldh, c *w, c *vl, int *ldvl, c *vr, int *ldvr, int *mm, int *m, c *work, s *rwork, int *ifaill, int *ifailr, int *info) nogil:
    _fortran_chsein(side, eigsrc, initv, select, n, h, ldh, w, vl, ldvl, vr, ldvr, mm, m, work, rwork, ifaill, ifailr, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_chseqr "F_FUNC(chseqr,CHSEQR)"(char *job, char *compz, int *n, int *ilo, int *ihi, c *h, int *ldh, c *w, c *z, int *ldz, c *work, int *lwork, int *info) nogil
cdef void chseqr(char *job, char *compz, int *n, int *ilo, int *ihi, c *h, int *ldh, c *w, c *z, int *ldz, c *work, int *lwork, int *info) nogil:
    _fortran_chseqr(job, compz, n, ilo, ihi, h, ldh, w, z, ldz, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_clacn2 "F_FUNC(clacn2,CLACN2)"(int *n, c *v, c *x, s *est, int *kase, int *isave) nogil
cdef void clacn2(int *n, c *v, c *x, s *est, int *kase, int *isave) nogil:
    _fortran_clacn2(n, v, x, est, kase, isave)

cdef extern from "_lapack_subroutines.h":
    void _fortran_clacon "F_FUNC(clacon,CLACON)"(int *n, c *v, c *x, s *est, int *kase) nogil
cdef void clacon(int *n, c *v, c *x, s *est, int *kase) nogil:
    _fortran_clacon(n, v, x, est, kase)

cdef extern from "_lapack_subroutines.h":
    void _fortran_clarf "F_FUNC(clarf,CLARF)"(char *side, int *m, int *n, c *v, int *incv, c *tau, c *c, int *ldc, c *work) nogil
cdef void clarf(char *side, int *m, int *n, c *v, int *incv, c *tau, c *c, int *ldc, c *work) nogil:
    _fortran_clarf(side, m, n, v, incv, tau, c, ldc, work)

cdef extern from "_lapack_subroutines.h":
    void _fortran_clarz "F_FUNC(clarz,CLARZ)"(char *side, int *m, int *n, int *l, c *v, int *incv, c *tau, c *c, int *ldc, c *work) nogil
cdef void clarz(char *side, int *m, int *n, int *l, c *v, int *incv, c *tau, c *c, int *ldc, c *work) nogil:
    _fortran_clarz(side, m, n, l, v, incv, tau, c, ldc, work)

cdef extern from "_lapack_subroutines.h":
    void _fortran_claswp "F_FUNC(claswp,CLASWP)"(int *n, c *a, int *lda, int *k1, int *k2, int *ipiv, int *incx) nogil
cdef void claswp(int *n, c *a, int *lda, int *k1, int *k2, int *ipiv, int *incx) nogil:
    _fortran_claswp(n, a, lda, k1, k2, ipiv, incx)

cdef extern from "_lapack_subroutines.h":
    void _fortran_clauum "F_FUNC(clauum,CLAUUM)"(char *uplo, int *n, c *a, int *lda, int *info) nogil
cdef void clauum(char *uplo, int *n, c *a, int *lda, int *info) nogil:
    _fortran_clauum(uplo, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpbcon "F_FUNC(cpbcon,CPBCON)"(char *uplo, int *n, int *kd, c *ab, int *ldab, s *anorm, s *rcond, c *work, s *rwork, int *info) nogil
cdef void cpbcon(char *uplo, int *n, int *kd, c *ab, int *ldab, s *anorm, s *rcond, c *work, s *rwork, int *info) nogil:
    _fortran_cpbcon(uplo, n, kd, ab, ldab, anorm, rcond, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpbequ "F_FUNC(cpbequ,CPBEQU)"(char *uplo, int *n, int *kd, c *ab, int *ldab, s *s, s *scond, s *amax, int *info) nogil
cdef void cpbequ(char *uplo, int *n, int *kd, c *ab, int *ldab, s *s, s *scond, s *amax, int *info) nogil:
    _fortran_cpbequ(uplo, n, kd, ab, ldab, s, scond, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpbrfs "F_FUNC(cpbrfs,CPBRFS)"(char *uplo, int *n, int *kd, int *nrhs, c *ab, int *ldab, c *afb, int *ldafb, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void cpbrfs(char *uplo, int *n, int *kd, int *nrhs, c *ab, int *ldab, c *afb, int *ldafb, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_cpbrfs(uplo, n, kd, nrhs, ab, ldab, afb, ldafb, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpbstf "F_FUNC(cpbstf,CPBSTF)"(char *uplo, int *n, int *kd, c *ab, int *ldab, int *info) nogil
cdef void cpbstf(char *uplo, int *n, int *kd, c *ab, int *ldab, int *info) nogil:
    _fortran_cpbstf(uplo, n, kd, ab, ldab, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpbsv "F_FUNC(cpbsv,CPBSV)"(char *uplo, int *n, int *kd, int *nrhs, c *ab, int *ldab, c *b, int *ldb, int *info) nogil
cdef void cpbsv(char *uplo, int *n, int *kd, int *nrhs, c *ab, int *ldab, c *b, int *ldb, int *info) nogil:
    _fortran_cpbsv(uplo, n, kd, nrhs, ab, ldab, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpbsvx "F_FUNC(cpbsvx,CPBSVX)"(char *fact, char *uplo, int *n, int *kd, int *nrhs, c *ab, int *ldab, c *afb, int *ldafb, char *equed, s *s, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void cpbsvx(char *fact, char *uplo, int *n, int *kd, int *nrhs, c *ab, int *ldab, c *afb, int *ldafb, char *equed, s *s, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_cpbsvx(fact, uplo, n, kd, nrhs, ab, ldab, afb, ldafb, equed, s, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpbtf2 "F_FUNC(cpbtf2,CPBTF2)"(char *uplo, int *n, int *kd, c *ab, int *ldab, int *info) nogil
cdef void cpbtf2(char *uplo, int *n, int *kd, c *ab, int *ldab, int *info) nogil:
    _fortran_cpbtf2(uplo, n, kd, ab, ldab, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpbtrf "F_FUNC(cpbtrf,CPBTRF)"(char *uplo, int *n, int *kd, c *ab, int *ldab, int *info) nogil
cdef void cpbtrf(char *uplo, int *n, int *kd, c *ab, int *ldab, int *info) nogil:
    _fortran_cpbtrf(uplo, n, kd, ab, ldab, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpbtrs "F_FUNC(cpbtrs,CPBTRS)"(char *uplo, int *n, int *kd, int *nrhs, c *ab, int *ldab, c *b, int *ldb, int *info) nogil
cdef void cpbtrs(char *uplo, int *n, int *kd, int *nrhs, c *ab, int *ldab, c *b, int *ldb, int *info) nogil:
    _fortran_cpbtrs(uplo, n, kd, nrhs, ab, ldab, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpocon "F_FUNC(cpocon,CPOCON)"(char *uplo, int *n, c *a, int *lda, s *anorm, s *rcond, c *work, s *rwork, int *info) nogil
cdef void cpocon(char *uplo, int *n, c *a, int *lda, s *anorm, s *rcond, c *work, s *rwork, int *info) nogil:
    _fortran_cpocon(uplo, n, a, lda, anorm, rcond, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpoequ "F_FUNC(cpoequ,CPOEQU)"(int *n, c *a, int *lda, s *s, s *scond, s *amax, int *info) nogil
cdef void cpoequ(int *n, c *a, int *lda, s *s, s *scond, s *amax, int *info) nogil:
    _fortran_cpoequ(n, a, lda, s, scond, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cporfs "F_FUNC(cporfs,CPORFS)"(char *uplo, int *n, int *nrhs, c *a, int *lda, c *af, int *ldaf, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void cporfs(char *uplo, int *n, int *nrhs, c *a, int *lda, c *af, int *ldaf, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_cporfs(uplo, n, nrhs, a, lda, af, ldaf, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cposv "F_FUNC(cposv,CPOSV)"(char *uplo, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, int *info) nogil
cdef void cposv(char *uplo, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, int *info) nogil:
    _fortran_cposv(uplo, n, nrhs, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cposvx "F_FUNC(cposvx,CPOSVX)"(char *fact, char *uplo, int *n, int *nrhs, c *a, int *lda, c *af, int *ldaf, char *equed, s *s, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void cposvx(char *fact, char *uplo, int *n, int *nrhs, c *a, int *lda, c *af, int *ldaf, char *equed, s *s, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_cposvx(fact, uplo, n, nrhs, a, lda, af, ldaf, equed, s, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpotf2 "F_FUNC(cpotf2,CPOTF2)"(char *uplo, int *n, c *a, int *lda, int *info) nogil
cdef void cpotf2(char *uplo, int *n, c *a, int *lda, int *info) nogil:
    _fortran_cpotf2(uplo, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpotrf "F_FUNC(cpotrf,CPOTRF)"(char *uplo, int *n, c *a, int *lda, int *info) nogil
cdef void cpotrf(char *uplo, int *n, c *a, int *lda, int *info) nogil:
    _fortran_cpotrf(uplo, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpotri "F_FUNC(cpotri,CPOTRI)"(char *uplo, int *n, c *a, int *lda, int *info) nogil
cdef void cpotri(char *uplo, int *n, c *a, int *lda, int *info) nogil:
    _fortran_cpotri(uplo, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpotrs "F_FUNC(cpotrs,CPOTRS)"(char *uplo, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, int *info) nogil
cdef void cpotrs(char *uplo, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, int *info) nogil:
    _fortran_cpotrs(uplo, n, nrhs, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cppcon "F_FUNC(cppcon,CPPCON)"(char *uplo, int *n, c *ap, s *anorm, s *rcond, c *work, s *rwork, int *info) nogil
cdef void cppcon(char *uplo, int *n, c *ap, s *anorm, s *rcond, c *work, s *rwork, int *info) nogil:
    _fortran_cppcon(uplo, n, ap, anorm, rcond, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cppequ "F_FUNC(cppequ,CPPEQU)"(char *uplo, int *n, c *ap, s *s, s *scond, s *amax, int *info) nogil
cdef void cppequ(char *uplo, int *n, c *ap, s *s, s *scond, s *amax, int *info) nogil:
    _fortran_cppequ(uplo, n, ap, s, scond, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpprfs "F_FUNC(cpprfs,CPPRFS)"(char *uplo, int *n, int *nrhs, c *ap, c *afp, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void cpprfs(char *uplo, int *n, int *nrhs, c *ap, c *afp, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_cpprfs(uplo, n, nrhs, ap, afp, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cppsv "F_FUNC(cppsv,CPPSV)"(char *uplo, int *n, int *nrhs, c *ap, c *b, int *ldb, int *info) nogil
cdef void cppsv(char *uplo, int *n, int *nrhs, c *ap, c *b, int *ldb, int *info) nogil:
    _fortran_cppsv(uplo, n, nrhs, ap, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cppsvx "F_FUNC(cppsvx,CPPSVX)"(char *fact, char *uplo, int *n, int *nrhs, c *ap, c *afp, char *equed, s *s, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void cppsvx(char *fact, char *uplo, int *n, int *nrhs, c *ap, c *afp, char *equed, s *s, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_cppsvx(fact, uplo, n, nrhs, ap, afp, equed, s, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpptrf "F_FUNC(cpptrf,CPPTRF)"(char *uplo, int *n, c *ap, int *info) nogil
cdef void cpptrf(char *uplo, int *n, c *ap, int *info) nogil:
    _fortran_cpptrf(uplo, n, ap, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpptri "F_FUNC(cpptri,CPPTRI)"(char *uplo, int *n, c *ap, int *info) nogil
cdef void cpptri(char *uplo, int *n, c *ap, int *info) nogil:
    _fortran_cpptri(uplo, n, ap, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpptrs "F_FUNC(cpptrs,CPPTRS)"(char *uplo, int *n, int *nrhs, c *ap, c *b, int *ldb, int *info) nogil
cdef void cpptrs(char *uplo, int *n, int *nrhs, c *ap, c *b, int *ldb, int *info) nogil:
    _fortran_cpptrs(uplo, n, nrhs, ap, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cptcon "F_FUNC(cptcon,CPTCON)"(int *n, s *d, c *e, s *anorm, s *rcond, s *rwork, int *info) nogil
cdef void cptcon(int *n, s *d, c *e, s *anorm, s *rcond, s *rwork, int *info) nogil:
    _fortran_cptcon(n, d, e, anorm, rcond, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpteqr "F_FUNC(cpteqr,CPTEQR)"(char *compz, int *n, s *d, s *e, c *z, int *ldz, s *work, int *info) nogil
cdef void cpteqr(char *compz, int *n, s *d, s *e, c *z, int *ldz, s *work, int *info) nogil:
    _fortran_cpteqr(compz, n, d, e, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cptrfs "F_FUNC(cptrfs,CPTRFS)"(char *uplo, int *n, int *nrhs, s *d, c *e, s *df, c *ef, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void cptrfs(char *uplo, int *n, int *nrhs, s *d, c *e, s *df, c *ef, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_cptrfs(uplo, n, nrhs, d, e, df, ef, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cptsv "F_FUNC(cptsv,CPTSV)"(int *n, int *nrhs, s *d, c *e, c *b, int *ldb, int *info) nogil
cdef void cptsv(int *n, int *nrhs, s *d, c *e, c *b, int *ldb, int *info) nogil:
    _fortran_cptsv(n, nrhs, d, e, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cptsvx "F_FUNC(cptsvx,CPTSVX)"(char *fact, int *n, int *nrhs, s *d, c *e, s *df, c *ef, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void cptsvx(char *fact, int *n, int *nrhs, s *d, c *e, s *df, c *ef, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_cptsvx(fact, n, nrhs, d, e, df, ef, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpttrf "F_FUNC(cpttrf,CPTTRF)"(int *n, s *d, c *e, int *info) nogil
cdef void cpttrf(int *n, s *d, c *e, int *info) nogil:
    _fortran_cpttrf(n, d, e, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cpttrs "F_FUNC(cpttrs,CPTTRS)"(char *uplo, int *n, int *nrhs, s *d, c *e, c *b, int *ldb, int *info) nogil
cdef void cpttrs(char *uplo, int *n, int *nrhs, s *d, c *e, c *b, int *ldb, int *info) nogil:
    _fortran_cpttrs(uplo, n, nrhs, d, e, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cptts2 "F_FUNC(cptts2,CPTTS2)"(int *iuplo, int *n, int *nrhs, s *d, c *e, c *b, int *ldb) nogil
cdef void cptts2(int *iuplo, int *n, int *nrhs, s *d, c *e, c *b, int *ldb) nogil:
    _fortran_cptts2(iuplo, n, nrhs, d, e, b, ldb)

cdef extern from "_lapack_subroutines.h":
    void _fortran_crot "F_FUNC(crot,CROT)"(int *n, c *cx, int *incx, c *cy, int *incy, s *c, c *s) nogil
cdef void crot(int *n, c *cx, int *incx, c *cy, int *incy, s *c, c *s) nogil:
    _fortran_crot(n, cx, incx, cy, incy, c, s)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cspcon "F_FUNC(cspcon,CSPCON)"(char *uplo, int *n, c *ap, int *ipiv, s *anorm, s *rcond, c *work, int *info) nogil
cdef void cspcon(char *uplo, int *n, c *ap, int *ipiv, s *anorm, s *rcond, c *work, int *info) nogil:
    _fortran_cspcon(uplo, n, ap, ipiv, anorm, rcond, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cspmv "F_FUNC(cspmv,CSPMV)"(char *uplo, int *n, c *alpha, c *ap, c *x, int *incx, c *beta, c *y, int *incy) nogil
cdef void cspmv(char *uplo, int *n, c *alpha, c *ap, c *x, int *incx, c *beta, c *y, int *incy) nogil:
    _fortran_cspmv(uplo, n, alpha, ap, x, incx, beta, y, incy)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cspr "F_FUNC(cspr,CSPR)"(char *uplo, int *n, c *alpha, c *x, int *incx, c *ap) nogil
cdef void cspr(char *uplo, int *n, c *alpha, c *x, int *incx, c *ap) nogil:
    _fortran_cspr(uplo, n, alpha, x, incx, ap)

cdef extern from "_lapack_subroutines.h":
    void _fortran_csprfs "F_FUNC(csprfs,CSPRFS)"(char *uplo, int *n, int *nrhs, c *ap, c *afp, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void csprfs(char *uplo, int *n, int *nrhs, c *ap, c *afp, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_csprfs(uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cspsv "F_FUNC(cspsv,CSPSV)"(char *uplo, int *n, int *nrhs, c *ap, int *ipiv, c *b, int *ldb, int *info) nogil
cdef void cspsv(char *uplo, int *n, int *nrhs, c *ap, int *ipiv, c *b, int *ldb, int *info) nogil:
    _fortran_cspsv(uplo, n, nrhs, ap, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cspsvx "F_FUNC(cspsvx,CSPSVX)"(char *fact, char *uplo, int *n, int *nrhs, c *ap, c *afp, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void cspsvx(char *fact, char *uplo, int *n, int *nrhs, c *ap, c *afp, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_cspsvx(fact, uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_csptrf "F_FUNC(csptrf,CSPTRF)"(char *uplo, int *n, c *ap, int *ipiv, int *info) nogil
cdef void csptrf(char *uplo, int *n, c *ap, int *ipiv, int *info) nogil:
    _fortran_csptrf(uplo, n, ap, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_csptri "F_FUNC(csptri,CSPTRI)"(char *uplo, int *n, c *ap, int *ipiv, c *work, int *info) nogil
cdef void csptri(char *uplo, int *n, c *ap, int *ipiv, c *work, int *info) nogil:
    _fortran_csptri(uplo, n, ap, ipiv, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_csptrs "F_FUNC(csptrs,CSPTRS)"(char *uplo, int *n, int *nrhs, c *ap, int *ipiv, c *b, int *ldb, int *info) nogil
cdef void csptrs(char *uplo, int *n, int *nrhs, c *ap, int *ipiv, c *b, int *ldb, int *info) nogil:
    _fortran_csptrs(uplo, n, nrhs, ap, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_csrscl "F_FUNC(csrscl,CSRSCL)"(int *n, s *sa, c *sx, int *incx) nogil
cdef void csrscl(int *n, s *sa, c *sx, int *incx) nogil:
    _fortran_csrscl(n, sa, sx, incx)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cstedc "F_FUNC(cstedc,CSTEDC)"(char *compz, int *n, s *d, s *e, c *z, int *ldz, c *work, int *lwork, s *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil
cdef void cstedc(char *compz, int *n, s *d, s *e, c *z, int *ldz, c *work, int *lwork, s *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_cstedc(compz, n, d, e, z, ldz, work, lwork, rwork, lrwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cstegr "F_FUNC(cstegr,CSTEGR)"(char *jobz, char *range, int *n, s *d, s *e, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, c *z, int *ldz, int *isuppz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void cstegr(char *jobz, char *range, int *n, s *d, s *e, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, c *z, int *ldz, int *isuppz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_cstegr(jobz, range, n, d, e, vl, vu, il, iu, abstol, m, w, z, ldz, isuppz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cstein "F_FUNC(cstein,CSTEIN)"(int *n, s *d, s *e, int *m, s *w, int *iblock, int *isplit, c *z, int *ldz, s *work, int *iwork, int *ifail, int *info) nogil
cdef void cstein(int *n, s *d, s *e, int *m, s *w, int *iblock, int *isplit, c *z, int *ldz, s *work, int *iwork, int *ifail, int *info) nogil:
    _fortran_cstein(n, d, e, m, w, iblock, isplit, z, ldz, work, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cstemr "F_FUNC(cstemr,CSTEMR)"(char *jobz, char *range, int *n, s *d, s *e, s *vl, s *vu, int *il, int *iu, int *m, s *w, c *z, int *ldz, int *nzc, int *isuppz, bint *tryrac, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void cstemr(char *jobz, char *range, int *n, s *d, s *e, s *vl, s *vu, int *il, int *iu, int *m, s *w, c *z, int *ldz, int *nzc, int *isuppz, bint *tryrac, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_cstemr(jobz, range, n, d, e, vl, vu, il, iu, m, w, z, ldz, nzc, isuppz, tryrac, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_csteqr "F_FUNC(csteqr,CSTEQR)"(char *compz, int *n, s *d, s *e, c *z, int *ldz, s *work, int *info) nogil
cdef void csteqr(char *compz, int *n, s *d, s *e, c *z, int *ldz, s *work, int *info) nogil:
    _fortran_csteqr(compz, n, d, e, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_csycon "F_FUNC(csycon,CSYCON)"(char *uplo, int *n, c *a, int *lda, int *ipiv, s *anorm, s *rcond, c *work, int *info) nogil
cdef void csycon(char *uplo, int *n, c *a, int *lda, int *ipiv, s *anorm, s *rcond, c *work, int *info) nogil:
    _fortran_csycon(uplo, n, a, lda, ipiv, anorm, rcond, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_csymv "F_FUNC(csymv,CSYMV)"(char *uplo, int *n, c *alpha, c *a, int *lda, c *x, int *incx, c *beta, c *y, int *incy) nogil
cdef void csymv(char *uplo, int *n, c *alpha, c *a, int *lda, c *x, int *incx, c *beta, c *y, int *incy) nogil:
    _fortran_csymv(uplo, n, alpha, a, lda, x, incx, beta, y, incy)

cdef extern from "_lapack_subroutines.h":
    void _fortran_csyr "F_FUNC(csyr,CSYR)"(char *uplo, int *n, c *alpha, c *x, int *incx, c *a, int *lda) nogil
cdef void csyr(char *uplo, int *n, c *alpha, c *x, int *incx, c *a, int *lda) nogil:
    _fortran_csyr(uplo, n, alpha, x, incx, a, lda)

cdef extern from "_lapack_subroutines.h":
    void _fortran_csyrfs "F_FUNC(csyrfs,CSYRFS)"(char *uplo, int *n, int *nrhs, c *a, int *lda, c *af, int *ldaf, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void csyrfs(char *uplo, int *n, int *nrhs, c *a, int *lda, c *af, int *ldaf, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_csyrfs(uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_csysv "F_FUNC(csysv,CSYSV)"(char *uplo, int *n, int *nrhs, c *a, int *lda, int *ipiv, c *b, int *ldb, c *work, int *lwork, int *info) nogil
cdef void csysv(char *uplo, int *n, int *nrhs, c *a, int *lda, int *ipiv, c *b, int *ldb, c *work, int *lwork, int *info) nogil:
    _fortran_csysv(uplo, n, nrhs, a, lda, ipiv, b, ldb, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_csysvx "F_FUNC(csysvx,CSYSVX)"(char *fact, char *uplo, int *n, int *nrhs, c *a, int *lda, c *af, int *ldaf, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, int *lwork, s *rwork, int *info) nogil
cdef void csysvx(char *fact, char *uplo, int *n, int *nrhs, c *a, int *lda, c *af, int *ldaf, int *ipiv, c *b, int *ldb, c *x, int *ldx, s *rcond, s *ferr, s *berr, c *work, int *lwork, s *rwork, int *info) nogil:
    _fortran_csysvx(fact, uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb, x, ldx, rcond, ferr, berr, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_csytf2 "F_FUNC(csytf2,CSYTF2)"(char *uplo, int *n, c *a, int *lda, int *ipiv, int *info) nogil
cdef void csytf2(char *uplo, int *n, c *a, int *lda, int *ipiv, int *info) nogil:
    _fortran_csytf2(uplo, n, a, lda, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_csytrf "F_FUNC(csytrf,CSYTRF)"(char *uplo, int *n, c *a, int *lda, int *ipiv, c *work, int *lwork, int *info) nogil
cdef void csytrf(char *uplo, int *n, c *a, int *lda, int *ipiv, c *work, int *lwork, int *info) nogil:
    _fortran_csytrf(uplo, n, a, lda, ipiv, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_csytri "F_FUNC(csytri,CSYTRI)"(char *uplo, int *n, c *a, int *lda, int *ipiv, c *work, int *info) nogil
cdef void csytri(char *uplo, int *n, c *a, int *lda, int *ipiv, c *work, int *info) nogil:
    _fortran_csytri(uplo, n, a, lda, ipiv, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_csytrs "F_FUNC(csytrs,CSYTRS)"(char *uplo, int *n, int *nrhs, c *a, int *lda, int *ipiv, c *b, int *ldb, int *info) nogil
cdef void csytrs(char *uplo, int *n, int *nrhs, c *a, int *lda, int *ipiv, c *b, int *ldb, int *info) nogil:
    _fortran_csytrs(uplo, n, nrhs, a, lda, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctbcon "F_FUNC(ctbcon,CTBCON)"(char *norm, char *uplo, char *diag, int *n, int *kd, c *ab, int *ldab, s *rcond, c *work, s *rwork, int *info) nogil
cdef void ctbcon(char *norm, char *uplo, char *diag, int *n, int *kd, c *ab, int *ldab, s *rcond, c *work, s *rwork, int *info) nogil:
    _fortran_ctbcon(norm, uplo, diag, n, kd, ab, ldab, rcond, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctbrfs "F_FUNC(ctbrfs,CTBRFS)"(char *uplo, char *trans, char *diag, int *n, int *kd, int *nrhs, c *ab, int *ldab, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void ctbrfs(char *uplo, char *trans, char *diag, int *n, int *kd, int *nrhs, c *ab, int *ldab, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_ctbrfs(uplo, trans, diag, n, kd, nrhs, ab, ldab, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctbtrs "F_FUNC(ctbtrs,CTBTRS)"(char *uplo, char *trans, char *diag, int *n, int *kd, int *nrhs, c *ab, int *ldab, c *b, int *ldb, int *info) nogil
cdef void ctbtrs(char *uplo, char *trans, char *diag, int *n, int *kd, int *nrhs, c *ab, int *ldab, c *b, int *ldb, int *info) nogil:
    _fortran_ctbtrs(uplo, trans, diag, n, kd, nrhs, ab, ldab, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctgevc "F_FUNC(ctgevc,CTGEVC)"(char *side, char *howmny, bint *select, int *n, c *s, int *lds, c *p, int *ldp, c *vl, int *ldvl, c *vr, int *ldvr, int *mm, int *m, c *work, s *rwork, int *info) nogil
cdef void ctgevc(char *side, char *howmny, bint *select, int *n, c *s, int *lds, c *p, int *ldp, c *vl, int *ldvl, c *vr, int *ldvr, int *mm, int *m, c *work, s *rwork, int *info) nogil:
    _fortran_ctgevc(side, howmny, select, n, s, lds, p, ldp, vl, ldvl, vr, ldvr, mm, m, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctgex2 "F_FUNC(ctgex2,CTGEX2)"(bint *wantq, bint *wantz, int *n, c *a, int *lda, c *b, int *ldb, c *q, int *ldq, c *z, int *ldz, int *j1, int *info) nogil
cdef void ctgex2(bint *wantq, bint *wantz, int *n, c *a, int *lda, c *b, int *ldb, c *q, int *ldq, c *z, int *ldz, int *j1, int *info) nogil:
    _fortran_ctgex2(wantq, wantz, n, a, lda, b, ldb, q, ldq, z, ldz, j1, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctgexc "F_FUNC(ctgexc,CTGEXC)"(bint *wantq, bint *wantz, int *n, c *a, int *lda, c *b, int *ldb, c *q, int *ldq, c *z, int *ldz, int *ifst, int *ilst, int *info) nogil
cdef void ctgexc(bint *wantq, bint *wantz, int *n, c *a, int *lda, c *b, int *ldb, c *q, int *ldq, c *z, int *ldz, int *ifst, int *ilst, int *info) nogil:
    _fortran_ctgexc(wantq, wantz, n, a, lda, b, ldb, q, ldq, z, ldz, ifst, ilst, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctgsen "F_FUNC(ctgsen,CTGSEN)"(int *ijob, bint *wantq, bint *wantz, bint *select, int *n, c *a, int *lda, c *b, int *ldb, c *alpha, c *beta, c *q, int *ldq, c *z, int *ldz, int *m, s *pl, s *pr, s *dif, c *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void ctgsen(int *ijob, bint *wantq, bint *wantz, bint *select, int *n, c *a, int *lda, c *b, int *ldb, c *alpha, c *beta, c *q, int *ldq, c *z, int *ldz, int *m, s *pl, s *pr, s *dif, c *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_ctgsen(ijob, wantq, wantz, select, n, a, lda, b, ldb, alpha, beta, q, ldq, z, ldz, m, pl, pr, dif, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctgsja "F_FUNC(ctgsja,CTGSJA)"(char *jobu, char *jobv, char *jobq, int *m, int *p, int *n, int *k, int *l, c *a, int *lda, c *b, int *ldb, s *tola, s *tolb, s *alpha, s *beta, c *u, int *ldu, c *v, int *ldv, c *q, int *ldq, c *work, int *ncycle, int *info) nogil
cdef void ctgsja(char *jobu, char *jobv, char *jobq, int *m, int *p, int *n, int *k, int *l, c *a, int *lda, c *b, int *ldb, s *tola, s *tolb, s *alpha, s *beta, c *u, int *ldu, c *v, int *ldv, c *q, int *ldq, c *work, int *ncycle, int *info) nogil:
    _fortran_ctgsja(jobu, jobv, jobq, m, p, n, k, l, a, lda, b, ldb, tola, tolb, alpha, beta, u, ldu, v, ldv, q, ldq, work, ncycle, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctgsna "F_FUNC(ctgsna,CTGSNA)"(char *job, char *howmny, bint *select, int *n, c *a, int *lda, c *b, int *ldb, c *vl, int *ldvl, c *vr, int *ldvr, s *s, s *dif, int *mm, int *m, c *work, int *lwork, int *iwork, int *info) nogil
cdef void ctgsna(char *job, char *howmny, bint *select, int *n, c *a, int *lda, c *b, int *ldb, c *vl, int *ldvl, c *vr, int *ldvr, s *s, s *dif, int *mm, int *m, c *work, int *lwork, int *iwork, int *info) nogil:
    _fortran_ctgsna(job, howmny, select, n, a, lda, b, ldb, vl, ldvl, vr, ldvr, s, dif, mm, m, work, lwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctgsy2 "F_FUNC(ctgsy2,CTGSY2)"(char *trans, int *ijob, int *m, int *n, c *a, int *lda, c *b, int *ldb, c *c, int *ldc, c *d, int *ldd, c *e, int *lde, c *f, int *ldf, s *scale, s *rdsum, s *rdscal, int *info) nogil
cdef void ctgsy2(char *trans, int *ijob, int *m, int *n, c *a, int *lda, c *b, int *ldb, c *c, int *ldc, c *d, int *ldd, c *e, int *lde, c *f, int *ldf, s *scale, s *rdsum, s *rdscal, int *info) nogil:
    _fortran_ctgsy2(trans, ijob, m, n, a, lda, b, ldb, c, ldc, d, ldd, e, lde, f, ldf, scale, rdsum, rdscal, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctgsyl "F_FUNC(ctgsyl,CTGSYL)"(char *trans, int *ijob, int *m, int *n, c *a, int *lda, c *b, int *ldb, c *c, int *ldc, c *d, int *ldd, c *e, int *lde, c *f, int *ldf, s *scale, s *dif, c *work, int *lwork, int *iwork, int *info) nogil
cdef void ctgsyl(char *trans, int *ijob, int *m, int *n, c *a, int *lda, c *b, int *ldb, c *c, int *ldc, c *d, int *ldd, c *e, int *lde, c *f, int *ldf, s *scale, s *dif, c *work, int *lwork, int *iwork, int *info) nogil:
    _fortran_ctgsyl(trans, ijob, m, n, a, lda, b, ldb, c, ldc, d, ldd, e, lde, f, ldf, scale, dif, work, lwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctpcon "F_FUNC(ctpcon,CTPCON)"(char *norm, char *uplo, char *diag, int *n, c *ap, s *rcond, c *work, s *rwork, int *info) nogil
cdef void ctpcon(char *norm, char *uplo, char *diag, int *n, c *ap, s *rcond, c *work, s *rwork, int *info) nogil:
    _fortran_ctpcon(norm, uplo, diag, n, ap, rcond, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctprfs "F_FUNC(ctprfs,CTPRFS)"(char *uplo, char *trans, char *diag, int *n, int *nrhs, c *ap, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void ctprfs(char *uplo, char *trans, char *diag, int *n, int *nrhs, c *ap, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_ctprfs(uplo, trans, diag, n, nrhs, ap, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctptri "F_FUNC(ctptri,CTPTRI)"(char *uplo, char *diag, int *n, c *ap, int *info) nogil
cdef void ctptri(char *uplo, char *diag, int *n, c *ap, int *info) nogil:
    _fortran_ctptri(uplo, diag, n, ap, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctptrs "F_FUNC(ctptrs,CTPTRS)"(char *uplo, char *trans, char *diag, int *n, int *nrhs, c *ap, c *b, int *ldb, int *info) nogil
cdef void ctptrs(char *uplo, char *trans, char *diag, int *n, int *nrhs, c *ap, c *b, int *ldb, int *info) nogil:
    _fortran_ctptrs(uplo, trans, diag, n, nrhs, ap, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctrcon "F_FUNC(ctrcon,CTRCON)"(char *norm, char *uplo, char *diag, int *n, c *a, int *lda, s *rcond, c *work, s *rwork, int *info) nogil
cdef void ctrcon(char *norm, char *uplo, char *diag, int *n, c *a, int *lda, s *rcond, c *work, s *rwork, int *info) nogil:
    _fortran_ctrcon(norm, uplo, diag, n, a, lda, rcond, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctrevc "F_FUNC(ctrevc,CTREVC)"(char *side, char *howmny, bint *select, int *n, c *t, int *ldt, c *vl, int *ldvl, c *vr, int *ldvr, int *mm, int *m, c *work, s *rwork, int *info) nogil
cdef void ctrevc(char *side, char *howmny, bint *select, int *n, c *t, int *ldt, c *vl, int *ldvl, c *vr, int *ldvr, int *mm, int *m, c *work, s *rwork, int *info) nogil:
    _fortran_ctrevc(side, howmny, select, n, t, ldt, vl, ldvl, vr, ldvr, mm, m, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctrexc "F_FUNC(ctrexc,CTREXC)"(char *compq, int *n, c *t, int *ldt, c *q, int *ldq, int *ifst, int *ilst, int *info) nogil
cdef void ctrexc(char *compq, int *n, c *t, int *ldt, c *q, int *ldq, int *ifst, int *ilst, int *info) nogil:
    _fortran_ctrexc(compq, n, t, ldt, q, ldq, ifst, ilst, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctrrfs "F_FUNC(ctrrfs,CTRRFS)"(char *uplo, char *trans, char *diag, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil
cdef void ctrrfs(char *uplo, char *trans, char *diag, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, c *x, int *ldx, s *ferr, s *berr, c *work, s *rwork, int *info) nogil:
    _fortran_ctrrfs(uplo, trans, diag, n, nrhs, a, lda, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctrsen "F_FUNC(ctrsen,CTRSEN)"(char *job, char *compq, bint *select, int *n, c *t, int *ldt, c *q, int *ldq, c *w, int *m, s *s, s *sep, c *work, int *lwork, int *info) nogil
cdef void ctrsen(char *job, char *compq, bint *select, int *n, c *t, int *ldt, c *q, int *ldq, c *w, int *m, s *s, s *sep, c *work, int *lwork, int *info) nogil:
    _fortran_ctrsen(job, compq, select, n, t, ldt, q, ldq, w, m, s, sep, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctrsna "F_FUNC(ctrsna,CTRSNA)"(char *job, char *howmny, bint *select, int *n, c *t, int *ldt, c *vl, int *ldvl, c *vr, int *ldvr, s *s, s *sep, int *mm, int *m, c *work, int *ldwork, s *rwork, int *info) nogil
cdef void ctrsna(char *job, char *howmny, bint *select, int *n, c *t, int *ldt, c *vl, int *ldvl, c *vr, int *ldvr, s *s, s *sep, int *mm, int *m, c *work, int *ldwork, s *rwork, int *info) nogil:
    _fortran_ctrsna(job, howmny, select, n, t, ldt, vl, ldvl, vr, ldvr, s, sep, mm, m, work, ldwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctrsyl "F_FUNC(ctrsyl,CTRSYL)"(char *trana, char *tranb, int *isgn, int *m, int *n, c *a, int *lda, c *b, int *ldb, c *c, int *ldc, s *scale, int *info) nogil
cdef void ctrsyl(char *trana, char *tranb, int *isgn, int *m, int *n, c *a, int *lda, c *b, int *ldb, c *c, int *ldc, s *scale, int *info) nogil:
    _fortran_ctrsyl(trana, tranb, isgn, m, n, a, lda, b, ldb, c, ldc, scale, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctrti2 "F_FUNC(ctrti2,CTRTI2)"(char *uplo, char *diag, int *n, c *a, int *lda, int *info) nogil
cdef void ctrti2(char *uplo, char *diag, int *n, c *a, int *lda, int *info) nogil:
    _fortran_ctrti2(uplo, diag, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctrtri "F_FUNC(ctrtri,CTRTRI)"(char *uplo, char *diag, int *n, c *a, int *lda, int *info) nogil
cdef void ctrtri(char *uplo, char *diag, int *n, c *a, int *lda, int *info) nogil:
    _fortran_ctrtri(uplo, diag, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctrtrs "F_FUNC(ctrtrs,CTRTRS)"(char *uplo, char *trans, char *diag, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, int *info) nogil
cdef void ctrtrs(char *uplo, char *trans, char *diag, int *n, int *nrhs, c *a, int *lda, c *b, int *ldb, int *info) nogil:
    _fortran_ctrtrs(uplo, trans, diag, n, nrhs, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctzrqf "F_FUNC(ctzrqf,CTZRQF)"(int *m, int *n, c *a, int *lda, c *tau, int *info) nogil
cdef void ctzrqf(int *m, int *n, c *a, int *lda, c *tau, int *info) nogil:
    _fortran_ctzrqf(m, n, a, lda, tau, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ctzrzf "F_FUNC(ctzrzf,CTZRZF)"(int *m, int *n, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil
cdef void ctzrzf(int *m, int *n, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil:
    _fortran_ctzrzf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cung2l "F_FUNC(cung2l,CUNG2L)"(int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *info) nogil
cdef void cung2l(int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *info) nogil:
    _fortran_cung2l(m, n, k, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cung2r "F_FUNC(cung2r,CUNG2R)"(int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *info) nogil
cdef void cung2r(int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *info) nogil:
    _fortran_cung2r(m, n, k, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cungbr "F_FUNC(cungbr,CUNGBR)"(char *vect, int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil
cdef void cungbr(char *vect, int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil:
    _fortran_cungbr(vect, m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cunghr "F_FUNC(cunghr,CUNGHR)"(int *n, int *ilo, int *ihi, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil
cdef void cunghr(int *n, int *ilo, int *ihi, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil:
    _fortran_cunghr(n, ilo, ihi, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cungl2 "F_FUNC(cungl2,CUNGL2)"(int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *info) nogil
cdef void cungl2(int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *info) nogil:
    _fortran_cungl2(m, n, k, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cunglq "F_FUNC(cunglq,CUNGLQ)"(int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil
cdef void cunglq(int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil:
    _fortran_cunglq(m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cungql "F_FUNC(cungql,CUNGQL)"(int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil
cdef void cungql(int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil:
    _fortran_cungql(m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cungqr "F_FUNC(cungqr,CUNGQR)"(int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil
cdef void cungqr(int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil:
    _fortran_cungqr(m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cungr2 "F_FUNC(cungr2,CUNGR2)"(int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *info) nogil
cdef void cungr2(int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *info) nogil:
    _fortran_cungr2(m, n, k, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cungrq "F_FUNC(cungrq,CUNGRQ)"(int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil
cdef void cungrq(int *m, int *n, int *k, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil:
    _fortran_cungrq(m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cungtr "F_FUNC(cungtr,CUNGTR)"(char *uplo, int *n, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil
cdef void cungtr(char *uplo, int *n, c *a, int *lda, c *tau, c *work, int *lwork, int *info) nogil:
    _fortran_cungtr(uplo, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cunm2l "F_FUNC(cunm2l,CUNM2L)"(char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *info) nogil
cdef void cunm2l(char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *info) nogil:
    _fortran_cunm2l(side, trans, m, n, k, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cunm2r "F_FUNC(cunm2r,CUNM2R)"(char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *info) nogil
cdef void cunm2r(char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *info) nogil:
    _fortran_cunm2r(side, trans, m, n, k, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cunmbr "F_FUNC(cunmbr,CUNMBR)"(char *vect, char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *lwork, int *info) nogil
cdef void cunmbr(char *vect, char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *lwork, int *info) nogil:
    _fortran_cunmbr(vect, side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cunmhr "F_FUNC(cunmhr,CUNMHR)"(char *side, char *trans, int *m, int *n, int *ilo, int *ihi, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *lwork, int *info) nogil
cdef void cunmhr(char *side, char *trans, int *m, int *n, int *ilo, int *ihi, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *lwork, int *info) nogil:
    _fortran_cunmhr(side, trans, m, n, ilo, ihi, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cunml2 "F_FUNC(cunml2,CUNML2)"(char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *info) nogil
cdef void cunml2(char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *info) nogil:
    _fortran_cunml2(side, trans, m, n, k, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cunmlq "F_FUNC(cunmlq,CUNMLQ)"(char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *lwork, int *info) nogil
cdef void cunmlq(char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *lwork, int *info) nogil:
    _fortran_cunmlq(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cunmql "F_FUNC(cunmql,CUNMQL)"(char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *lwork, int *info) nogil
cdef void cunmql(char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *lwork, int *info) nogil:
    _fortran_cunmql(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cunmqr "F_FUNC(cunmqr,CUNMQR)"(char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *lwork, int *info) nogil
cdef void cunmqr(char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *lwork, int *info) nogil:
    _fortran_cunmqr(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cunmr2 "F_FUNC(cunmr2,CUNMR2)"(char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *info) nogil
cdef void cunmr2(char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *info) nogil:
    _fortran_cunmr2(side, trans, m, n, k, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cunmr3 "F_FUNC(cunmr3,CUNMR3)"(char *side, char *trans, int *m, int *n, int *k, int *l, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *info) nogil
cdef void cunmr3(char *side, char *trans, int *m, int *n, int *k, int *l, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *info) nogil:
    _fortran_cunmr3(side, trans, m, n, k, l, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cunmrq "F_FUNC(cunmrq,CUNMRQ)"(char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *lwork, int *info) nogil
cdef void cunmrq(char *side, char *trans, int *m, int *n, int *k, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *lwork, int *info) nogil:
    _fortran_cunmrq(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cunmrz "F_FUNC(cunmrz,CUNMRZ)"(char *side, char *trans, int *m, int *n, int *k, int *l, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *lwork, int *info) nogil
cdef void cunmrz(char *side, char *trans, int *m, int *n, int *k, int *l, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *lwork, int *info) nogil:
    _fortran_cunmrz(side, trans, m, n, k, l, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cunmtr "F_FUNC(cunmtr,CUNMTR)"(char *side, char *uplo, char *trans, int *m, int *n, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *lwork, int *info) nogil
cdef void cunmtr(char *side, char *uplo, char *trans, int *m, int *n, c *a, int *lda, c *tau, c *c, int *ldc, c *work, int *lwork, int *info) nogil:
    _fortran_cunmtr(side, uplo, trans, m, n, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cupgtr "F_FUNC(cupgtr,CUPGTR)"(char *uplo, int *n, c *ap, c *tau, c *q, int *ldq, c *work, int *info) nogil
cdef void cupgtr(char *uplo, int *n, c *ap, c *tau, c *q, int *ldq, c *work, int *info) nogil:
    _fortran_cupgtr(uplo, n, ap, tau, q, ldq, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_cupmtr "F_FUNC(cupmtr,CUPMTR)"(char *side, char *uplo, char *trans, int *m, int *n, c *ap, c *tau, c *c, int *ldc, c *work, int *info) nogil
cdef void cupmtr(char *side, char *uplo, char *trans, int *m, int *n, c *ap, c *tau, c *c, int *ldc, c *work, int *info) nogil:
    _fortran_cupmtr(side, uplo, trans, m, n, ap, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dbdsdc "F_FUNC(dbdsdc,DBDSDC)"(char *uplo, char *compq, int *n, d *d, d *e, d *u, int *ldu, d *vt, int *ldvt, d *q, int *iq, d *work, int *iwork, int *info) nogil
cdef void dbdsdc(char *uplo, char *compq, int *n, d *d, d *e, d *u, int *ldu, d *vt, int *ldvt, d *q, int *iq, d *work, int *iwork, int *info) nogil:
    _fortran_dbdsdc(uplo, compq, n, d, e, u, ldu, vt, ldvt, q, iq, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dbdsqr "F_FUNC(dbdsqr,DBDSQR)"(char *uplo, int *n, int *ncvt, int *nru, int *ncc, d *d, d *e, d *vt, int *ldvt, d *u, int *ldu, d *c, int *ldc, d *work, int *info) nogil
cdef void dbdsqr(char *uplo, int *n, int *ncvt, int *nru, int *ncc, d *d, d *e, d *vt, int *ldvt, d *u, int *ldu, d *c, int *ldc, d *work, int *info) nogil:
    _fortran_dbdsqr(uplo, n, ncvt, nru, ncc, d, e, vt, ldvt, u, ldu, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ddisna "F_FUNC(ddisna,DDISNA)"(char *job, int *m, int *n, d *d, d *sep, int *info) nogil
cdef void ddisna(char *job, int *m, int *n, d *d, d *sep, int *info) nogil:
    _fortran_ddisna(job, m, n, d, sep, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgbbrd "F_FUNC(dgbbrd,DGBBRD)"(char *vect, int *m, int *n, int *ncc, int *kl, int *ku, d *ab, int *ldab, d *d, d *e, d *q, int *ldq, d *pt, int *ldpt, d *c, int *ldc, d *work, int *info) nogil
cdef void dgbbrd(char *vect, int *m, int *n, int *ncc, int *kl, int *ku, d *ab, int *ldab, d *d, d *e, d *q, int *ldq, d *pt, int *ldpt, d *c, int *ldc, d *work, int *info) nogil:
    _fortran_dgbbrd(vect, m, n, ncc, kl, ku, ab, ldab, d, e, q, ldq, pt, ldpt, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgbcon "F_FUNC(dgbcon,DGBCON)"(char *norm, int *n, int *kl, int *ku, d *ab, int *ldab, int *ipiv, d *anorm, d *rcond, d *work, int *iwork, int *info) nogil
cdef void dgbcon(char *norm, int *n, int *kl, int *ku, d *ab, int *ldab, int *ipiv, d *anorm, d *rcond, d *work, int *iwork, int *info) nogil:
    _fortran_dgbcon(norm, n, kl, ku, ab, ldab, ipiv, anorm, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgbequ "F_FUNC(dgbequ,DGBEQU)"(int *m, int *n, int *kl, int *ku, d *ab, int *ldab, d *r, d *c, d *rowcnd, d *colcnd, d *amax, int *info) nogil
cdef void dgbequ(int *m, int *n, int *kl, int *ku, d *ab, int *ldab, d *r, d *c, d *rowcnd, d *colcnd, d *amax, int *info) nogil:
    _fortran_dgbequ(m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgbrfs "F_FUNC(dgbrfs,DGBRFS)"(char *trans, int *n, int *kl, int *ku, int *nrhs, d *ab, int *ldab, d *afb, int *ldafb, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dgbrfs(char *trans, int *n, int *kl, int *ku, int *nrhs, d *ab, int *ldab, d *afb, int *ldafb, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dgbrfs(trans, n, kl, ku, nrhs, ab, ldab, afb, ldafb, ipiv, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgbsv "F_FUNC(dgbsv,DGBSV)"(int *n, int *kl, int *ku, int *nrhs, d *ab, int *ldab, int *ipiv, d *b, int *ldb, int *info) nogil
cdef void dgbsv(int *n, int *kl, int *ku, int *nrhs, d *ab, int *ldab, int *ipiv, d *b, int *ldb, int *info) nogil:
    _fortran_dgbsv(n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgbsvx "F_FUNC(dgbsvx,DGBSVX)"(char *fact, char *trans, int *n, int *kl, int *ku, int *nrhs, d *ab, int *ldab, d *afb, int *ldafb, int *ipiv, char *equed, d *r, d *c, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dgbsvx(char *fact, char *trans, int *n, int *kl, int *ku, int *nrhs, d *ab, int *ldab, d *afb, int *ldafb, int *ipiv, char *equed, d *r, d *c, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dgbsvx(fact, trans, n, kl, ku, nrhs, ab, ldab, afb, ldafb, ipiv, equed, r, c, b, ldb, x, ldx, rcond, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgbtf2 "F_FUNC(dgbtf2,DGBTF2)"(int *m, int *n, int *kl, int *ku, d *ab, int *ldab, int *ipiv, int *info) nogil
cdef void dgbtf2(int *m, int *n, int *kl, int *ku, d *ab, int *ldab, int *ipiv, int *info) nogil:
    _fortran_dgbtf2(m, n, kl, ku, ab, ldab, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgbtrf "F_FUNC(dgbtrf,DGBTRF)"(int *m, int *n, int *kl, int *ku, d *ab, int *ldab, int *ipiv, int *info) nogil
cdef void dgbtrf(int *m, int *n, int *kl, int *ku, d *ab, int *ldab, int *ipiv, int *info) nogil:
    _fortran_dgbtrf(m, n, kl, ku, ab, ldab, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgbtrs "F_FUNC(dgbtrs,DGBTRS)"(char *trans, int *n, int *kl, int *ku, int *nrhs, d *ab, int *ldab, int *ipiv, d *b, int *ldb, int *info) nogil
cdef void dgbtrs(char *trans, int *n, int *kl, int *ku, int *nrhs, d *ab, int *ldab, int *ipiv, d *b, int *ldb, int *info) nogil:
    _fortran_dgbtrs(trans, n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgebak "F_FUNC(dgebak,DGEBAK)"(char *job, char *side, int *n, int *ilo, int *ihi, d *scale, int *m, d *v, int *ldv, int *info) nogil
cdef void dgebak(char *job, char *side, int *n, int *ilo, int *ihi, d *scale, int *m, d *v, int *ldv, int *info) nogil:
    _fortran_dgebak(job, side, n, ilo, ihi, scale, m, v, ldv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgebal "F_FUNC(dgebal,DGEBAL)"(char *job, int *n, d *a, int *lda, int *ilo, int *ihi, d *scale, int *info) nogil
cdef void dgebal(char *job, int *n, d *a, int *lda, int *ilo, int *ihi, d *scale, int *info) nogil:
    _fortran_dgebal(job, n, a, lda, ilo, ihi, scale, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgebd2 "F_FUNC(dgebd2,DGEBD2)"(int *m, int *n, d *a, int *lda, d *d, d *e, d *tauq, d *taup, d *work, int *info) nogil
cdef void dgebd2(int *m, int *n, d *a, int *lda, d *d, d *e, d *tauq, d *taup, d *work, int *info) nogil:
    _fortran_dgebd2(m, n, a, lda, d, e, tauq, taup, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgebrd "F_FUNC(dgebrd,DGEBRD)"(int *m, int *n, d *a, int *lda, d *d, d *e, d *tauq, d *taup, d *work, int *lwork, int *info) nogil
cdef void dgebrd(int *m, int *n, d *a, int *lda, d *d, d *e, d *tauq, d *taup, d *work, int *lwork, int *info) nogil:
    _fortran_dgebrd(m, n, a, lda, d, e, tauq, taup, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgecon "F_FUNC(dgecon,DGECON)"(char *norm, int *n, d *a, int *lda, d *anorm, d *rcond, d *work, int *iwork, int *info) nogil
cdef void dgecon(char *norm, int *n, d *a, int *lda, d *anorm, d *rcond, d *work, int *iwork, int *info) nogil:
    _fortran_dgecon(norm, n, a, lda, anorm, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgeequ "F_FUNC(dgeequ,DGEEQU)"(int *m, int *n, d *a, int *lda, d *r, d *c, d *rowcnd, d *colcnd, d *amax, int *info) nogil
cdef void dgeequ(int *m, int *n, d *a, int *lda, d *r, d *c, d *rowcnd, d *colcnd, d *amax, int *info) nogil:
    _fortran_dgeequ(m, n, a, lda, r, c, rowcnd, colcnd, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgees "F_FUNC(dgees,DGEES)"(char *jobvs, char *sort, dselect2 *select, int *n, d *a, int *lda, int *sdim, d *wr, d *wi, d *vs, int *ldvs, d *work, int *lwork, bint *bwork, int *info) nogil
cdef void dgees(char *jobvs, char *sort, dselect2 *select, int *n, d *a, int *lda, int *sdim, d *wr, d *wi, d *vs, int *ldvs, d *work, int *lwork, bint *bwork, int *info) nogil:
    _fortran_dgees(jobvs, sort, select, n, a, lda, sdim, wr, wi, vs, ldvs, work, lwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgeesx "F_FUNC(dgeesx,DGEESX)"(char *jobvs, char *sort, dselect2 *select, char *sense, int *n, d *a, int *lda, int *sdim, d *wr, d *wi, d *vs, int *ldvs, d *rconde, d *rcondv, d *work, int *lwork, int *iwork, int *liwork, bint *bwork, int *info) nogil
cdef void dgeesx(char *jobvs, char *sort, dselect2 *select, char *sense, int *n, d *a, int *lda, int *sdim, d *wr, d *wi, d *vs, int *ldvs, d *rconde, d *rcondv, d *work, int *lwork, int *iwork, int *liwork, bint *bwork, int *info) nogil:
    _fortran_dgeesx(jobvs, sort, select, sense, n, a, lda, sdim, wr, wi, vs, ldvs, rconde, rcondv, work, lwork, iwork, liwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgeev "F_FUNC(dgeev,DGEEV)"(char *jobvl, char *jobvr, int *n, d *a, int *lda, d *wr, d *wi, d *vl, int *ldvl, d *vr, int *ldvr, d *work, int *lwork, int *info) nogil
cdef void dgeev(char *jobvl, char *jobvr, int *n, d *a, int *lda, d *wr, d *wi, d *vl, int *ldvl, d *vr, int *ldvr, d *work, int *lwork, int *info) nogil:
    _fortran_dgeev(jobvl, jobvr, n, a, lda, wr, wi, vl, ldvl, vr, ldvr, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgeevx "F_FUNC(dgeevx,DGEEVX)"(char *balanc, char *jobvl, char *jobvr, char *sense, int *n, d *a, int *lda, d *wr, d *wi, d *vl, int *ldvl, d *vr, int *ldvr, int *ilo, int *ihi, d *scale, d *abnrm, d *rconde, d *rcondv, d *work, int *lwork, int *iwork, int *info) nogil
cdef void dgeevx(char *balanc, char *jobvl, char *jobvr, char *sense, int *n, d *a, int *lda, d *wr, d *wi, d *vl, int *ldvl, d *vr, int *ldvr, int *ilo, int *ihi, d *scale, d *abnrm, d *rconde, d *rcondv, d *work, int *lwork, int *iwork, int *info) nogil:
    _fortran_dgeevx(balanc, jobvl, jobvr, sense, n, a, lda, wr, wi, vl, ldvl, vr, ldvr, ilo, ihi, scale, abnrm, rconde, rcondv, work, lwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgegs "F_FUNC(dgegs,DGEGS)"(char *jobvsl, char *jobvsr, int *n, d *a, int *lda, d *b, int *ldb, d *alphar, d *alphai, d *beta, d *vsl, int *ldvsl, d *vsr, int *ldvsr, d *work, int *lwork, int *info) nogil
cdef void dgegs(char *jobvsl, char *jobvsr, int *n, d *a, int *lda, d *b, int *ldb, d *alphar, d *alphai, d *beta, d *vsl, int *ldvsl, d *vsr, int *ldvsr, d *work, int *lwork, int *info) nogil:
    _fortran_dgegs(jobvsl, jobvsr, n, a, lda, b, ldb, alphar, alphai, beta, vsl, ldvsl, vsr, ldvsr, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgegv "F_FUNC(dgegv,DGEGV)"(char *jobvl, char *jobvr, int *n, d *a, int *lda, d *b, int *ldb, d *alphar, d *alphai, d *beta, d *vl, int *ldvl, d *vr, int *ldvr, d *work, int *lwork, int *info) nogil
cdef void dgegv(char *jobvl, char *jobvr, int *n, d *a, int *lda, d *b, int *ldb, d *alphar, d *alphai, d *beta, d *vl, int *ldvl, d *vr, int *ldvr, d *work, int *lwork, int *info) nogil:
    _fortran_dgegv(jobvl, jobvr, n, a, lda, b, ldb, alphar, alphai, beta, vl, ldvl, vr, ldvr, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgehd2 "F_FUNC(dgehd2,DGEHD2)"(int *n, int *ilo, int *ihi, d *a, int *lda, d *tau, d *work, int *info) nogil
cdef void dgehd2(int *n, int *ilo, int *ihi, d *a, int *lda, d *tau, d *work, int *info) nogil:
    _fortran_dgehd2(n, ilo, ihi, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgehrd "F_FUNC(dgehrd,DGEHRD)"(int *n, int *ilo, int *ihi, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil
cdef void dgehrd(int *n, int *ilo, int *ihi, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil:
    _fortran_dgehrd(n, ilo, ihi, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgelq2 "F_FUNC(dgelq2,DGELQ2)"(int *m, int *n, d *a, int *lda, d *tau, d *work, int *info) nogil
cdef void dgelq2(int *m, int *n, d *a, int *lda, d *tau, d *work, int *info) nogil:
    _fortran_dgelq2(m, n, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgelqf "F_FUNC(dgelqf,DGELQF)"(int *m, int *n, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil
cdef void dgelqf(int *m, int *n, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil:
    _fortran_dgelqf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgels "F_FUNC(dgels,DGELS)"(char *trans, int *m, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, d *work, int *lwork, int *info) nogil
cdef void dgels(char *trans, int *m, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, d *work, int *lwork, int *info) nogil:
    _fortran_dgels(trans, m, n, nrhs, a, lda, b, ldb, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgelsd "F_FUNC(dgelsd,DGELSD)"(int *m, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, d *s, d *rcond, int *rank, d *work, int *lwork, int *iwork, int *info) nogil
cdef void dgelsd(int *m, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, d *s, d *rcond, int *rank, d *work, int *lwork, int *iwork, int *info) nogil:
    _fortran_dgelsd(m, n, nrhs, a, lda, b, ldb, s, rcond, rank, work, lwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgelss "F_FUNC(dgelss,DGELSS)"(int *m, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, d *s, d *rcond, int *rank, d *work, int *lwork, int *info) nogil
cdef void dgelss(int *m, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, d *s, d *rcond, int *rank, d *work, int *lwork, int *info) nogil:
    _fortran_dgelss(m, n, nrhs, a, lda, b, ldb, s, rcond, rank, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgelsx "F_FUNC(dgelsx,DGELSX)"(int *m, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, int *jpvt, d *rcond, int *rank, d *work, int *info) nogil
cdef void dgelsx(int *m, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, int *jpvt, d *rcond, int *rank, d *work, int *info) nogil:
    _fortran_dgelsx(m, n, nrhs, a, lda, b, ldb, jpvt, rcond, rank, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgelsy "F_FUNC(dgelsy,DGELSY)"(int *m, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, int *jpvt, d *rcond, int *rank, d *work, int *lwork, int *info) nogil
cdef void dgelsy(int *m, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, int *jpvt, d *rcond, int *rank, d *work, int *lwork, int *info) nogil:
    _fortran_dgelsy(m, n, nrhs, a, lda, b, ldb, jpvt, rcond, rank, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgeql2 "F_FUNC(dgeql2,DGEQL2)"(int *m, int *n, d *a, int *lda, d *tau, d *work, int *info) nogil
cdef void dgeql2(int *m, int *n, d *a, int *lda, d *tau, d *work, int *info) nogil:
    _fortran_dgeql2(m, n, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgeqlf "F_FUNC(dgeqlf,DGEQLF)"(int *m, int *n, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil
cdef void dgeqlf(int *m, int *n, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil:
    _fortran_dgeqlf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgeqp3 "F_FUNC(dgeqp3,DGEQP3)"(int *m, int *n, d *a, int *lda, int *jpvt, d *tau, d *work, int *lwork, int *info) nogil
cdef void dgeqp3(int *m, int *n, d *a, int *lda, int *jpvt, d *tau, d *work, int *lwork, int *info) nogil:
    _fortran_dgeqp3(m, n, a, lda, jpvt, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgeqpf "F_FUNC(dgeqpf,DGEQPF)"(int *m, int *n, d *a, int *lda, int *jpvt, d *tau, d *work, int *info) nogil
cdef void dgeqpf(int *m, int *n, d *a, int *lda, int *jpvt, d *tau, d *work, int *info) nogil:
    _fortran_dgeqpf(m, n, a, lda, jpvt, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgeqr2 "F_FUNC(dgeqr2,DGEQR2)"(int *m, int *n, d *a, int *lda, d *tau, d *work, int *info) nogil
cdef void dgeqr2(int *m, int *n, d *a, int *lda, d *tau, d *work, int *info) nogil:
    _fortran_dgeqr2(m, n, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgeqrf "F_FUNC(dgeqrf,DGEQRF)"(int *m, int *n, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil
cdef void dgeqrf(int *m, int *n, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil:
    _fortran_dgeqrf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgerfs "F_FUNC(dgerfs,DGERFS)"(char *trans, int *n, int *nrhs, d *a, int *lda, d *af, int *ldaf, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dgerfs(char *trans, int *n, int *nrhs, d *a, int *lda, d *af, int *ldaf, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dgerfs(trans, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgerq2 "F_FUNC(dgerq2,DGERQ2)"(int *m, int *n, d *a, int *lda, d *tau, d *work, int *info) nogil
cdef void dgerq2(int *m, int *n, d *a, int *lda, d *tau, d *work, int *info) nogil:
    _fortran_dgerq2(m, n, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgerqf "F_FUNC(dgerqf,DGERQF)"(int *m, int *n, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil
cdef void dgerqf(int *m, int *n, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil:
    _fortran_dgerqf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgesc2 "F_FUNC(dgesc2,DGESC2)"(int *n, d *a, int *lda, d *rhs, int *ipiv, int *jpiv, d *scale) nogil
cdef void dgesc2(int *n, d *a, int *lda, d *rhs, int *ipiv, int *jpiv, d *scale) nogil:
    _fortran_dgesc2(n, a, lda, rhs, ipiv, jpiv, scale)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgesdd "F_FUNC(dgesdd,DGESDD)"(char *jobz, int *m, int *n, d *a, int *lda, d *s, d *u, int *ldu, d *vt, int *ldvt, d *work, int *lwork, int *iwork, int *info) nogil
cdef void dgesdd(char *jobz, int *m, int *n, d *a, int *lda, d *s, d *u, int *ldu, d *vt, int *ldvt, d *work, int *lwork, int *iwork, int *info) nogil:
    _fortran_dgesdd(jobz, m, n, a, lda, s, u, ldu, vt, ldvt, work, lwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgesv "F_FUNC(dgesv,DGESV)"(int *n, int *nrhs, d *a, int *lda, int *ipiv, d *b, int *ldb, int *info) nogil
cdef void dgesv(int *n, int *nrhs, d *a, int *lda, int *ipiv, d *b, int *ldb, int *info) nogil:
    _fortran_dgesv(n, nrhs, a, lda, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgesvd "F_FUNC(dgesvd,DGESVD)"(char *jobu, char *jobvt, int *m, int *n, d *a, int *lda, d *s, d *u, int *ldu, d *vt, int *ldvt, d *work, int *lwork, int *info) nogil
cdef void dgesvd(char *jobu, char *jobvt, int *m, int *n, d *a, int *lda, d *s, d *u, int *ldu, d *vt, int *ldvt, d *work, int *lwork, int *info) nogil:
    _fortran_dgesvd(jobu, jobvt, m, n, a, lda, s, u, ldu, vt, ldvt, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgesvx "F_FUNC(dgesvx,DGESVX)"(char *fact, char *trans, int *n, int *nrhs, d *a, int *lda, d *af, int *ldaf, int *ipiv, char *equed, d *r, d *c, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dgesvx(char *fact, char *trans, int *n, int *nrhs, d *a, int *lda, d *af, int *ldaf, int *ipiv, char *equed, d *r, d *c, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dgesvx(fact, trans, n, nrhs, a, lda, af, ldaf, ipiv, equed, r, c, b, ldb, x, ldx, rcond, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgetc2 "F_FUNC(dgetc2,DGETC2)"(int *n, d *a, int *lda, int *ipiv, int *jpiv, int *info) nogil
cdef void dgetc2(int *n, d *a, int *lda, int *ipiv, int *jpiv, int *info) nogil:
    _fortran_dgetc2(n, a, lda, ipiv, jpiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgetf2 "F_FUNC(dgetf2,DGETF2)"(int *m, int *n, d *a, int *lda, int *ipiv, int *info) nogil
cdef void dgetf2(int *m, int *n, d *a, int *lda, int *ipiv, int *info) nogil:
    _fortran_dgetf2(m, n, a, lda, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgetrf "F_FUNC(dgetrf,DGETRF)"(int *m, int *n, d *a, int *lda, int *ipiv, int *info) nogil
cdef void dgetrf(int *m, int *n, d *a, int *lda, int *ipiv, int *info) nogil:
    _fortran_dgetrf(m, n, a, lda, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgetri "F_FUNC(dgetri,DGETRI)"(int *n, d *a, int *lda, int *ipiv, d *work, int *lwork, int *info) nogil
cdef void dgetri(int *n, d *a, int *lda, int *ipiv, d *work, int *lwork, int *info) nogil:
    _fortran_dgetri(n, a, lda, ipiv, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgetrs "F_FUNC(dgetrs,DGETRS)"(char *trans, int *n, int *nrhs, d *a, int *lda, int *ipiv, d *b, int *ldb, int *info) nogil
cdef void dgetrs(char *trans, int *n, int *nrhs, d *a, int *lda, int *ipiv, d *b, int *ldb, int *info) nogil:
    _fortran_dgetrs(trans, n, nrhs, a, lda, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dggbak "F_FUNC(dggbak,DGGBAK)"(char *job, char *side, int *n, int *ilo, int *ihi, d *lscale, d *rscale, int *m, d *v, int *ldv, int *info) nogil
cdef void dggbak(char *job, char *side, int *n, int *ilo, int *ihi, d *lscale, d *rscale, int *m, d *v, int *ldv, int *info) nogil:
    _fortran_dggbak(job, side, n, ilo, ihi, lscale, rscale, m, v, ldv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dggbal "F_FUNC(dggbal,DGGBAL)"(char *job, int *n, d *a, int *lda, d *b, int *ldb, int *ilo, int *ihi, d *lscale, d *rscale, d *work, int *info) nogil
cdef void dggbal(char *job, int *n, d *a, int *lda, d *b, int *ldb, int *ilo, int *ihi, d *lscale, d *rscale, d *work, int *info) nogil:
    _fortran_dggbal(job, n, a, lda, b, ldb, ilo, ihi, lscale, rscale, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgges "F_FUNC(dgges,DGGES)"(char *jobvsl, char *jobvsr, char *sort, dselect3 *selctg, int *n, d *a, int *lda, d *b, int *ldb, int *sdim, d *alphar, d *alphai, d *beta, d *vsl, int *ldvsl, d *vsr, int *ldvsr, d *work, int *lwork, bint *bwork, int *info) nogil
cdef void dgges(char *jobvsl, char *jobvsr, char *sort, dselect3 *selctg, int *n, d *a, int *lda, d *b, int *ldb, int *sdim, d *alphar, d *alphai, d *beta, d *vsl, int *ldvsl, d *vsr, int *ldvsr, d *work, int *lwork, bint *bwork, int *info) nogil:
    _fortran_dgges(jobvsl, jobvsr, sort, selctg, n, a, lda, b, ldb, sdim, alphar, alphai, beta, vsl, ldvsl, vsr, ldvsr, work, lwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dggesx "F_FUNC(dggesx,DGGESX)"(char *jobvsl, char *jobvsr, char *sort, dselect3 *selctg, char *sense, int *n, d *a, int *lda, d *b, int *ldb, int *sdim, d *alphar, d *alphai, d *beta, d *vsl, int *ldvsl, d *vsr, int *ldvsr, d *rconde, d *rcondv, d *work, int *lwork, int *iwork, int *liwork, bint *bwork, int *info) nogil
cdef void dggesx(char *jobvsl, char *jobvsr, char *sort, dselect3 *selctg, char *sense, int *n, d *a, int *lda, d *b, int *ldb, int *sdim, d *alphar, d *alphai, d *beta, d *vsl, int *ldvsl, d *vsr, int *ldvsr, d *rconde, d *rcondv, d *work, int *lwork, int *iwork, int *liwork, bint *bwork, int *info) nogil:
    _fortran_dggesx(jobvsl, jobvsr, sort, selctg, sense, n, a, lda, b, ldb, sdim, alphar, alphai, beta, vsl, ldvsl, vsr, ldvsr, rconde, rcondv, work, lwork, iwork, liwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dggev "F_FUNC(dggev,DGGEV)"(char *jobvl, char *jobvr, int *n, d *a, int *lda, d *b, int *ldb, d *alphar, d *alphai, d *beta, d *vl, int *ldvl, d *vr, int *ldvr, d *work, int *lwork, int *info) nogil
cdef void dggev(char *jobvl, char *jobvr, int *n, d *a, int *lda, d *b, int *ldb, d *alphar, d *alphai, d *beta, d *vl, int *ldvl, d *vr, int *ldvr, d *work, int *lwork, int *info) nogil:
    _fortran_dggev(jobvl, jobvr, n, a, lda, b, ldb, alphar, alphai, beta, vl, ldvl, vr, ldvr, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dggevx "F_FUNC(dggevx,DGGEVX)"(char *balanc, char *jobvl, char *jobvr, char *sense, int *n, d *a, int *lda, d *b, int *ldb, d *alphar, d *alphai, d *beta, d *vl, int *ldvl, d *vr, int *ldvr, int *ilo, int *ihi, d *lscale, d *rscale, d *abnrm, d *bbnrm, d *rconde, d *rcondv, d *work, int *lwork, int *iwork, bint *bwork, int *info) nogil
cdef void dggevx(char *balanc, char *jobvl, char *jobvr, char *sense, int *n, d *a, int *lda, d *b, int *ldb, d *alphar, d *alphai, d *beta, d *vl, int *ldvl, d *vr, int *ldvr, int *ilo, int *ihi, d *lscale, d *rscale, d *abnrm, d *bbnrm, d *rconde, d *rcondv, d *work, int *lwork, int *iwork, bint *bwork, int *info) nogil:
    _fortran_dggevx(balanc, jobvl, jobvr, sense, n, a, lda, b, ldb, alphar, alphai, beta, vl, ldvl, vr, ldvr, ilo, ihi, lscale, rscale, abnrm, bbnrm, rconde, rcondv, work, lwork, iwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dggglm "F_FUNC(dggglm,DGGGLM)"(int *n, int *m, int *p, d *a, int *lda, d *b, int *ldb, d *d, d *x, d *y, d *work, int *lwork, int *info) nogil
cdef void dggglm(int *n, int *m, int *p, d *a, int *lda, d *b, int *ldb, d *d, d *x, d *y, d *work, int *lwork, int *info) nogil:
    _fortran_dggglm(n, m, p, a, lda, b, ldb, d, x, y, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgghrd "F_FUNC(dgghrd,DGGHRD)"(char *compq, char *compz, int *n, int *ilo, int *ihi, d *a, int *lda, d *b, int *ldb, d *q, int *ldq, d *z, int *ldz, int *info) nogil
cdef void dgghrd(char *compq, char *compz, int *n, int *ilo, int *ihi, d *a, int *lda, d *b, int *ldb, d *q, int *ldq, d *z, int *ldz, int *info) nogil:
    _fortran_dgghrd(compq, compz, n, ilo, ihi, a, lda, b, ldb, q, ldq, z, ldz, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgglse "F_FUNC(dgglse,DGGLSE)"(int *m, int *n, int *p, d *a, int *lda, d *b, int *ldb, d *c, d *d, d *x, d *work, int *lwork, int *info) nogil
cdef void dgglse(int *m, int *n, int *p, d *a, int *lda, d *b, int *ldb, d *c, d *d, d *x, d *work, int *lwork, int *info) nogil:
    _fortran_dgglse(m, n, p, a, lda, b, ldb, c, d, x, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dggqrf "F_FUNC(dggqrf,DGGQRF)"(int *n, int *m, int *p, d *a, int *lda, d *taua, d *b, int *ldb, d *taub, d *work, int *lwork, int *info) nogil
cdef void dggqrf(int *n, int *m, int *p, d *a, int *lda, d *taua, d *b, int *ldb, d *taub, d *work, int *lwork, int *info) nogil:
    _fortran_dggqrf(n, m, p, a, lda, taua, b, ldb, taub, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dggrqf "F_FUNC(dggrqf,DGGRQF)"(int *m, int *p, int *n, d *a, int *lda, d *taua, d *b, int *ldb, d *taub, d *work, int *lwork, int *info) nogil
cdef void dggrqf(int *m, int *p, int *n, d *a, int *lda, d *taua, d *b, int *ldb, d *taub, d *work, int *lwork, int *info) nogil:
    _fortran_dggrqf(m, p, n, a, lda, taua, b, ldb, taub, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dggsvd "F_FUNC(dggsvd,DGGSVD)"(char *jobu, char *jobv, char *jobq, int *m, int *n, int *p, int *k, int *l, d *a, int *lda, d *b, int *ldb, d *alpha, d *beta, d *u, int *ldu, d *v, int *ldv, d *q, int *ldq, d *work, int *iwork, int *info) nogil
cdef void dggsvd(char *jobu, char *jobv, char *jobq, int *m, int *n, int *p, int *k, int *l, d *a, int *lda, d *b, int *ldb, d *alpha, d *beta, d *u, int *ldu, d *v, int *ldv, d *q, int *ldq, d *work, int *iwork, int *info) nogil:
    _fortran_dggsvd(jobu, jobv, jobq, m, n, p, k, l, a, lda, b, ldb, alpha, beta, u, ldu, v, ldv, q, ldq, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dggsvp "F_FUNC(dggsvp,DGGSVP)"(char *jobu, char *jobv, char *jobq, int *m, int *p, int *n, d *a, int *lda, d *b, int *ldb, d *tola, d *tolb, int *k, int *l, d *u, int *ldu, d *v, int *ldv, d *q, int *ldq, int *iwork, d *tau, d *work, int *info) nogil
cdef void dggsvp(char *jobu, char *jobv, char *jobq, int *m, int *p, int *n, d *a, int *lda, d *b, int *ldb, d *tola, d *tolb, int *k, int *l, d *u, int *ldu, d *v, int *ldv, d *q, int *ldq, int *iwork, d *tau, d *work, int *info) nogil:
    _fortran_dggsvp(jobu, jobv, jobq, m, p, n, a, lda, b, ldb, tola, tolb, k, l, u, ldu, v, ldv, q, ldq, iwork, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgtcon "F_FUNC(dgtcon,DGTCON)"(char *norm, int *n, d *dl, d *d, d *du, d *du2, int *ipiv, d *anorm, d *rcond, d *work, int *iwork, int *info) nogil
cdef void dgtcon(char *norm, int *n, d *dl, d *d, d *du, d *du2, int *ipiv, d *anorm, d *rcond, d *work, int *iwork, int *info) nogil:
    _fortran_dgtcon(norm, n, dl, d, du, du2, ipiv, anorm, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgtrfs "F_FUNC(dgtrfs,DGTRFS)"(char *trans, int *n, int *nrhs, d *dl, d *d, d *du, d *dlf, d *df, d *duf, d *du2, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dgtrfs(char *trans, int *n, int *nrhs, d *dl, d *d, d *du, d *dlf, d *df, d *duf, d *du2, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dgtrfs(trans, n, nrhs, dl, d, du, dlf, df, duf, du2, ipiv, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgtsv "F_FUNC(dgtsv,DGTSV)"(int *n, int *nrhs, d *dl, d *d, d *du, d *b, int *ldb, int *info) nogil
cdef void dgtsv(int *n, int *nrhs, d *dl, d *d, d *du, d *b, int *ldb, int *info) nogil:
    _fortran_dgtsv(n, nrhs, dl, d, du, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgtsvx "F_FUNC(dgtsvx,DGTSVX)"(char *fact, char *trans, int *n, int *nrhs, d *dl, d *d, d *du, d *dlf, d *df, d *duf, d *du2, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dgtsvx(char *fact, char *trans, int *n, int *nrhs, d *dl, d *d, d *du, d *dlf, d *df, d *duf, d *du2, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dgtsvx(fact, trans, n, nrhs, dl, d, du, dlf, df, duf, du2, ipiv, b, ldb, x, ldx, rcond, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgttrf "F_FUNC(dgttrf,DGTTRF)"(int *n, d *dl, d *d, d *du, d *du2, int *ipiv, int *info) nogil
cdef void dgttrf(int *n, d *dl, d *d, d *du, d *du2, int *ipiv, int *info) nogil:
    _fortran_dgttrf(n, dl, d, du, du2, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgttrs "F_FUNC(dgttrs,DGTTRS)"(char *trans, int *n, int *nrhs, d *dl, d *d, d *du, d *du2, int *ipiv, d *b, int *ldb, int *info) nogil
cdef void dgttrs(char *trans, int *n, int *nrhs, d *dl, d *d, d *du, d *du2, int *ipiv, d *b, int *ldb, int *info) nogil:
    _fortran_dgttrs(trans, n, nrhs, dl, d, du, du2, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dgtts2 "F_FUNC(dgtts2,DGTTS2)"(int *itrans, int *n, int *nrhs, d *dl, d *d, d *du, d *du2, int *ipiv, d *b, int *ldb) nogil
cdef void dgtts2(int *itrans, int *n, int *nrhs, d *dl, d *d, d *du, d *du2, int *ipiv, d *b, int *ldb) nogil:
    _fortran_dgtts2(itrans, n, nrhs, dl, d, du, du2, ipiv, b, ldb)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dhgeqz "F_FUNC(dhgeqz,DHGEQZ)"(char *job, char *compq, char *compz, int *n, int *ilo, int *ihi, d *h, int *ldh, d *t, int *ldt, d *alphar, d *alphai, d *beta, d *q, int *ldq, d *z, int *ldz, d *work, int *lwork, int *info) nogil
cdef void dhgeqz(char *job, char *compq, char *compz, int *n, int *ilo, int *ihi, d *h, int *ldh, d *t, int *ldt, d *alphar, d *alphai, d *beta, d *q, int *ldq, d *z, int *ldz, d *work, int *lwork, int *info) nogil:
    _fortran_dhgeqz(job, compq, compz, n, ilo, ihi, h, ldh, t, ldt, alphar, alphai, beta, q, ldq, z, ldz, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dhsein "F_FUNC(dhsein,DHSEIN)"(char *side, char *eigsrc, char *initv, bint *select, int *n, d *h, int *ldh, d *wr, d *wi, d *vl, int *ldvl, d *vr, int *ldvr, int *mm, int *m, d *work, int *ifaill, int *ifailr, int *info) nogil
cdef void dhsein(char *side, char *eigsrc, char *initv, bint *select, int *n, d *h, int *ldh, d *wr, d *wi, d *vl, int *ldvl, d *vr, int *ldvr, int *mm, int *m, d *work, int *ifaill, int *ifailr, int *info) nogil:
    _fortran_dhsein(side, eigsrc, initv, select, n, h, ldh, wr, wi, vl, ldvl, vr, ldvr, mm, m, work, ifaill, ifailr, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dhseqr "F_FUNC(dhseqr,DHSEQR)"(char *job, char *compz, int *n, int *ilo, int *ihi, d *h, int *ldh, d *wr, d *wi, d *z, int *ldz, d *work, int *lwork, int *info) nogil
cdef void dhseqr(char *job, char *compz, int *n, int *ilo, int *ihi, d *h, int *ldh, d *wr, d *wi, d *z, int *ldz, d *work, int *lwork, int *info) nogil:
    _fortran_dhseqr(job, compz, n, ilo, ihi, h, ldh, wr, wi, z, ldz, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dlacn2 "F_FUNC(dlacn2,DLACN2)"(int *n, d *v, d *x, int *isgn, d *est, int *kase, int *isave) nogil
cdef void dlacn2(int *n, d *v, d *x, int *isgn, d *est, int *kase, int *isave) nogil:
    _fortran_dlacn2(n, v, x, isgn, est, kase, isave)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dlacon "F_FUNC(dlacon,DLACON)"(int *n, d *v, d *x, int *isgn, d *est, int *kase) nogil
cdef void dlacon(int *n, d *v, d *x, int *isgn, d *est, int *kase) nogil:
    _fortran_dlacon(n, v, x, isgn, est, kase)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dlanv2 "F_FUNC(dlanv2,DLANV2)"(d *a, d *b, d *c, d *d, d *rt1r, d *rt1i, d *rt2r, d *rt2i, d *cs, d *sn) nogil
cdef void dlanv2(d *a, d *b, d *c, d *d, d *rt1r, d *rt1i, d *rt2r, d *rt2i, d *cs, d *sn) nogil:
    _fortran_dlanv2(a, b, c, d, rt1r, rt1i, rt2r, rt2i, cs, sn)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dlarf "F_FUNC(dlarf,DLARF)"(char *side, int *m, int *n, d *v, int *incv, d *tau, d *c, int *ldc, d *work) nogil
cdef void dlarf(char *side, int *m, int *n, d *v, int *incv, d *tau, d *c, int *ldc, d *work) nogil:
    _fortran_dlarf(side, m, n, v, incv, tau, c, ldc, work)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dlarz "F_FUNC(dlarz,DLARZ)"(char *side, int *m, int *n, int *l, d *v, int *incv, d *tau, d *c, int *ldc, d *work) nogil
cdef void dlarz(char *side, int *m, int *n, int *l, d *v, int *incv, d *tau, d *c, int *ldc, d *work) nogil:
    _fortran_dlarz(side, m, n, l, v, incv, tau, c, ldc, work)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dlaswp "F_FUNC(dlaswp,DLASWP)"(int *n, d *a, int *lda, int *k1, int *k2, int *ipiv, int *incx) nogil
cdef void dlaswp(int *n, d *a, int *lda, int *k1, int *k2, int *ipiv, int *incx) nogil:
    _fortran_dlaswp(n, a, lda, k1, k2, ipiv, incx)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dlauum "F_FUNC(dlauum,DLAUUM)"(char *uplo, int *n, d *a, int *lda, int *info) nogil
cdef void dlauum(char *uplo, int *n, d *a, int *lda, int *info) nogil:
    _fortran_dlauum(uplo, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dopgtr "F_FUNC(dopgtr,DOPGTR)"(char *uplo, int *n, d *ap, d *tau, d *q, int *ldq, d *work, int *info) nogil
cdef void dopgtr(char *uplo, int *n, d *ap, d *tau, d *q, int *ldq, d *work, int *info) nogil:
    _fortran_dopgtr(uplo, n, ap, tau, q, ldq, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dopmtr "F_FUNC(dopmtr,DOPMTR)"(char *side, char *uplo, char *trans, int *m, int *n, d *ap, d *tau, d *c, int *ldc, d *work, int *info) nogil
cdef void dopmtr(char *side, char *uplo, char *trans, int *m, int *n, d *ap, d *tau, d *c, int *ldc, d *work, int *info) nogil:
    _fortran_dopmtr(side, uplo, trans, m, n, ap, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dorg2l "F_FUNC(dorg2l,DORG2L)"(int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *info) nogil
cdef void dorg2l(int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *info) nogil:
    _fortran_dorg2l(m, n, k, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dorg2r "F_FUNC(dorg2r,DORG2R)"(int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *info) nogil
cdef void dorg2r(int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *info) nogil:
    _fortran_dorg2r(m, n, k, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dorgbr "F_FUNC(dorgbr,DORGBR)"(char *vect, int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil
cdef void dorgbr(char *vect, int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil:
    _fortran_dorgbr(vect, m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dorghr "F_FUNC(dorghr,DORGHR)"(int *n, int *ilo, int *ihi, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil
cdef void dorghr(int *n, int *ilo, int *ihi, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil:
    _fortran_dorghr(n, ilo, ihi, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dorgl2 "F_FUNC(dorgl2,DORGL2)"(int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *info) nogil
cdef void dorgl2(int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *info) nogil:
    _fortran_dorgl2(m, n, k, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dorglq "F_FUNC(dorglq,DORGLQ)"(int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil
cdef void dorglq(int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil:
    _fortran_dorglq(m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dorgql "F_FUNC(dorgql,DORGQL)"(int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil
cdef void dorgql(int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil:
    _fortran_dorgql(m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dorgqr "F_FUNC(dorgqr,DORGQR)"(int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil
cdef void dorgqr(int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil:
    _fortran_dorgqr(m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dorgr2 "F_FUNC(dorgr2,DORGR2)"(int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *info) nogil
cdef void dorgr2(int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *info) nogil:
    _fortran_dorgr2(m, n, k, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dorgrq "F_FUNC(dorgrq,DORGRQ)"(int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil
cdef void dorgrq(int *m, int *n, int *k, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil:
    _fortran_dorgrq(m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dorgtr "F_FUNC(dorgtr,DORGTR)"(char *uplo, int *n, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil
cdef void dorgtr(char *uplo, int *n, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil:
    _fortran_dorgtr(uplo, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dorm2l "F_FUNC(dorm2l,DORM2L)"(char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *info) nogil
cdef void dorm2l(char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *info) nogil:
    _fortran_dorm2l(side, trans, m, n, k, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dorm2r "F_FUNC(dorm2r,DORM2R)"(char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *info) nogil
cdef void dorm2r(char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *info) nogil:
    _fortran_dorm2r(side, trans, m, n, k, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dormbr "F_FUNC(dormbr,DORMBR)"(char *vect, char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *lwork, int *info) nogil
cdef void dormbr(char *vect, char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *lwork, int *info) nogil:
    _fortran_dormbr(vect, side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dormhr "F_FUNC(dormhr,DORMHR)"(char *side, char *trans, int *m, int *n, int *ilo, int *ihi, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *lwork, int *info) nogil
cdef void dormhr(char *side, char *trans, int *m, int *n, int *ilo, int *ihi, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *lwork, int *info) nogil:
    _fortran_dormhr(side, trans, m, n, ilo, ihi, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dorml2 "F_FUNC(dorml2,DORML2)"(char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *info) nogil
cdef void dorml2(char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *info) nogil:
    _fortran_dorml2(side, trans, m, n, k, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dormlq "F_FUNC(dormlq,DORMLQ)"(char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *lwork, int *info) nogil
cdef void dormlq(char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *lwork, int *info) nogil:
    _fortran_dormlq(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dormql "F_FUNC(dormql,DORMQL)"(char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *lwork, int *info) nogil
cdef void dormql(char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *lwork, int *info) nogil:
    _fortran_dormql(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dormqr "F_FUNC(dormqr,DORMQR)"(char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *lwork, int *info) nogil
cdef void dormqr(char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *lwork, int *info) nogil:
    _fortran_dormqr(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dormr2 "F_FUNC(dormr2,DORMR2)"(char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *info) nogil
cdef void dormr2(char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *info) nogil:
    _fortran_dormr2(side, trans, m, n, k, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dormr3 "F_FUNC(dormr3,DORMR3)"(char *side, char *trans, int *m, int *n, int *k, int *l, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *info) nogil
cdef void dormr3(char *side, char *trans, int *m, int *n, int *k, int *l, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *info) nogil:
    _fortran_dormr3(side, trans, m, n, k, l, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dormrq "F_FUNC(dormrq,DORMRQ)"(char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *lwork, int *info) nogil
cdef void dormrq(char *side, char *trans, int *m, int *n, int *k, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *lwork, int *info) nogil:
    _fortran_dormrq(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dormrz "F_FUNC(dormrz,DORMRZ)"(char *side, char *trans, int *m, int *n, int *k, int *l, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *lwork, int *info) nogil
cdef void dormrz(char *side, char *trans, int *m, int *n, int *k, int *l, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *lwork, int *info) nogil:
    _fortran_dormrz(side, trans, m, n, k, l, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dormtr "F_FUNC(dormtr,DORMTR)"(char *side, char *uplo, char *trans, int *m, int *n, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *lwork, int *info) nogil
cdef void dormtr(char *side, char *uplo, char *trans, int *m, int *n, d *a, int *lda, d *tau, d *c, int *ldc, d *work, int *lwork, int *info) nogil:
    _fortran_dormtr(side, uplo, trans, m, n, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpbcon "F_FUNC(dpbcon,DPBCON)"(char *uplo, int *n, int *kd, d *ab, int *ldab, d *anorm, d *rcond, d *work, int *iwork, int *info) nogil
cdef void dpbcon(char *uplo, int *n, int *kd, d *ab, int *ldab, d *anorm, d *rcond, d *work, int *iwork, int *info) nogil:
    _fortran_dpbcon(uplo, n, kd, ab, ldab, anorm, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpbequ "F_FUNC(dpbequ,DPBEQU)"(char *uplo, int *n, int *kd, d *ab, int *ldab, d *s, d *scond, d *amax, int *info) nogil
cdef void dpbequ(char *uplo, int *n, int *kd, d *ab, int *ldab, d *s, d *scond, d *amax, int *info) nogil:
    _fortran_dpbequ(uplo, n, kd, ab, ldab, s, scond, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpbrfs "F_FUNC(dpbrfs,DPBRFS)"(char *uplo, int *n, int *kd, int *nrhs, d *ab, int *ldab, d *afb, int *ldafb, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dpbrfs(char *uplo, int *n, int *kd, int *nrhs, d *ab, int *ldab, d *afb, int *ldafb, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dpbrfs(uplo, n, kd, nrhs, ab, ldab, afb, ldafb, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpbstf "F_FUNC(dpbstf,DPBSTF)"(char *uplo, int *n, int *kd, d *ab, int *ldab, int *info) nogil
cdef void dpbstf(char *uplo, int *n, int *kd, d *ab, int *ldab, int *info) nogil:
    _fortran_dpbstf(uplo, n, kd, ab, ldab, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpbsv "F_FUNC(dpbsv,DPBSV)"(char *uplo, int *n, int *kd, int *nrhs, d *ab, int *ldab, d *b, int *ldb, int *info) nogil
cdef void dpbsv(char *uplo, int *n, int *kd, int *nrhs, d *ab, int *ldab, d *b, int *ldb, int *info) nogil:
    _fortran_dpbsv(uplo, n, kd, nrhs, ab, ldab, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpbsvx "F_FUNC(dpbsvx,DPBSVX)"(char *fact, char *uplo, int *n, int *kd, int *nrhs, d *ab, int *ldab, d *afb, int *ldafb, char *equed, d *s, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dpbsvx(char *fact, char *uplo, int *n, int *kd, int *nrhs, d *ab, int *ldab, d *afb, int *ldafb, char *equed, d *s, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dpbsvx(fact, uplo, n, kd, nrhs, ab, ldab, afb, ldafb, equed, s, b, ldb, x, ldx, rcond, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpbtf2 "F_FUNC(dpbtf2,DPBTF2)"(char *uplo, int *n, int *kd, d *ab, int *ldab, int *info) nogil
cdef void dpbtf2(char *uplo, int *n, int *kd, d *ab, int *ldab, int *info) nogil:
    _fortran_dpbtf2(uplo, n, kd, ab, ldab, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpbtrf "F_FUNC(dpbtrf,DPBTRF)"(char *uplo, int *n, int *kd, d *ab, int *ldab, int *info) nogil
cdef void dpbtrf(char *uplo, int *n, int *kd, d *ab, int *ldab, int *info) nogil:
    _fortran_dpbtrf(uplo, n, kd, ab, ldab, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpbtrs "F_FUNC(dpbtrs,DPBTRS)"(char *uplo, int *n, int *kd, int *nrhs, d *ab, int *ldab, d *b, int *ldb, int *info) nogil
cdef void dpbtrs(char *uplo, int *n, int *kd, int *nrhs, d *ab, int *ldab, d *b, int *ldb, int *info) nogil:
    _fortran_dpbtrs(uplo, n, kd, nrhs, ab, ldab, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpocon "F_FUNC(dpocon,DPOCON)"(char *uplo, int *n, d *a, int *lda, d *anorm, d *rcond, d *work, int *iwork, int *info) nogil
cdef void dpocon(char *uplo, int *n, d *a, int *lda, d *anorm, d *rcond, d *work, int *iwork, int *info) nogil:
    _fortran_dpocon(uplo, n, a, lda, anorm, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpoequ "F_FUNC(dpoequ,DPOEQU)"(int *n, d *a, int *lda, d *s, d *scond, d *amax, int *info) nogil
cdef void dpoequ(int *n, d *a, int *lda, d *s, d *scond, d *amax, int *info) nogil:
    _fortran_dpoequ(n, a, lda, s, scond, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dporfs "F_FUNC(dporfs,DPORFS)"(char *uplo, int *n, int *nrhs, d *a, int *lda, d *af, int *ldaf, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dporfs(char *uplo, int *n, int *nrhs, d *a, int *lda, d *af, int *ldaf, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dporfs(uplo, n, nrhs, a, lda, af, ldaf, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dposv "F_FUNC(dposv,DPOSV)"(char *uplo, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, int *info) nogil
cdef void dposv(char *uplo, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, int *info) nogil:
    _fortran_dposv(uplo, n, nrhs, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dposvx "F_FUNC(dposvx,DPOSVX)"(char *fact, char *uplo, int *n, int *nrhs, d *a, int *lda, d *af, int *ldaf, char *equed, d *s, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dposvx(char *fact, char *uplo, int *n, int *nrhs, d *a, int *lda, d *af, int *ldaf, char *equed, d *s, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dposvx(fact, uplo, n, nrhs, a, lda, af, ldaf, equed, s, b, ldb, x, ldx, rcond, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpotf2 "F_FUNC(dpotf2,DPOTF2)"(char *uplo, int *n, d *a, int *lda, int *info) nogil
cdef void dpotf2(char *uplo, int *n, d *a, int *lda, int *info) nogil:
    _fortran_dpotf2(uplo, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpotrf "F_FUNC(dpotrf,DPOTRF)"(char *uplo, int *n, d *a, int *lda, int *info) nogil
cdef void dpotrf(char *uplo, int *n, d *a, int *lda, int *info) nogil:
    _fortran_dpotrf(uplo, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpotri "F_FUNC(dpotri,DPOTRI)"(char *uplo, int *n, d *a, int *lda, int *info) nogil
cdef void dpotri(char *uplo, int *n, d *a, int *lda, int *info) nogil:
    _fortran_dpotri(uplo, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpotrs "F_FUNC(dpotrs,DPOTRS)"(char *uplo, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, int *info) nogil
cdef void dpotrs(char *uplo, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, int *info) nogil:
    _fortran_dpotrs(uplo, n, nrhs, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dppcon "F_FUNC(dppcon,DPPCON)"(char *uplo, int *n, d *ap, d *anorm, d *rcond, d *work, int *iwork, int *info) nogil
cdef void dppcon(char *uplo, int *n, d *ap, d *anorm, d *rcond, d *work, int *iwork, int *info) nogil:
    _fortran_dppcon(uplo, n, ap, anorm, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dppequ "F_FUNC(dppequ,DPPEQU)"(char *uplo, int *n, d *ap, d *s, d *scond, d *amax, int *info) nogil
cdef void dppequ(char *uplo, int *n, d *ap, d *s, d *scond, d *amax, int *info) nogil:
    _fortran_dppequ(uplo, n, ap, s, scond, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpprfs "F_FUNC(dpprfs,DPPRFS)"(char *uplo, int *n, int *nrhs, d *ap, d *afp, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dpprfs(char *uplo, int *n, int *nrhs, d *ap, d *afp, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dpprfs(uplo, n, nrhs, ap, afp, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dppsv "F_FUNC(dppsv,DPPSV)"(char *uplo, int *n, int *nrhs, d *ap, d *b, int *ldb, int *info) nogil
cdef void dppsv(char *uplo, int *n, int *nrhs, d *ap, d *b, int *ldb, int *info) nogil:
    _fortran_dppsv(uplo, n, nrhs, ap, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dppsvx "F_FUNC(dppsvx,DPPSVX)"(char *fact, char *uplo, int *n, int *nrhs, d *ap, d *afp, char *equed, d *s, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dppsvx(char *fact, char *uplo, int *n, int *nrhs, d *ap, d *afp, char *equed, d *s, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dppsvx(fact, uplo, n, nrhs, ap, afp, equed, s, b, ldb, x, ldx, rcond, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpptrf "F_FUNC(dpptrf,DPPTRF)"(char *uplo, int *n, d *ap, int *info) nogil
cdef void dpptrf(char *uplo, int *n, d *ap, int *info) nogil:
    _fortran_dpptrf(uplo, n, ap, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpptri "F_FUNC(dpptri,DPPTRI)"(char *uplo, int *n, d *ap, int *info) nogil
cdef void dpptri(char *uplo, int *n, d *ap, int *info) nogil:
    _fortran_dpptri(uplo, n, ap, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpptrs "F_FUNC(dpptrs,DPPTRS)"(char *uplo, int *n, int *nrhs, d *ap, d *b, int *ldb, int *info) nogil
cdef void dpptrs(char *uplo, int *n, int *nrhs, d *ap, d *b, int *ldb, int *info) nogil:
    _fortran_dpptrs(uplo, n, nrhs, ap, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dptcon "F_FUNC(dptcon,DPTCON)"(int *n, d *d, d *e, d *anorm, d *rcond, d *work, int *info) nogil
cdef void dptcon(int *n, d *d, d *e, d *anorm, d *rcond, d *work, int *info) nogil:
    _fortran_dptcon(n, d, e, anorm, rcond, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpteqr "F_FUNC(dpteqr,DPTEQR)"(char *compz, int *n, d *d, d *e, d *z, int *ldz, d *work, int *info) nogil
cdef void dpteqr(char *compz, int *n, d *d, d *e, d *z, int *ldz, d *work, int *info) nogil:
    _fortran_dpteqr(compz, n, d, e, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dptrfs "F_FUNC(dptrfs,DPTRFS)"(int *n, int *nrhs, d *d, d *e, d *df, d *ef, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *info) nogil
cdef void dptrfs(int *n, int *nrhs, d *d, d *e, d *df, d *ef, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *info) nogil:
    _fortran_dptrfs(n, nrhs, d, e, df, ef, b, ldb, x, ldx, ferr, berr, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dptsv "F_FUNC(dptsv,DPTSV)"(int *n, int *nrhs, d *d, d *e, d *b, int *ldb, int *info) nogil
cdef void dptsv(int *n, int *nrhs, d *d, d *e, d *b, int *ldb, int *info) nogil:
    _fortran_dptsv(n, nrhs, d, e, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dptsvx "F_FUNC(dptsvx,DPTSVX)"(char *fact, int *n, int *nrhs, d *d, d *e, d *df, d *ef, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *info) nogil
cdef void dptsvx(char *fact, int *n, int *nrhs, d *d, d *e, d *df, d *ef, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *info) nogil:
    _fortran_dptsvx(fact, n, nrhs, d, e, df, ef, b, ldb, x, ldx, rcond, ferr, berr, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpttrf "F_FUNC(dpttrf,DPTTRF)"(int *n, d *d, d *e, int *info) nogil
cdef void dpttrf(int *n, d *d, d *e, int *info) nogil:
    _fortran_dpttrf(n, d, e, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dpttrs "F_FUNC(dpttrs,DPTTRS)"(int *n, int *nrhs, d *d, d *e, d *b, int *ldb, int *info) nogil
cdef void dpttrs(int *n, int *nrhs, d *d, d *e, d *b, int *ldb, int *info) nogil:
    _fortran_dpttrs(n, nrhs, d, e, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dptts2 "F_FUNC(dptts2,DPTTS2)"(int *n, int *nrhs, d *d, d *e, d *b, int *ldb) nogil
cdef void dptts2(int *n, int *nrhs, d *d, d *e, d *b, int *ldb) nogil:
    _fortran_dptts2(n, nrhs, d, e, b, ldb)

cdef extern from "_lapack_subroutines.h":
    void _fortran_drscl "F_FUNC(drscl,DRSCL)"(int *n, d *sa, d *sx, int *incx) nogil
cdef void drscl(int *n, d *sa, d *sx, int *incx) nogil:
    _fortran_drscl(n, sa, sx, incx)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsbev "F_FUNC(dsbev,DSBEV)"(char *jobz, char *uplo, int *n, int *kd, d *ab, int *ldab, d *w, d *z, int *ldz, d *work, int *info) nogil
cdef void dsbev(char *jobz, char *uplo, int *n, int *kd, d *ab, int *ldab, d *w, d *z, int *ldz, d *work, int *info) nogil:
    _fortran_dsbev(jobz, uplo, n, kd, ab, ldab, w, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsbevd "F_FUNC(dsbevd,DSBEVD)"(char *jobz, char *uplo, int *n, int *kd, d *ab, int *ldab, d *w, d *z, int *ldz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void dsbevd(char *jobz, char *uplo, int *n, int *kd, d *ab, int *ldab, d *w, d *z, int *ldz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_dsbevd(jobz, uplo, n, kd, ab, ldab, w, z, ldz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsbevx "F_FUNC(dsbevx,DSBEVX)"(char *jobz, char *range, char *uplo, int *n, int *kd, d *ab, int *ldab, d *q, int *ldq, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, d *work, int *iwork, int *ifail, int *info) nogil
cdef void dsbevx(char *jobz, char *range, char *uplo, int *n, int *kd, d *ab, int *ldab, d *q, int *ldq, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, d *work, int *iwork, int *ifail, int *info) nogil:
    _fortran_dsbevx(jobz, range, uplo, n, kd, ab, ldab, q, ldq, vl, vu, il, iu, abstol, m, w, z, ldz, work, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsbgst "F_FUNC(dsbgst,DSBGST)"(char *vect, char *uplo, int *n, int *ka, int *kb, d *ab, int *ldab, d *bb, int *ldbb, d *x, int *ldx, d *work, int *info) nogil
cdef void dsbgst(char *vect, char *uplo, int *n, int *ka, int *kb, d *ab, int *ldab, d *bb, int *ldbb, d *x, int *ldx, d *work, int *info) nogil:
    _fortran_dsbgst(vect, uplo, n, ka, kb, ab, ldab, bb, ldbb, x, ldx, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsbgv "F_FUNC(dsbgv,DSBGV)"(char *jobz, char *uplo, int *n, int *ka, int *kb, d *ab, int *ldab, d *bb, int *ldbb, d *w, d *z, int *ldz, d *work, int *info) nogil
cdef void dsbgv(char *jobz, char *uplo, int *n, int *ka, int *kb, d *ab, int *ldab, d *bb, int *ldbb, d *w, d *z, int *ldz, d *work, int *info) nogil:
    _fortran_dsbgv(jobz, uplo, n, ka, kb, ab, ldab, bb, ldbb, w, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsbgvd "F_FUNC(dsbgvd,DSBGVD)"(char *jobz, char *uplo, int *n, int *ka, int *kb, d *ab, int *ldab, d *bb, int *ldbb, d *w, d *z, int *ldz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void dsbgvd(char *jobz, char *uplo, int *n, int *ka, int *kb, d *ab, int *ldab, d *bb, int *ldbb, d *w, d *z, int *ldz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_dsbgvd(jobz, uplo, n, ka, kb, ab, ldab, bb, ldbb, w, z, ldz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsbgvx "F_FUNC(dsbgvx,DSBGVX)"(char *jobz, char *range, char *uplo, int *n, int *ka, int *kb, d *ab, int *ldab, d *bb, int *ldbb, d *q, int *ldq, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, d *work, int *iwork, int *ifail, int *info) nogil
cdef void dsbgvx(char *jobz, char *range, char *uplo, int *n, int *ka, int *kb, d *ab, int *ldab, d *bb, int *ldbb, d *q, int *ldq, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, d *work, int *iwork, int *ifail, int *info) nogil:
    _fortran_dsbgvx(jobz, range, uplo, n, ka, kb, ab, ldab, bb, ldbb, q, ldq, vl, vu, il, iu, abstol, m, w, z, ldz, work, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsbtrd "F_FUNC(dsbtrd,DSBTRD)"(char *vect, char *uplo, int *n, int *kd, d *ab, int *ldab, d *d, d *e, d *q, int *ldq, d *work, int *info) nogil
cdef void dsbtrd(char *vect, char *uplo, int *n, int *kd, d *ab, int *ldab, d *d, d *e, d *q, int *ldq, d *work, int *info) nogil:
    _fortran_dsbtrd(vect, uplo, n, kd, ab, ldab, d, e, q, ldq, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsgesv "F_FUNC(dsgesv,DSGESV)"(int *n, int *nrhs, d *a, int *lda, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *work, s *swork, int *iter, int *info) nogil
cdef void dsgesv(int *n, int *nrhs, d *a, int *lda, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *work, s *swork, int *iter, int *info) nogil:
    _fortran_dsgesv(n, nrhs, a, lda, ipiv, b, ldb, x, ldx, work, swork, iter, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dspcon "F_FUNC(dspcon,DSPCON)"(char *uplo, int *n, d *ap, int *ipiv, d *anorm, d *rcond, d *work, int *iwork, int *info) nogil
cdef void dspcon(char *uplo, int *n, d *ap, int *ipiv, d *anorm, d *rcond, d *work, int *iwork, int *info) nogil:
    _fortran_dspcon(uplo, n, ap, ipiv, anorm, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dspev "F_FUNC(dspev,DSPEV)"(char *jobz, char *uplo, int *n, d *ap, d *w, d *z, int *ldz, d *work, int *info) nogil
cdef void dspev(char *jobz, char *uplo, int *n, d *ap, d *w, d *z, int *ldz, d *work, int *info) nogil:
    _fortran_dspev(jobz, uplo, n, ap, w, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dspevd "F_FUNC(dspevd,DSPEVD)"(char *jobz, char *uplo, int *n, d *ap, d *w, d *z, int *ldz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void dspevd(char *jobz, char *uplo, int *n, d *ap, d *w, d *z, int *ldz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_dspevd(jobz, uplo, n, ap, w, z, ldz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dspevx "F_FUNC(dspevx,DSPEVX)"(char *jobz, char *range, char *uplo, int *n, d *ap, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, d *work, int *iwork, int *ifail, int *info) nogil
cdef void dspevx(char *jobz, char *range, char *uplo, int *n, d *ap, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, d *work, int *iwork, int *ifail, int *info) nogil:
    _fortran_dspevx(jobz, range, uplo, n, ap, vl, vu, il, iu, abstol, m, w, z, ldz, work, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dspgst "F_FUNC(dspgst,DSPGST)"(int *itype, char *uplo, int *n, d *ap, d *bp, int *info) nogil
cdef void dspgst(int *itype, char *uplo, int *n, d *ap, d *bp, int *info) nogil:
    _fortran_dspgst(itype, uplo, n, ap, bp, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dspgv "F_FUNC(dspgv,DSPGV)"(int *itype, char *jobz, char *uplo, int *n, d *ap, d *bp, d *w, d *z, int *ldz, d *work, int *info) nogil
cdef void dspgv(int *itype, char *jobz, char *uplo, int *n, d *ap, d *bp, d *w, d *z, int *ldz, d *work, int *info) nogil:
    _fortran_dspgv(itype, jobz, uplo, n, ap, bp, w, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dspgvd "F_FUNC(dspgvd,DSPGVD)"(int *itype, char *jobz, char *uplo, int *n, d *ap, d *bp, d *w, d *z, int *ldz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void dspgvd(int *itype, char *jobz, char *uplo, int *n, d *ap, d *bp, d *w, d *z, int *ldz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_dspgvd(itype, jobz, uplo, n, ap, bp, w, z, ldz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dspgvx "F_FUNC(dspgvx,DSPGVX)"(int *itype, char *jobz, char *range, char *uplo, int *n, d *ap, d *bp, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, d *work, int *iwork, int *ifail, int *info) nogil
cdef void dspgvx(int *itype, char *jobz, char *range, char *uplo, int *n, d *ap, d *bp, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, d *work, int *iwork, int *ifail, int *info) nogil:
    _fortran_dspgvx(itype, jobz, range, uplo, n, ap, bp, vl, vu, il, iu, abstol, m, w, z, ldz, work, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsprfs "F_FUNC(dsprfs,DSPRFS)"(char *uplo, int *n, int *nrhs, d *ap, d *afp, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dsprfs(char *uplo, int *n, int *nrhs, d *ap, d *afp, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dsprfs(uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dspsv "F_FUNC(dspsv,DSPSV)"(char *uplo, int *n, int *nrhs, d *ap, int *ipiv, d *b, int *ldb, int *info) nogil
cdef void dspsv(char *uplo, int *n, int *nrhs, d *ap, int *ipiv, d *b, int *ldb, int *info) nogil:
    _fortran_dspsv(uplo, n, nrhs, ap, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dspsvx "F_FUNC(dspsvx,DSPSVX)"(char *fact, char *uplo, int *n, int *nrhs, d *ap, d *afp, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dspsvx(char *fact, char *uplo, int *n, int *nrhs, d *ap, d *afp, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dspsvx(fact, uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx, rcond, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsptrd "F_FUNC(dsptrd,DSPTRD)"(char *uplo, int *n, d *ap, d *d, d *e, d *tau, int *info) nogil
cdef void dsptrd(char *uplo, int *n, d *ap, d *d, d *e, d *tau, int *info) nogil:
    _fortran_dsptrd(uplo, n, ap, d, e, tau, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsptrf "F_FUNC(dsptrf,DSPTRF)"(char *uplo, int *n, d *ap, int *ipiv, int *info) nogil
cdef void dsptrf(char *uplo, int *n, d *ap, int *ipiv, int *info) nogil:
    _fortran_dsptrf(uplo, n, ap, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsptri "F_FUNC(dsptri,DSPTRI)"(char *uplo, int *n, d *ap, int *ipiv, d *work, int *info) nogil
cdef void dsptri(char *uplo, int *n, d *ap, int *ipiv, d *work, int *info) nogil:
    _fortran_dsptri(uplo, n, ap, ipiv, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsptrs "F_FUNC(dsptrs,DSPTRS)"(char *uplo, int *n, int *nrhs, d *ap, int *ipiv, d *b, int *ldb, int *info) nogil
cdef void dsptrs(char *uplo, int *n, int *nrhs, d *ap, int *ipiv, d *b, int *ldb, int *info) nogil:
    _fortran_dsptrs(uplo, n, nrhs, ap, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dstebz "F_FUNC(dstebz,DSTEBZ)"(char *range, char *order, int *n, d *vl, d *vu, int *il, int *iu, d *abstol, d *d, d *e, int *m, int *nsplit, d *w, int *iblock, int *isplit, d *work, int *iwork, int *info) nogil
cdef void dstebz(char *range, char *order, int *n, d *vl, d *vu, int *il, int *iu, d *abstol, d *d, d *e, int *m, int *nsplit, d *w, int *iblock, int *isplit, d *work, int *iwork, int *info) nogil:
    _fortran_dstebz(range, order, n, vl, vu, il, iu, abstol, d, e, m, nsplit, w, iblock, isplit, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dstedc "F_FUNC(dstedc,DSTEDC)"(char *compz, int *n, d *d, d *e, d *z, int *ldz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void dstedc(char *compz, int *n, d *d, d *e, d *z, int *ldz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_dstedc(compz, n, d, e, z, ldz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dstegr "F_FUNC(dstegr,DSTEGR)"(char *jobz, char *range, int *n, d *d, d *e, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, int *isuppz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void dstegr(char *jobz, char *range, int *n, d *d, d *e, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, int *isuppz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_dstegr(jobz, range, n, d, e, vl, vu, il, iu, abstol, m, w, z, ldz, isuppz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dstein "F_FUNC(dstein,DSTEIN)"(int *n, d *d, d *e, int *m, d *w, int *iblock, int *isplit, d *z, int *ldz, d *work, int *iwork, int *ifail, int *info) nogil
cdef void dstein(int *n, d *d, d *e, int *m, d *w, int *iblock, int *isplit, d *z, int *ldz, d *work, int *iwork, int *ifail, int *info) nogil:
    _fortran_dstein(n, d, e, m, w, iblock, isplit, z, ldz, work, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dstemr "F_FUNC(dstemr,DSTEMR)"(char *jobz, char *range, int *n, d *d, d *e, d *vl, d *vu, int *il, int *iu, int *m, d *w, d *z, int *ldz, int *nzc, int *isuppz, bint *tryrac, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void dstemr(char *jobz, char *range, int *n, d *d, d *e, d *vl, d *vu, int *il, int *iu, int *m, d *w, d *z, int *ldz, int *nzc, int *isuppz, bint *tryrac, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_dstemr(jobz, range, n, d, e, vl, vu, il, iu, m, w, z, ldz, nzc, isuppz, tryrac, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsteqr "F_FUNC(dsteqr,DSTEQR)"(char *compz, int *n, d *d, d *e, d *z, int *ldz, d *work, int *info) nogil
cdef void dsteqr(char *compz, int *n, d *d, d *e, d *z, int *ldz, d *work, int *info) nogil:
    _fortran_dsteqr(compz, n, d, e, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsterf "F_FUNC(dsterf,DSTERF)"(int *n, d *d, d *e, int *info) nogil
cdef void dsterf(int *n, d *d, d *e, int *info) nogil:
    _fortran_dsterf(n, d, e, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dstev "F_FUNC(dstev,DSTEV)"(char *jobz, int *n, d *d, d *e, d *z, int *ldz, d *work, int *info) nogil
cdef void dstev(char *jobz, int *n, d *d, d *e, d *z, int *ldz, d *work, int *info) nogil:
    _fortran_dstev(jobz, n, d, e, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dstevd "F_FUNC(dstevd,DSTEVD)"(char *jobz, int *n, d *d, d *e, d *z, int *ldz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void dstevd(char *jobz, int *n, d *d, d *e, d *z, int *ldz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_dstevd(jobz, n, d, e, z, ldz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dstevr "F_FUNC(dstevr,DSTEVR)"(char *jobz, char *range, int *n, d *d, d *e, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, int *isuppz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void dstevr(char *jobz, char *range, int *n, d *d, d *e, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, int *isuppz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_dstevr(jobz, range, n, d, e, vl, vu, il, iu, abstol, m, w, z, ldz, isuppz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dstevx "F_FUNC(dstevx,DSTEVX)"(char *jobz, char *range, int *n, d *d, d *e, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, d *work, int *iwork, int *ifail, int *info) nogil
cdef void dstevx(char *jobz, char *range, int *n, d *d, d *e, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, d *work, int *iwork, int *ifail, int *info) nogil:
    _fortran_dstevx(jobz, range, n, d, e, vl, vu, il, iu, abstol, m, w, z, ldz, work, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsycon "F_FUNC(dsycon,DSYCON)"(char *uplo, int *n, d *a, int *lda, int *ipiv, d *anorm, d *rcond, d *work, int *iwork, int *info) nogil
cdef void dsycon(char *uplo, int *n, d *a, int *lda, int *ipiv, d *anorm, d *rcond, d *work, int *iwork, int *info) nogil:
    _fortran_dsycon(uplo, n, a, lda, ipiv, anorm, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsyev "F_FUNC(dsyev,DSYEV)"(char *jobz, char *uplo, int *n, d *a, int *lda, d *w, d *work, int *lwork, int *info) nogil
cdef void dsyev(char *jobz, char *uplo, int *n, d *a, int *lda, d *w, d *work, int *lwork, int *info) nogil:
    _fortran_dsyev(jobz, uplo, n, a, lda, w, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsyevd "F_FUNC(dsyevd,DSYEVD)"(char *jobz, char *uplo, int *n, d *a, int *lda, d *w, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void dsyevd(char *jobz, char *uplo, int *n, d *a, int *lda, d *w, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_dsyevd(jobz, uplo, n, a, lda, w, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsyevr "F_FUNC(dsyevr,DSYEVR)"(char *jobz, char *range, char *uplo, int *n, d *a, int *lda, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, int *isuppz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void dsyevr(char *jobz, char *range, char *uplo, int *n, d *a, int *lda, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, int *isuppz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_dsyevr(jobz, range, uplo, n, a, lda, vl, vu, il, iu, abstol, m, w, z, ldz, isuppz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsyevx "F_FUNC(dsyevx,DSYEVX)"(char *jobz, char *range, char *uplo, int *n, d *a, int *lda, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, d *work, int *lwork, int *iwork, int *ifail, int *info) nogil
cdef void dsyevx(char *jobz, char *range, char *uplo, int *n, d *a, int *lda, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, d *work, int *lwork, int *iwork, int *ifail, int *info) nogil:
    _fortran_dsyevx(jobz, range, uplo, n, a, lda, vl, vu, il, iu, abstol, m, w, z, ldz, work, lwork, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsygs2 "F_FUNC(dsygs2,DSYGS2)"(int *itype, char *uplo, int *n, d *a, int *lda, d *b, int *ldb, int *info) nogil
cdef void dsygs2(int *itype, char *uplo, int *n, d *a, int *lda, d *b, int *ldb, int *info) nogil:
    _fortran_dsygs2(itype, uplo, n, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsygst "F_FUNC(dsygst,DSYGST)"(int *itype, char *uplo, int *n, d *a, int *lda, d *b, int *ldb, int *info) nogil
cdef void dsygst(int *itype, char *uplo, int *n, d *a, int *lda, d *b, int *ldb, int *info) nogil:
    _fortran_dsygst(itype, uplo, n, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsygv "F_FUNC(dsygv,DSYGV)"(int *itype, char *jobz, char *uplo, int *n, d *a, int *lda, d *b, int *ldb, d *w, d *work, int *lwork, int *info) nogil
cdef void dsygv(int *itype, char *jobz, char *uplo, int *n, d *a, int *lda, d *b, int *ldb, d *w, d *work, int *lwork, int *info) nogil:
    _fortran_dsygv(itype, jobz, uplo, n, a, lda, b, ldb, w, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsygvd "F_FUNC(dsygvd,DSYGVD)"(int *itype, char *jobz, char *uplo, int *n, d *a, int *lda, d *b, int *ldb, d *w, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void dsygvd(int *itype, char *jobz, char *uplo, int *n, d *a, int *lda, d *b, int *ldb, d *w, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_dsygvd(itype, jobz, uplo, n, a, lda, b, ldb, w, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsygvx "F_FUNC(dsygvx,DSYGVX)"(int *itype, char *jobz, char *range, char *uplo, int *n, d *a, int *lda, d *b, int *ldb, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, d *work, int *lwork, int *iwork, int *ifail, int *info) nogil
cdef void dsygvx(int *itype, char *jobz, char *range, char *uplo, int *n, d *a, int *lda, d *b, int *ldb, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, d *z, int *ldz, d *work, int *lwork, int *iwork, int *ifail, int *info) nogil:
    _fortran_dsygvx(itype, jobz, range, uplo, n, a, lda, b, ldb, vl, vu, il, iu, abstol, m, w, z, ldz, work, lwork, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsyrfs "F_FUNC(dsyrfs,DSYRFS)"(char *uplo, int *n, int *nrhs, d *a, int *lda, d *af, int *ldaf, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dsyrfs(char *uplo, int *n, int *nrhs, d *a, int *lda, d *af, int *ldaf, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dsyrfs(uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsysv "F_FUNC(dsysv,DSYSV)"(char *uplo, int *n, int *nrhs, d *a, int *lda, int *ipiv, d *b, int *ldb, d *work, int *lwork, int *info) nogil
cdef void dsysv(char *uplo, int *n, int *nrhs, d *a, int *lda, int *ipiv, d *b, int *ldb, d *work, int *lwork, int *info) nogil:
    _fortran_dsysv(uplo, n, nrhs, a, lda, ipiv, b, ldb, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsysvx "F_FUNC(dsysvx,DSYSVX)"(char *fact, char *uplo, int *n, int *nrhs, d *a, int *lda, d *af, int *ldaf, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *lwork, int *iwork, int *info) nogil
cdef void dsysvx(char *fact, char *uplo, int *n, int *nrhs, d *a, int *lda, d *af, int *ldaf, int *ipiv, d *b, int *ldb, d *x, int *ldx, d *rcond, d *ferr, d *berr, d *work, int *lwork, int *iwork, int *info) nogil:
    _fortran_dsysvx(fact, uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb, x, ldx, rcond, ferr, berr, work, lwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsytd2 "F_FUNC(dsytd2,DSYTD2)"(char *uplo, int *n, d *a, int *lda, d *d, d *e, d *tau, int *info) nogil
cdef void dsytd2(char *uplo, int *n, d *a, int *lda, d *d, d *e, d *tau, int *info) nogil:
    _fortran_dsytd2(uplo, n, a, lda, d, e, tau, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsytf2 "F_FUNC(dsytf2,DSYTF2)"(char *uplo, int *n, d *a, int *lda, int *ipiv, int *info) nogil
cdef void dsytf2(char *uplo, int *n, d *a, int *lda, int *ipiv, int *info) nogil:
    _fortran_dsytf2(uplo, n, a, lda, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsytrd "F_FUNC(dsytrd,DSYTRD)"(char *uplo, int *n, d *a, int *lda, d *d, d *e, d *tau, d *work, int *lwork, int *info) nogil
cdef void dsytrd(char *uplo, int *n, d *a, int *lda, d *d, d *e, d *tau, d *work, int *lwork, int *info) nogil:
    _fortran_dsytrd(uplo, n, a, lda, d, e, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsytrf "F_FUNC(dsytrf,DSYTRF)"(char *uplo, int *n, d *a, int *lda, int *ipiv, d *work, int *lwork, int *info) nogil
cdef void dsytrf(char *uplo, int *n, d *a, int *lda, int *ipiv, d *work, int *lwork, int *info) nogil:
    _fortran_dsytrf(uplo, n, a, lda, ipiv, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsytri "F_FUNC(dsytri,DSYTRI)"(char *uplo, int *n, d *a, int *lda, int *ipiv, d *work, int *info) nogil
cdef void dsytri(char *uplo, int *n, d *a, int *lda, int *ipiv, d *work, int *info) nogil:
    _fortran_dsytri(uplo, n, a, lda, ipiv, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dsytrs "F_FUNC(dsytrs,DSYTRS)"(char *uplo, int *n, int *nrhs, d *a, int *lda, int *ipiv, d *b, int *ldb, int *info) nogil
cdef void dsytrs(char *uplo, int *n, int *nrhs, d *a, int *lda, int *ipiv, d *b, int *ldb, int *info) nogil:
    _fortran_dsytrs(uplo, n, nrhs, a, lda, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtbcon "F_FUNC(dtbcon,DTBCON)"(char *norm, char *uplo, char *diag, int *n, int *kd, d *ab, int *ldab, d *rcond, d *work, int *iwork, int *info) nogil
cdef void dtbcon(char *norm, char *uplo, char *diag, int *n, int *kd, d *ab, int *ldab, d *rcond, d *work, int *iwork, int *info) nogil:
    _fortran_dtbcon(norm, uplo, diag, n, kd, ab, ldab, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtbrfs "F_FUNC(dtbrfs,DTBRFS)"(char *uplo, char *trans, char *diag, int *n, int *kd, int *nrhs, d *ab, int *ldab, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dtbrfs(char *uplo, char *trans, char *diag, int *n, int *kd, int *nrhs, d *ab, int *ldab, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dtbrfs(uplo, trans, diag, n, kd, nrhs, ab, ldab, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtbtrs "F_FUNC(dtbtrs,DTBTRS)"(char *uplo, char *trans, char *diag, int *n, int *kd, int *nrhs, d *ab, int *ldab, d *b, int *ldb, int *info) nogil
cdef void dtbtrs(char *uplo, char *trans, char *diag, int *n, int *kd, int *nrhs, d *ab, int *ldab, d *b, int *ldb, int *info) nogil:
    _fortran_dtbtrs(uplo, trans, diag, n, kd, nrhs, ab, ldab, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtgevc "F_FUNC(dtgevc,DTGEVC)"(char *side, char *howmny, bint *select, int *n, d *s, int *lds, d *p, int *ldp, d *vl, int *ldvl, d *vr, int *ldvr, int *mm, int *m, d *work, int *info) nogil
cdef void dtgevc(char *side, char *howmny, bint *select, int *n, d *s, int *lds, d *p, int *ldp, d *vl, int *ldvl, d *vr, int *ldvr, int *mm, int *m, d *work, int *info) nogil:
    _fortran_dtgevc(side, howmny, select, n, s, lds, p, ldp, vl, ldvl, vr, ldvr, mm, m, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtgex2 "F_FUNC(dtgex2,DTGEX2)"(bint *wantq, bint *wantz, int *n, d *a, int *lda, d *b, int *ldb, d *q, int *ldq, d *z, int *ldz, int *j1, int *n1, int *n2, d *work, int *lwork, int *info) nogil
cdef void dtgex2(bint *wantq, bint *wantz, int *n, d *a, int *lda, d *b, int *ldb, d *q, int *ldq, d *z, int *ldz, int *j1, int *n1, int *n2, d *work, int *lwork, int *info) nogil:
    _fortran_dtgex2(wantq, wantz, n, a, lda, b, ldb, q, ldq, z, ldz, j1, n1, n2, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtgexc "F_FUNC(dtgexc,DTGEXC)"(bint *wantq, bint *wantz, int *n, d *a, int *lda, d *b, int *ldb, d *q, int *ldq, d *z, int *ldz, int *ifst, int *ilst, d *work, int *lwork, int *info) nogil
cdef void dtgexc(bint *wantq, bint *wantz, int *n, d *a, int *lda, d *b, int *ldb, d *q, int *ldq, d *z, int *ldz, int *ifst, int *ilst, d *work, int *lwork, int *info) nogil:
    _fortran_dtgexc(wantq, wantz, n, a, lda, b, ldb, q, ldq, z, ldz, ifst, ilst, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtgsen "F_FUNC(dtgsen,DTGSEN)"(int *ijob, bint *wantq, bint *wantz, bint *select, int *n, d *a, int *lda, d *b, int *ldb, d *alphar, d *alphai, d *beta, d *q, int *ldq, d *z, int *ldz, int *m, d *pl, d *pr, d *dif, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void dtgsen(int *ijob, bint *wantq, bint *wantz, bint *select, int *n, d *a, int *lda, d *b, int *ldb, d *alphar, d *alphai, d *beta, d *q, int *ldq, d *z, int *ldz, int *m, d *pl, d *pr, d *dif, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_dtgsen(ijob, wantq, wantz, select, n, a, lda, b, ldb, alphar, alphai, beta, q, ldq, z, ldz, m, pl, pr, dif, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtgsja "F_FUNC(dtgsja,DTGSJA)"(char *jobu, char *jobv, char *jobq, int *m, int *p, int *n, int *k, int *l, d *a, int *lda, d *b, int *ldb, d *tola, d *tolb, d *alpha, d *beta, d *u, int *ldu, d *v, int *ldv, d *q, int *ldq, d *work, int *ncycle, int *info) nogil
cdef void dtgsja(char *jobu, char *jobv, char *jobq, int *m, int *p, int *n, int *k, int *l, d *a, int *lda, d *b, int *ldb, d *tola, d *tolb, d *alpha, d *beta, d *u, int *ldu, d *v, int *ldv, d *q, int *ldq, d *work, int *ncycle, int *info) nogil:
    _fortran_dtgsja(jobu, jobv, jobq, m, p, n, k, l, a, lda, b, ldb, tola, tolb, alpha, beta, u, ldu, v, ldv, q, ldq, work, ncycle, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtgsna "F_FUNC(dtgsna,DTGSNA)"(char *job, char *howmny, bint *select, int *n, d *a, int *lda, d *b, int *ldb, d *vl, int *ldvl, d *vr, int *ldvr, d *s, d *dif, int *mm, int *m, d *work, int *lwork, int *iwork, int *info) nogil
cdef void dtgsna(char *job, char *howmny, bint *select, int *n, d *a, int *lda, d *b, int *ldb, d *vl, int *ldvl, d *vr, int *ldvr, d *s, d *dif, int *mm, int *m, d *work, int *lwork, int *iwork, int *info) nogil:
    _fortran_dtgsna(job, howmny, select, n, a, lda, b, ldb, vl, ldvl, vr, ldvr, s, dif, mm, m, work, lwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtgsy2 "F_FUNC(dtgsy2,DTGSY2)"(char *trans, int *ijob, int *m, int *n, d *a, int *lda, d *b, int *ldb, d *c, int *ldc, d *d, int *ldd, d *e, int *lde, d *f, int *ldf, d *scale, d *rdsum, d *rdscal, int *iwork, int *pq, int *info) nogil
cdef void dtgsy2(char *trans, int *ijob, int *m, int *n, d *a, int *lda, d *b, int *ldb, d *c, int *ldc, d *d, int *ldd, d *e, int *lde, d *f, int *ldf, d *scale, d *rdsum, d *rdscal, int *iwork, int *pq, int *info) nogil:
    _fortran_dtgsy2(trans, ijob, m, n, a, lda, b, ldb, c, ldc, d, ldd, e, lde, f, ldf, scale, rdsum, rdscal, iwork, pq, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtgsyl "F_FUNC(dtgsyl,DTGSYL)"(char *trans, int *ijob, int *m, int *n, d *a, int *lda, d *b, int *ldb, d *c, int *ldc, d *d, int *ldd, d *e, int *lde, d *f, int *ldf, d *scale, d *dif, d *work, int *lwork, int *iwork, int *info) nogil
cdef void dtgsyl(char *trans, int *ijob, int *m, int *n, d *a, int *lda, d *b, int *ldb, d *c, int *ldc, d *d, int *ldd, d *e, int *lde, d *f, int *ldf, d *scale, d *dif, d *work, int *lwork, int *iwork, int *info) nogil:
    _fortran_dtgsyl(trans, ijob, m, n, a, lda, b, ldb, c, ldc, d, ldd, e, lde, f, ldf, scale, dif, work, lwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtpcon "F_FUNC(dtpcon,DTPCON)"(char *norm, char *uplo, char *diag, int *n, d *ap, d *rcond, d *work, int *iwork, int *info) nogil
cdef void dtpcon(char *norm, char *uplo, char *diag, int *n, d *ap, d *rcond, d *work, int *iwork, int *info) nogil:
    _fortran_dtpcon(norm, uplo, diag, n, ap, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtprfs "F_FUNC(dtprfs,DTPRFS)"(char *uplo, char *trans, char *diag, int *n, int *nrhs, d *ap, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dtprfs(char *uplo, char *trans, char *diag, int *n, int *nrhs, d *ap, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dtprfs(uplo, trans, diag, n, nrhs, ap, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtptri "F_FUNC(dtptri,DTPTRI)"(char *uplo, char *diag, int *n, d *ap, int *info) nogil
cdef void dtptri(char *uplo, char *diag, int *n, d *ap, int *info) nogil:
    _fortran_dtptri(uplo, diag, n, ap, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtptrs "F_FUNC(dtptrs,DTPTRS)"(char *uplo, char *trans, char *diag, int *n, int *nrhs, d *ap, d *b, int *ldb, int *info) nogil
cdef void dtptrs(char *uplo, char *trans, char *diag, int *n, int *nrhs, d *ap, d *b, int *ldb, int *info) nogil:
    _fortran_dtptrs(uplo, trans, diag, n, nrhs, ap, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtrcon "F_FUNC(dtrcon,DTRCON)"(char *norm, char *uplo, char *diag, int *n, d *a, int *lda, d *rcond, d *work, int *iwork, int *info) nogil
cdef void dtrcon(char *norm, char *uplo, char *diag, int *n, d *a, int *lda, d *rcond, d *work, int *iwork, int *info) nogil:
    _fortran_dtrcon(norm, uplo, diag, n, a, lda, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtrevc "F_FUNC(dtrevc,DTREVC)"(char *side, char *howmny, bint *select, int *n, d *t, int *ldt, d *vl, int *ldvl, d *vr, int *ldvr, int *mm, int *m, d *work, int *info) nogil
cdef void dtrevc(char *side, char *howmny, bint *select, int *n, d *t, int *ldt, d *vl, int *ldvl, d *vr, int *ldvr, int *mm, int *m, d *work, int *info) nogil:
    _fortran_dtrevc(side, howmny, select, n, t, ldt, vl, ldvl, vr, ldvr, mm, m, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtrexc "F_FUNC(dtrexc,DTREXC)"(char *compq, int *n, d *t, int *ldt, d *q, int *ldq, int *ifst, int *ilst, d *work, int *info) nogil
cdef void dtrexc(char *compq, int *n, d *t, int *ldt, d *q, int *ldq, int *ifst, int *ilst, d *work, int *info) nogil:
    _fortran_dtrexc(compq, n, t, ldt, q, ldq, ifst, ilst, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtrrfs "F_FUNC(dtrrfs,DTRRFS)"(char *uplo, char *trans, char *diag, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil
cdef void dtrrfs(char *uplo, char *trans, char *diag, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, d *x, int *ldx, d *ferr, d *berr, d *work, int *iwork, int *info) nogil:
    _fortran_dtrrfs(uplo, trans, diag, n, nrhs, a, lda, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtrsen "F_FUNC(dtrsen,DTRSEN)"(char *job, char *compq, bint *select, int *n, d *t, int *ldt, d *q, int *ldq, d *wr, d *wi, int *m, d *s, d *sep, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void dtrsen(char *job, char *compq, bint *select, int *n, d *t, int *ldt, d *q, int *ldq, d *wr, d *wi, int *m, d *s, d *sep, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_dtrsen(job, compq, select, n, t, ldt, q, ldq, wr, wi, m, s, sep, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtrsna "F_FUNC(dtrsna,DTRSNA)"(char *job, char *howmny, bint *select, int *n, d *t, int *ldt, d *vl, int *ldvl, d *vr, int *ldvr, d *s, d *sep, int *mm, int *m, d *work, int *ldwork, int *iwork, int *info) nogil
cdef void dtrsna(char *job, char *howmny, bint *select, int *n, d *t, int *ldt, d *vl, int *ldvl, d *vr, int *ldvr, d *s, d *sep, int *mm, int *m, d *work, int *ldwork, int *iwork, int *info) nogil:
    _fortran_dtrsna(job, howmny, select, n, t, ldt, vl, ldvl, vr, ldvr, s, sep, mm, m, work, ldwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtrsyl "F_FUNC(dtrsyl,DTRSYL)"(char *trana, char *tranb, int *isgn, int *m, int *n, d *a, int *lda, d *b, int *ldb, d *c, int *ldc, d *scale, int *info) nogil
cdef void dtrsyl(char *trana, char *tranb, int *isgn, int *m, int *n, d *a, int *lda, d *b, int *ldb, d *c, int *ldc, d *scale, int *info) nogil:
    _fortran_dtrsyl(trana, tranb, isgn, m, n, a, lda, b, ldb, c, ldc, scale, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtrti2 "F_FUNC(dtrti2,DTRTI2)"(char *uplo, char *diag, int *n, d *a, int *lda, int *info) nogil
cdef void dtrti2(char *uplo, char *diag, int *n, d *a, int *lda, int *info) nogil:
    _fortran_dtrti2(uplo, diag, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtrtri "F_FUNC(dtrtri,DTRTRI)"(char *uplo, char *diag, int *n, d *a, int *lda, int *info) nogil
cdef void dtrtri(char *uplo, char *diag, int *n, d *a, int *lda, int *info) nogil:
    _fortran_dtrtri(uplo, diag, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtrtrs "F_FUNC(dtrtrs,DTRTRS)"(char *uplo, char *trans, char *diag, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, int *info) nogil
cdef void dtrtrs(char *uplo, char *trans, char *diag, int *n, int *nrhs, d *a, int *lda, d *b, int *ldb, int *info) nogil:
    _fortran_dtrtrs(uplo, trans, diag, n, nrhs, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtzrqf "F_FUNC(dtzrqf,DTZRQF)"(int *m, int *n, d *a, int *lda, d *tau, int *info) nogil
cdef void dtzrqf(int *m, int *n, d *a, int *lda, d *tau, int *info) nogil:
    _fortran_dtzrqf(m, n, a, lda, tau, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_dtzrzf "F_FUNC(dtzrzf,DTZRZF)"(int *m, int *n, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil
cdef void dtzrzf(int *m, int *n, d *a, int *lda, d *tau, d *work, int *lwork, int *info) nogil:
    _fortran_dtzrzf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sbdsdc "F_FUNC(sbdsdc,SBDSDC)"(char *uplo, char *compq, int *n, s *d, s *e, s *u, int *ldu, s *vt, int *ldvt, s *q, int *iq, s *work, int *iwork, int *info) nogil
cdef void sbdsdc(char *uplo, char *compq, int *n, s *d, s *e, s *u, int *ldu, s *vt, int *ldvt, s *q, int *iq, s *work, int *iwork, int *info) nogil:
    _fortran_sbdsdc(uplo, compq, n, d, e, u, ldu, vt, ldvt, q, iq, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sbdsqr "F_FUNC(sbdsqr,SBDSQR)"(char *uplo, int *n, int *ncvt, int *nru, int *ncc, s *d, s *e, s *vt, int *ldvt, s *u, int *ldu, s *c, int *ldc, s *work, int *info) nogil
cdef void sbdsqr(char *uplo, int *n, int *ncvt, int *nru, int *ncc, s *d, s *e, s *vt, int *ldvt, s *u, int *ldu, s *c, int *ldc, s *work, int *info) nogil:
    _fortran_sbdsqr(uplo, n, ncvt, nru, ncc, d, e, vt, ldvt, u, ldu, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sdisna "F_FUNC(sdisna,SDISNA)"(char *job, int *m, int *n, s *d, s *sep, int *info) nogil
cdef void sdisna(char *job, int *m, int *n, s *d, s *sep, int *info) nogil:
    _fortran_sdisna(job, m, n, d, sep, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgbbrd "F_FUNC(sgbbrd,SGBBRD)"(char *vect, int *m, int *n, int *ncc, int *kl, int *ku, s *ab, int *ldab, s *d, s *e, s *q, int *ldq, s *pt, int *ldpt, s *c, int *ldc, s *work, int *info) nogil
cdef void sgbbrd(char *vect, int *m, int *n, int *ncc, int *kl, int *ku, s *ab, int *ldab, s *d, s *e, s *q, int *ldq, s *pt, int *ldpt, s *c, int *ldc, s *work, int *info) nogil:
    _fortran_sgbbrd(vect, m, n, ncc, kl, ku, ab, ldab, d, e, q, ldq, pt, ldpt, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgbcon "F_FUNC(sgbcon,SGBCON)"(char *norm, int *n, int *kl, int *ku, s *ab, int *ldab, int *ipiv, s *anorm, s *rcond, s *work, int *iwork, int *info) nogil
cdef void sgbcon(char *norm, int *n, int *kl, int *ku, s *ab, int *ldab, int *ipiv, s *anorm, s *rcond, s *work, int *iwork, int *info) nogil:
    _fortran_sgbcon(norm, n, kl, ku, ab, ldab, ipiv, anorm, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgbequ "F_FUNC(sgbequ,SGBEQU)"(int *m, int *n, int *kl, int *ku, s *ab, int *ldab, s *r, s *c, s *rowcnd, s *colcnd, s *amax, int *info) nogil
cdef void sgbequ(int *m, int *n, int *kl, int *ku, s *ab, int *ldab, s *r, s *c, s *rowcnd, s *colcnd, s *amax, int *info) nogil:
    _fortran_sgbequ(m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgbrfs "F_FUNC(sgbrfs,SGBRFS)"(char *trans, int *n, int *kl, int *ku, int *nrhs, s *ab, int *ldab, s *afb, int *ldafb, int *ipiv, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void sgbrfs(char *trans, int *n, int *kl, int *ku, int *nrhs, s *ab, int *ldab, s *afb, int *ldafb, int *ipiv, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_sgbrfs(trans, n, kl, ku, nrhs, ab, ldab, afb, ldafb, ipiv, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgbsv "F_FUNC(sgbsv,SGBSV)"(int *n, int *kl, int *ku, int *nrhs, s *ab, int *ldab, int *ipiv, s *b, int *ldb, int *info) nogil
cdef void sgbsv(int *n, int *kl, int *ku, int *nrhs, s *ab, int *ldab, int *ipiv, s *b, int *ldb, int *info) nogil:
    _fortran_sgbsv(n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgbsvx "F_FUNC(sgbsvx,SGBSVX)"(char *fact, char *trans, int *n, int *kl, int *ku, int *nrhs, s *ab, int *ldab, s *afb, int *ldafb, int *ipiv, char *equed, s *r, s *c, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void sgbsvx(char *fact, char *trans, int *n, int *kl, int *ku, int *nrhs, s *ab, int *ldab, s *afb, int *ldafb, int *ipiv, char *equed, s *r, s *c, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_sgbsvx(fact, trans, n, kl, ku, nrhs, ab, ldab, afb, ldafb, ipiv, equed, r, c, b, ldb, x, ldx, rcond, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgbtf2 "F_FUNC(sgbtf2,SGBTF2)"(int *m, int *n, int *kl, int *ku, s *ab, int *ldab, int *ipiv, int *info) nogil
cdef void sgbtf2(int *m, int *n, int *kl, int *ku, s *ab, int *ldab, int *ipiv, int *info) nogil:
    _fortran_sgbtf2(m, n, kl, ku, ab, ldab, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgbtrf "F_FUNC(sgbtrf,SGBTRF)"(int *m, int *n, int *kl, int *ku, s *ab, int *ldab, int *ipiv, int *info) nogil
cdef void sgbtrf(int *m, int *n, int *kl, int *ku, s *ab, int *ldab, int *ipiv, int *info) nogil:
    _fortran_sgbtrf(m, n, kl, ku, ab, ldab, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgbtrs "F_FUNC(sgbtrs,SGBTRS)"(char *trans, int *n, int *kl, int *ku, int *nrhs, s *ab, int *ldab, int *ipiv, s *b, int *ldb, int *info) nogil
cdef void sgbtrs(char *trans, int *n, int *kl, int *ku, int *nrhs, s *ab, int *ldab, int *ipiv, s *b, int *ldb, int *info) nogil:
    _fortran_sgbtrs(trans, n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgebak "F_FUNC(sgebak,SGEBAK)"(char *job, char *side, int *n, int *ilo, int *ihi, s *scale, int *m, s *v, int *ldv, int *info) nogil
cdef void sgebak(char *job, char *side, int *n, int *ilo, int *ihi, s *scale, int *m, s *v, int *ldv, int *info) nogil:
    _fortran_sgebak(job, side, n, ilo, ihi, scale, m, v, ldv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgebal "F_FUNC(sgebal,SGEBAL)"(char *job, int *n, s *a, int *lda, int *ilo, int *ihi, s *scale, int *info) nogil
cdef void sgebal(char *job, int *n, s *a, int *lda, int *ilo, int *ihi, s *scale, int *info) nogil:
    _fortran_sgebal(job, n, a, lda, ilo, ihi, scale, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgebd2 "F_FUNC(sgebd2,SGEBD2)"(int *m, int *n, s *a, int *lda, s *d, s *e, s *tauq, s *taup, s *work, int *info) nogil
cdef void sgebd2(int *m, int *n, s *a, int *lda, s *d, s *e, s *tauq, s *taup, s *work, int *info) nogil:
    _fortran_sgebd2(m, n, a, lda, d, e, tauq, taup, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgebrd "F_FUNC(sgebrd,SGEBRD)"(int *m, int *n, s *a, int *lda, s *d, s *e, s *tauq, s *taup, s *work, int *lwork, int *info) nogil
cdef void sgebrd(int *m, int *n, s *a, int *lda, s *d, s *e, s *tauq, s *taup, s *work, int *lwork, int *info) nogil:
    _fortran_sgebrd(m, n, a, lda, d, e, tauq, taup, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgecon "F_FUNC(sgecon,SGECON)"(char *norm, int *n, s *a, int *lda, s *anorm, s *rcond, s *work, int *iwork, int *info) nogil
cdef void sgecon(char *norm, int *n, s *a, int *lda, s *anorm, s *rcond, s *work, int *iwork, int *info) nogil:
    _fortran_sgecon(norm, n, a, lda, anorm, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgeequ "F_FUNC(sgeequ,SGEEQU)"(int *m, int *n, s *a, int *lda, s *r, s *c, s *rowcnd, s *colcnd, s *amax, int *info) nogil
cdef void sgeequ(int *m, int *n, s *a, int *lda, s *r, s *c, s *rowcnd, s *colcnd, s *amax, int *info) nogil:
    _fortran_sgeequ(m, n, a, lda, r, c, rowcnd, colcnd, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgees "F_FUNC(sgees,SGEES)"(char *jobvs, char *sort, sselect2 *select, int *n, s *a, int *lda, int *sdim, s *wr, s *wi, s *vs, int *ldvs, s *work, int *lwork, bint *bwork, int *info) nogil
cdef void sgees(char *jobvs, char *sort, sselect2 *select, int *n, s *a, int *lda, int *sdim, s *wr, s *wi, s *vs, int *ldvs, s *work, int *lwork, bint *bwork, int *info) nogil:
    _fortran_sgees(jobvs, sort, select, n, a, lda, sdim, wr, wi, vs, ldvs, work, lwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgeesx "F_FUNC(sgeesx,SGEESX)"(char *jobvs, char *sort, sselect2 *select, char *sense, int *n, s *a, int *lda, int *sdim, s *wr, s *wi, s *vs, int *ldvs, s *rconde, s *rcondv, s *work, int *lwork, int *iwork, int *liwork, bint *bwork, int *info) nogil
cdef void sgeesx(char *jobvs, char *sort, sselect2 *select, char *sense, int *n, s *a, int *lda, int *sdim, s *wr, s *wi, s *vs, int *ldvs, s *rconde, s *rcondv, s *work, int *lwork, int *iwork, int *liwork, bint *bwork, int *info) nogil:
    _fortran_sgeesx(jobvs, sort, select, sense, n, a, lda, sdim, wr, wi, vs, ldvs, rconde, rcondv, work, lwork, iwork, liwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgeev "F_FUNC(sgeev,SGEEV)"(char *jobvl, char *jobvr, int *n, s *a, int *lda, s *wr, s *wi, s *vl, int *ldvl, s *vr, int *ldvr, s *work, int *lwork, int *info) nogil
cdef void sgeev(char *jobvl, char *jobvr, int *n, s *a, int *lda, s *wr, s *wi, s *vl, int *ldvl, s *vr, int *ldvr, s *work, int *lwork, int *info) nogil:
    _fortran_sgeev(jobvl, jobvr, n, a, lda, wr, wi, vl, ldvl, vr, ldvr, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgeevx "F_FUNC(sgeevx,SGEEVX)"(char *balanc, char *jobvl, char *jobvr, char *sense, int *n, s *a, int *lda, s *wr, s *wi, s *vl, int *ldvl, s *vr, int *ldvr, int *ilo, int *ihi, s *scale, s *abnrm, s *rconde, s *rcondv, s *work, int *lwork, int *iwork, int *info) nogil
cdef void sgeevx(char *balanc, char *jobvl, char *jobvr, char *sense, int *n, s *a, int *lda, s *wr, s *wi, s *vl, int *ldvl, s *vr, int *ldvr, int *ilo, int *ihi, s *scale, s *abnrm, s *rconde, s *rcondv, s *work, int *lwork, int *iwork, int *info) nogil:
    _fortran_sgeevx(balanc, jobvl, jobvr, sense, n, a, lda, wr, wi, vl, ldvl, vr, ldvr, ilo, ihi, scale, abnrm, rconde, rcondv, work, lwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgegs "F_FUNC(sgegs,SGEGS)"(char *jobvsl, char *jobvsr, int *n, s *a, int *lda, s *b, int *ldb, s *alphar, s *alphai, s *beta, s *vsl, int *ldvsl, s *vsr, int *ldvsr, s *work, int *lwork, int *info) nogil
cdef void sgegs(char *jobvsl, char *jobvsr, int *n, s *a, int *lda, s *b, int *ldb, s *alphar, s *alphai, s *beta, s *vsl, int *ldvsl, s *vsr, int *ldvsr, s *work, int *lwork, int *info) nogil:
    _fortran_sgegs(jobvsl, jobvsr, n, a, lda, b, ldb, alphar, alphai, beta, vsl, ldvsl, vsr, ldvsr, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgegv "F_FUNC(sgegv,SGEGV)"(char *jobvl, char *jobvr, int *n, s *a, int *lda, s *b, int *ldb, s *alphar, s *alphai, s *beta, s *vl, int *ldvl, s *vr, int *ldvr, s *work, int *lwork, int *info) nogil
cdef void sgegv(char *jobvl, char *jobvr, int *n, s *a, int *lda, s *b, int *ldb, s *alphar, s *alphai, s *beta, s *vl, int *ldvl, s *vr, int *ldvr, s *work, int *lwork, int *info) nogil:
    _fortran_sgegv(jobvl, jobvr, n, a, lda, b, ldb, alphar, alphai, beta, vl, ldvl, vr, ldvr, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgehd2 "F_FUNC(sgehd2,SGEHD2)"(int *n, int *ilo, int *ihi, s *a, int *lda, s *tau, s *work, int *info) nogil
cdef void sgehd2(int *n, int *ilo, int *ihi, s *a, int *lda, s *tau, s *work, int *info) nogil:
    _fortran_sgehd2(n, ilo, ihi, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgehrd "F_FUNC(sgehrd,SGEHRD)"(int *n, int *ilo, int *ihi, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil
cdef void sgehrd(int *n, int *ilo, int *ihi, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil:
    _fortran_sgehrd(n, ilo, ihi, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgelq2 "F_FUNC(sgelq2,SGELQ2)"(int *m, int *n, s *a, int *lda, s *tau, s *work, int *info) nogil
cdef void sgelq2(int *m, int *n, s *a, int *lda, s *tau, s *work, int *info) nogil:
    _fortran_sgelq2(m, n, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgelqf "F_FUNC(sgelqf,SGELQF)"(int *m, int *n, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil
cdef void sgelqf(int *m, int *n, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil:
    _fortran_sgelqf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgels "F_FUNC(sgels,SGELS)"(char *trans, int *m, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, s *work, int *lwork, int *info) nogil
cdef void sgels(char *trans, int *m, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, s *work, int *lwork, int *info) nogil:
    _fortran_sgels(trans, m, n, nrhs, a, lda, b, ldb, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgelsd "F_FUNC(sgelsd,SGELSD)"(int *m, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, s *s, s *rcond, int *rank, s *work, int *lwork, int *iwork, int *info) nogil
cdef void sgelsd(int *m, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, s *s, s *rcond, int *rank, s *work, int *lwork, int *iwork, int *info) nogil:
    _fortran_sgelsd(m, n, nrhs, a, lda, b, ldb, s, rcond, rank, work, lwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgelss "F_FUNC(sgelss,SGELSS)"(int *m, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, s *s, s *rcond, int *rank, s *work, int *lwork, int *info) nogil
cdef void sgelss(int *m, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, s *s, s *rcond, int *rank, s *work, int *lwork, int *info) nogil:
    _fortran_sgelss(m, n, nrhs, a, lda, b, ldb, s, rcond, rank, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgelsx "F_FUNC(sgelsx,SGELSX)"(int *m, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, int *jpvt, s *rcond, int *rank, s *work, int *info) nogil
cdef void sgelsx(int *m, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, int *jpvt, s *rcond, int *rank, s *work, int *info) nogil:
    _fortran_sgelsx(m, n, nrhs, a, lda, b, ldb, jpvt, rcond, rank, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgelsy "F_FUNC(sgelsy,SGELSY)"(int *m, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, int *jpvt, s *rcond, int *rank, s *work, int *lwork, int *info) nogil
cdef void sgelsy(int *m, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, int *jpvt, s *rcond, int *rank, s *work, int *lwork, int *info) nogil:
    _fortran_sgelsy(m, n, nrhs, a, lda, b, ldb, jpvt, rcond, rank, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgeql2 "F_FUNC(sgeql2,SGEQL2)"(int *m, int *n, s *a, int *lda, s *tau, s *work, int *info) nogil
cdef void sgeql2(int *m, int *n, s *a, int *lda, s *tau, s *work, int *info) nogil:
    _fortran_sgeql2(m, n, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgeqlf "F_FUNC(sgeqlf,SGEQLF)"(int *m, int *n, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil
cdef void sgeqlf(int *m, int *n, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil:
    _fortran_sgeqlf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgeqp3 "F_FUNC(sgeqp3,SGEQP3)"(int *m, int *n, s *a, int *lda, int *jpvt, s *tau, s *work, int *lwork, int *info) nogil
cdef void sgeqp3(int *m, int *n, s *a, int *lda, int *jpvt, s *tau, s *work, int *lwork, int *info) nogil:
    _fortran_sgeqp3(m, n, a, lda, jpvt, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgeqpf "F_FUNC(sgeqpf,SGEQPF)"(int *m, int *n, s *a, int *lda, int *jpvt, s *tau, s *work, int *info) nogil
cdef void sgeqpf(int *m, int *n, s *a, int *lda, int *jpvt, s *tau, s *work, int *info) nogil:
    _fortran_sgeqpf(m, n, a, lda, jpvt, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgeqr2 "F_FUNC(sgeqr2,SGEQR2)"(int *m, int *n, s *a, int *lda, s *tau, s *work, int *info) nogil
cdef void sgeqr2(int *m, int *n, s *a, int *lda, s *tau, s *work, int *info) nogil:
    _fortran_sgeqr2(m, n, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgeqrf "F_FUNC(sgeqrf,SGEQRF)"(int *m, int *n, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil
cdef void sgeqrf(int *m, int *n, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil:
    _fortran_sgeqrf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgerfs "F_FUNC(sgerfs,SGERFS)"(char *trans, int *n, int *nrhs, s *a, int *lda, s *af, int *ldaf, int *ipiv, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void sgerfs(char *trans, int *n, int *nrhs, s *a, int *lda, s *af, int *ldaf, int *ipiv, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_sgerfs(trans, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgerq2 "F_FUNC(sgerq2,SGERQ2)"(int *m, int *n, s *a, int *lda, s *tau, s *work, int *info) nogil
cdef void sgerq2(int *m, int *n, s *a, int *lda, s *tau, s *work, int *info) nogil:
    _fortran_sgerq2(m, n, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgerqf "F_FUNC(sgerqf,SGERQF)"(int *m, int *n, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil
cdef void sgerqf(int *m, int *n, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil:
    _fortran_sgerqf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgesc2 "F_FUNC(sgesc2,SGESC2)"(int *n, s *a, int *lda, s *rhs, int *ipiv, int *jpiv, s *scale) nogil
cdef void sgesc2(int *n, s *a, int *lda, s *rhs, int *ipiv, int *jpiv, s *scale) nogil:
    _fortran_sgesc2(n, a, lda, rhs, ipiv, jpiv, scale)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgesdd "F_FUNC(sgesdd,SGESDD)"(char *jobz, int *m, int *n, s *a, int *lda, s *s, s *u, int *ldu, s *vt, int *ldvt, s *work, int *lwork, int *iwork, int *info) nogil
cdef void sgesdd(char *jobz, int *m, int *n, s *a, int *lda, s *s, s *u, int *ldu, s *vt, int *ldvt, s *work, int *lwork, int *iwork, int *info) nogil:
    _fortran_sgesdd(jobz, m, n, a, lda, s, u, ldu, vt, ldvt, work, lwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgesv "F_FUNC(sgesv,SGESV)"(int *n, int *nrhs, s *a, int *lda, int *ipiv, s *b, int *ldb, int *info) nogil
cdef void sgesv(int *n, int *nrhs, s *a, int *lda, int *ipiv, s *b, int *ldb, int *info) nogil:
    _fortran_sgesv(n, nrhs, a, lda, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgesvd "F_FUNC(sgesvd,SGESVD)"(char *jobu, char *jobvt, int *m, int *n, s *a, int *lda, s *s, s *u, int *ldu, s *vt, int *ldvt, s *work, int *lwork, int *info) nogil
cdef void sgesvd(char *jobu, char *jobvt, int *m, int *n, s *a, int *lda, s *s, s *u, int *ldu, s *vt, int *ldvt, s *work, int *lwork, int *info) nogil:
    _fortran_sgesvd(jobu, jobvt, m, n, a, lda, s, u, ldu, vt, ldvt, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgesvx "F_FUNC(sgesvx,SGESVX)"(char *fact, char *trans, int *n, int *nrhs, s *a, int *lda, s *af, int *ldaf, int *ipiv, char *equed, s *r, s *c, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void sgesvx(char *fact, char *trans, int *n, int *nrhs, s *a, int *lda, s *af, int *ldaf, int *ipiv, char *equed, s *r, s *c, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_sgesvx(fact, trans, n, nrhs, a, lda, af, ldaf, ipiv, equed, r, c, b, ldb, x, ldx, rcond, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgetc2 "F_FUNC(sgetc2,SGETC2)"(int *n, s *a, int *lda, int *ipiv, int *jpiv, int *info) nogil
cdef void sgetc2(int *n, s *a, int *lda, int *ipiv, int *jpiv, int *info) nogil:
    _fortran_sgetc2(n, a, lda, ipiv, jpiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgetf2 "F_FUNC(sgetf2,SGETF2)"(int *m, int *n, s *a, int *lda, int *ipiv, int *info) nogil
cdef void sgetf2(int *m, int *n, s *a, int *lda, int *ipiv, int *info) nogil:
    _fortran_sgetf2(m, n, a, lda, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgetrf "F_FUNC(sgetrf,SGETRF)"(int *m, int *n, s *a, int *lda, int *ipiv, int *info) nogil
cdef void sgetrf(int *m, int *n, s *a, int *lda, int *ipiv, int *info) nogil:
    _fortran_sgetrf(m, n, a, lda, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgetri "F_FUNC(sgetri,SGETRI)"(int *n, s *a, int *lda, int *ipiv, s *work, int *lwork, int *info) nogil
cdef void sgetri(int *n, s *a, int *lda, int *ipiv, s *work, int *lwork, int *info) nogil:
    _fortran_sgetri(n, a, lda, ipiv, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgetrs "F_FUNC(sgetrs,SGETRS)"(char *trans, int *n, int *nrhs, s *a, int *lda, int *ipiv, s *b, int *ldb, int *info) nogil
cdef void sgetrs(char *trans, int *n, int *nrhs, s *a, int *lda, int *ipiv, s *b, int *ldb, int *info) nogil:
    _fortran_sgetrs(trans, n, nrhs, a, lda, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sggbak "F_FUNC(sggbak,SGGBAK)"(char *job, char *side, int *n, int *ilo, int *ihi, s *lscale, s *rscale, int *m, s *v, int *ldv, int *info) nogil
cdef void sggbak(char *job, char *side, int *n, int *ilo, int *ihi, s *lscale, s *rscale, int *m, s *v, int *ldv, int *info) nogil:
    _fortran_sggbak(job, side, n, ilo, ihi, lscale, rscale, m, v, ldv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sggbal "F_FUNC(sggbal,SGGBAL)"(char *job, int *n, s *a, int *lda, s *b, int *ldb, int *ilo, int *ihi, s *lscale, s *rscale, s *work, int *info) nogil
cdef void sggbal(char *job, int *n, s *a, int *lda, s *b, int *ldb, int *ilo, int *ihi, s *lscale, s *rscale, s *work, int *info) nogil:
    _fortran_sggbal(job, n, a, lda, b, ldb, ilo, ihi, lscale, rscale, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgges "F_FUNC(sgges,SGGES)"(char *jobvsl, char *jobvsr, char *sort, sselect3 *selctg, int *n, s *a, int *lda, s *b, int *ldb, int *sdim, s *alphar, s *alphai, s *beta, s *vsl, int *ldvsl, s *vsr, int *ldvsr, s *work, int *lwork, bint *bwork, int *info) nogil
cdef void sgges(char *jobvsl, char *jobvsr, char *sort, sselect3 *selctg, int *n, s *a, int *lda, s *b, int *ldb, int *sdim, s *alphar, s *alphai, s *beta, s *vsl, int *ldvsl, s *vsr, int *ldvsr, s *work, int *lwork, bint *bwork, int *info) nogil:
    _fortran_sgges(jobvsl, jobvsr, sort, selctg, n, a, lda, b, ldb, sdim, alphar, alphai, beta, vsl, ldvsl, vsr, ldvsr, work, lwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sggesx "F_FUNC(sggesx,SGGESX)"(char *jobvsl, char *jobvsr, char *sort, sselect3 *selctg, char *sense, int *n, s *a, int *lda, s *b, int *ldb, int *sdim, s *alphar, s *alphai, s *beta, s *vsl, int *ldvsl, s *vsr, int *ldvsr, s *rconde, s *rcondv, s *work, int *lwork, int *iwork, int *liwork, bint *bwork, int *info) nogil
cdef void sggesx(char *jobvsl, char *jobvsr, char *sort, sselect3 *selctg, char *sense, int *n, s *a, int *lda, s *b, int *ldb, int *sdim, s *alphar, s *alphai, s *beta, s *vsl, int *ldvsl, s *vsr, int *ldvsr, s *rconde, s *rcondv, s *work, int *lwork, int *iwork, int *liwork, bint *bwork, int *info) nogil:
    _fortran_sggesx(jobvsl, jobvsr, sort, selctg, sense, n, a, lda, b, ldb, sdim, alphar, alphai, beta, vsl, ldvsl, vsr, ldvsr, rconde, rcondv, work, lwork, iwork, liwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sggev "F_FUNC(sggev,SGGEV)"(char *jobvl, char *jobvr, int *n, s *a, int *lda, s *b, int *ldb, s *alphar, s *alphai, s *beta, s *vl, int *ldvl, s *vr, int *ldvr, s *work, int *lwork, int *info) nogil
cdef void sggev(char *jobvl, char *jobvr, int *n, s *a, int *lda, s *b, int *ldb, s *alphar, s *alphai, s *beta, s *vl, int *ldvl, s *vr, int *ldvr, s *work, int *lwork, int *info) nogil:
    _fortran_sggev(jobvl, jobvr, n, a, lda, b, ldb, alphar, alphai, beta, vl, ldvl, vr, ldvr, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sggevx "F_FUNC(sggevx,SGGEVX)"(char *balanc, char *jobvl, char *jobvr, char *sense, int *n, s *a, int *lda, s *b, int *ldb, s *alphar, s *alphai, s *beta, s *vl, int *ldvl, s *vr, int *ldvr, int *ilo, int *ihi, s *lscale, s *rscale, s *abnrm, s *bbnrm, s *rconde, s *rcondv, s *work, int *lwork, int *iwork, bint *bwork, int *info) nogil
cdef void sggevx(char *balanc, char *jobvl, char *jobvr, char *sense, int *n, s *a, int *lda, s *b, int *ldb, s *alphar, s *alphai, s *beta, s *vl, int *ldvl, s *vr, int *ldvr, int *ilo, int *ihi, s *lscale, s *rscale, s *abnrm, s *bbnrm, s *rconde, s *rcondv, s *work, int *lwork, int *iwork, bint *bwork, int *info) nogil:
    _fortran_sggevx(balanc, jobvl, jobvr, sense, n, a, lda, b, ldb, alphar, alphai, beta, vl, ldvl, vr, ldvr, ilo, ihi, lscale, rscale, abnrm, bbnrm, rconde, rcondv, work, lwork, iwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sggglm "F_FUNC(sggglm,SGGGLM)"(int *n, int *m, int *p, s *a, int *lda, s *b, int *ldb, s *d, s *x, s *y, s *work, int *lwork, int *info) nogil
cdef void sggglm(int *n, int *m, int *p, s *a, int *lda, s *b, int *ldb, s *d, s *x, s *y, s *work, int *lwork, int *info) nogil:
    _fortran_sggglm(n, m, p, a, lda, b, ldb, d, x, y, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgghrd "F_FUNC(sgghrd,SGGHRD)"(char *compq, char *compz, int *n, int *ilo, int *ihi, s *a, int *lda, s *b, int *ldb, s *q, int *ldq, s *z, int *ldz, int *info) nogil
cdef void sgghrd(char *compq, char *compz, int *n, int *ilo, int *ihi, s *a, int *lda, s *b, int *ldb, s *q, int *ldq, s *z, int *ldz, int *info) nogil:
    _fortran_sgghrd(compq, compz, n, ilo, ihi, a, lda, b, ldb, q, ldq, z, ldz, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgglse "F_FUNC(sgglse,SGGLSE)"(int *m, int *n, int *p, s *a, int *lda, s *b, int *ldb, s *c, s *d, s *x, s *work, int *lwork, int *info) nogil
cdef void sgglse(int *m, int *n, int *p, s *a, int *lda, s *b, int *ldb, s *c, s *d, s *x, s *work, int *lwork, int *info) nogil:
    _fortran_sgglse(m, n, p, a, lda, b, ldb, c, d, x, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sggqrf "F_FUNC(sggqrf,SGGQRF)"(int *n, int *m, int *p, s *a, int *lda, s *taua, s *b, int *ldb, s *taub, s *work, int *lwork, int *info) nogil
cdef void sggqrf(int *n, int *m, int *p, s *a, int *lda, s *taua, s *b, int *ldb, s *taub, s *work, int *lwork, int *info) nogil:
    _fortran_sggqrf(n, m, p, a, lda, taua, b, ldb, taub, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sggrqf "F_FUNC(sggrqf,SGGRQF)"(int *m, int *p, int *n, s *a, int *lda, s *taua, s *b, int *ldb, s *taub, s *work, int *lwork, int *info) nogil
cdef void sggrqf(int *m, int *p, int *n, s *a, int *lda, s *taua, s *b, int *ldb, s *taub, s *work, int *lwork, int *info) nogil:
    _fortran_sggrqf(m, p, n, a, lda, taua, b, ldb, taub, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sggsvd "F_FUNC(sggsvd,SGGSVD)"(char *jobu, char *jobv, char *jobq, int *m, int *n, int *p, int *k, int *l, s *a, int *lda, s *b, int *ldb, s *alpha, s *beta, s *u, int *ldu, s *v, int *ldv, s *q, int *ldq, s *work, int *iwork, int *info) nogil
cdef void sggsvd(char *jobu, char *jobv, char *jobq, int *m, int *n, int *p, int *k, int *l, s *a, int *lda, s *b, int *ldb, s *alpha, s *beta, s *u, int *ldu, s *v, int *ldv, s *q, int *ldq, s *work, int *iwork, int *info) nogil:
    _fortran_sggsvd(jobu, jobv, jobq, m, n, p, k, l, a, lda, b, ldb, alpha, beta, u, ldu, v, ldv, q, ldq, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sggsvp "F_FUNC(sggsvp,SGGSVP)"(char *jobu, char *jobv, char *jobq, int *m, int *p, int *n, s *a, int *lda, s *b, int *ldb, s *tola, s *tolb, int *k, int *l, s *u, int *ldu, s *v, int *ldv, s *q, int *ldq, int *iwork, s *tau, s *work, int *info) nogil
cdef void sggsvp(char *jobu, char *jobv, char *jobq, int *m, int *p, int *n, s *a, int *lda, s *b, int *ldb, s *tola, s *tolb, int *k, int *l, s *u, int *ldu, s *v, int *ldv, s *q, int *ldq, int *iwork, s *tau, s *work, int *info) nogil:
    _fortran_sggsvp(jobu, jobv, jobq, m, p, n, a, lda, b, ldb, tola, tolb, k, l, u, ldu, v, ldv, q, ldq, iwork, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgtcon "F_FUNC(sgtcon,SGTCON)"(char *norm, int *n, s *dl, s *d, s *du, s *du2, int *ipiv, s *anorm, s *rcond, s *work, int *iwork, int *info) nogil
cdef void sgtcon(char *norm, int *n, s *dl, s *d, s *du, s *du2, int *ipiv, s *anorm, s *rcond, s *work, int *iwork, int *info) nogil:
    _fortran_sgtcon(norm, n, dl, d, du, du2, ipiv, anorm, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgtrfs "F_FUNC(sgtrfs,SGTRFS)"(char *trans, int *n, int *nrhs, s *dl, s *d, s *du, s *dlf, s *df, s *duf, s *du2, int *ipiv, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void sgtrfs(char *trans, int *n, int *nrhs, s *dl, s *d, s *du, s *dlf, s *df, s *duf, s *du2, int *ipiv, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_sgtrfs(trans, n, nrhs, dl, d, du, dlf, df, duf, du2, ipiv, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgtsv "F_FUNC(sgtsv,SGTSV)"(int *n, int *nrhs, s *dl, s *d, s *du, s *b, int *ldb, int *info) nogil
cdef void sgtsv(int *n, int *nrhs, s *dl, s *d, s *du, s *b, int *ldb, int *info) nogil:
    _fortran_sgtsv(n, nrhs, dl, d, du, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgtsvx "F_FUNC(sgtsvx,SGTSVX)"(char *fact, char *trans, int *n, int *nrhs, s *dl, s *d, s *du, s *dlf, s *df, s *duf, s *du2, int *ipiv, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void sgtsvx(char *fact, char *trans, int *n, int *nrhs, s *dl, s *d, s *du, s *dlf, s *df, s *duf, s *du2, int *ipiv, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_sgtsvx(fact, trans, n, nrhs, dl, d, du, dlf, df, duf, du2, ipiv, b, ldb, x, ldx, rcond, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgttrf "F_FUNC(sgttrf,SGTTRF)"(int *n, s *dl, s *d, s *du, s *du2, int *ipiv, int *info) nogil
cdef void sgttrf(int *n, s *dl, s *d, s *du, s *du2, int *ipiv, int *info) nogil:
    _fortran_sgttrf(n, dl, d, du, du2, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgttrs "F_FUNC(sgttrs,SGTTRS)"(char *trans, int *n, int *nrhs, s *dl, s *d, s *du, s *du2, int *ipiv, s *b, int *ldb, int *info) nogil
cdef void sgttrs(char *trans, int *n, int *nrhs, s *dl, s *d, s *du, s *du2, int *ipiv, s *b, int *ldb, int *info) nogil:
    _fortran_sgttrs(trans, n, nrhs, dl, d, du, du2, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sgtts2 "F_FUNC(sgtts2,SGTTS2)"(int *itrans, int *n, int *nrhs, s *dl, s *d, s *du, s *du2, int *ipiv, s *b, int *ldb) nogil
cdef void sgtts2(int *itrans, int *n, int *nrhs, s *dl, s *d, s *du, s *du2, int *ipiv, s *b, int *ldb) nogil:
    _fortran_sgtts2(itrans, n, nrhs, dl, d, du, du2, ipiv, b, ldb)

cdef extern from "_lapack_subroutines.h":
    void _fortran_shgeqz "F_FUNC(shgeqz,SHGEQZ)"(char *job, char *compq, char *compz, int *n, int *ilo, int *ihi, s *h, int *ldh, s *t, int *ldt, s *alphar, s *alphai, s *beta, s *q, int *ldq, s *z, int *ldz, s *work, int *lwork, int *info) nogil
cdef void shgeqz(char *job, char *compq, char *compz, int *n, int *ilo, int *ihi, s *h, int *ldh, s *t, int *ldt, s *alphar, s *alphai, s *beta, s *q, int *ldq, s *z, int *ldz, s *work, int *lwork, int *info) nogil:
    _fortran_shgeqz(job, compq, compz, n, ilo, ihi, h, ldh, t, ldt, alphar, alphai, beta, q, ldq, z, ldz, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_shsein "F_FUNC(shsein,SHSEIN)"(char *side, char *eigsrc, char *initv, bint *select, int *n, s *h, int *ldh, s *wr, s *wi, s *vl, int *ldvl, s *vr, int *ldvr, int *mm, int *m, s *work, int *ifaill, int *ifailr, int *info) nogil
cdef void shsein(char *side, char *eigsrc, char *initv, bint *select, int *n, s *h, int *ldh, s *wr, s *wi, s *vl, int *ldvl, s *vr, int *ldvr, int *mm, int *m, s *work, int *ifaill, int *ifailr, int *info) nogil:
    _fortran_shsein(side, eigsrc, initv, select, n, h, ldh, wr, wi, vl, ldvl, vr, ldvr, mm, m, work, ifaill, ifailr, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_shseqr "F_FUNC(shseqr,SHSEQR)"(char *job, char *compz, int *n, int *ilo, int *ihi, s *h, int *ldh, s *wr, s *wi, s *z, int *ldz, s *work, int *lwork, int *info) nogil
cdef void shseqr(char *job, char *compz, int *n, int *ilo, int *ihi, s *h, int *ldh, s *wr, s *wi, s *z, int *ldz, s *work, int *lwork, int *info) nogil:
    _fortran_shseqr(job, compz, n, ilo, ihi, h, ldh, wr, wi, z, ldz, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_slacn2 "F_FUNC(slacn2,SLACN2)"(int *n, s *v, s *x, int *isgn, s *est, int *kase, int *isave) nogil
cdef void slacn2(int *n, s *v, s *x, int *isgn, s *est, int *kase, int *isave) nogil:
    _fortran_slacn2(n, v, x, isgn, est, kase, isave)

cdef extern from "_lapack_subroutines.h":
    void _fortran_slacon "F_FUNC(slacon,SLACON)"(int *n, s *v, s *x, int *isgn, s *est, int *kase) nogil
cdef void slacon(int *n, s *v, s *x, int *isgn, s *est, int *kase) nogil:
    _fortran_slacon(n, v, x, isgn, est, kase)

cdef extern from "_lapack_subroutines.h":
    void _fortran_slanv2 "F_FUNC(slanv2,SLANV2)"(s *a, s *b, s *c, s *d, s *rt1r, s *rt1i, s *rt2r, s *rt2i, s *cs, s *sn) nogil
cdef void slanv2(s *a, s *b, s *c, s *d, s *rt1r, s *rt1i, s *rt2r, s *rt2i, s *cs, s *sn) nogil:
    _fortran_slanv2(a, b, c, d, rt1r, rt1i, rt2r, rt2i, cs, sn)

cdef extern from "_lapack_subroutines.h":
    void _fortran_slarf "F_FUNC(slarf,SLARF)"(char *side, int *m, int *n, s *v, int *incv, s *tau, s *c, int *ldc, s *work) nogil
cdef void slarf(char *side, int *m, int *n, s *v, int *incv, s *tau, s *c, int *ldc, s *work) nogil:
    _fortran_slarf(side, m, n, v, incv, tau, c, ldc, work)

cdef extern from "_lapack_subroutines.h":
    void _fortran_slarz "F_FUNC(slarz,SLARZ)"(char *side, int *m, int *n, int *l, s *v, int *incv, s *tau, s *c, int *ldc, s *work) nogil
cdef void slarz(char *side, int *m, int *n, int *l, s *v, int *incv, s *tau, s *c, int *ldc, s *work) nogil:
    _fortran_slarz(side, m, n, l, v, incv, tau, c, ldc, work)

cdef extern from "_lapack_subroutines.h":
    void _fortran_slaswp "F_FUNC(slaswp,SLASWP)"(int *n, s *a, int *lda, int *k1, int *k2, int *ipiv, int *incx) nogil
cdef void slaswp(int *n, s *a, int *lda, int *k1, int *k2, int *ipiv, int *incx) nogil:
    _fortran_slaswp(n, a, lda, k1, k2, ipiv, incx)

cdef extern from "_lapack_subroutines.h":
    void _fortran_slauum "F_FUNC(slauum,SLAUUM)"(char *uplo, int *n, s *a, int *lda, int *info) nogil
cdef void slauum(char *uplo, int *n, s *a, int *lda, int *info) nogil:
    _fortran_slauum(uplo, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sopgtr "F_FUNC(sopgtr,SOPGTR)"(char *uplo, int *n, s *ap, s *tau, s *q, int *ldq, s *work, int *info) nogil
cdef void sopgtr(char *uplo, int *n, s *ap, s *tau, s *q, int *ldq, s *work, int *info) nogil:
    _fortran_sopgtr(uplo, n, ap, tau, q, ldq, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sopmtr "F_FUNC(sopmtr,SOPMTR)"(char *side, char *uplo, char *trans, int *m, int *n, s *ap, s *tau, s *c, int *ldc, s *work, int *info) nogil
cdef void sopmtr(char *side, char *uplo, char *trans, int *m, int *n, s *ap, s *tau, s *c, int *ldc, s *work, int *info) nogil:
    _fortran_sopmtr(side, uplo, trans, m, n, ap, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sorg2l "F_FUNC(sorg2l,SORG2L)"(int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *info) nogil
cdef void sorg2l(int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *info) nogil:
    _fortran_sorg2l(m, n, k, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sorg2r "F_FUNC(sorg2r,SORG2R)"(int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *info) nogil
cdef void sorg2r(int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *info) nogil:
    _fortran_sorg2r(m, n, k, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sorgbr "F_FUNC(sorgbr,SORGBR)"(char *vect, int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil
cdef void sorgbr(char *vect, int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil:
    _fortran_sorgbr(vect, m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sorghr "F_FUNC(sorghr,SORGHR)"(int *n, int *ilo, int *ihi, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil
cdef void sorghr(int *n, int *ilo, int *ihi, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil:
    _fortran_sorghr(n, ilo, ihi, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sorgl2 "F_FUNC(sorgl2,SORGL2)"(int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *info) nogil
cdef void sorgl2(int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *info) nogil:
    _fortran_sorgl2(m, n, k, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sorglq "F_FUNC(sorglq,SORGLQ)"(int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil
cdef void sorglq(int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil:
    _fortran_sorglq(m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sorgql "F_FUNC(sorgql,SORGQL)"(int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil
cdef void sorgql(int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil:
    _fortran_sorgql(m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sorgqr "F_FUNC(sorgqr,SORGQR)"(int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil
cdef void sorgqr(int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil:
    _fortran_sorgqr(m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sorgr2 "F_FUNC(sorgr2,SORGR2)"(int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *info) nogil
cdef void sorgr2(int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *info) nogil:
    _fortran_sorgr2(m, n, k, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sorgrq "F_FUNC(sorgrq,SORGRQ)"(int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil
cdef void sorgrq(int *m, int *n, int *k, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil:
    _fortran_sorgrq(m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sorgtr "F_FUNC(sorgtr,SORGTR)"(char *uplo, int *n, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil
cdef void sorgtr(char *uplo, int *n, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil:
    _fortran_sorgtr(uplo, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sorm2l "F_FUNC(sorm2l,SORM2L)"(char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *info) nogil
cdef void sorm2l(char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *info) nogil:
    _fortran_sorm2l(side, trans, m, n, k, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sorm2r "F_FUNC(sorm2r,SORM2R)"(char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *info) nogil
cdef void sorm2r(char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *info) nogil:
    _fortran_sorm2r(side, trans, m, n, k, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sormbr "F_FUNC(sormbr,SORMBR)"(char *vect, char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *lwork, int *info) nogil
cdef void sormbr(char *vect, char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *lwork, int *info) nogil:
    _fortran_sormbr(vect, side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sormhr "F_FUNC(sormhr,SORMHR)"(char *side, char *trans, int *m, int *n, int *ilo, int *ihi, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *lwork, int *info) nogil
cdef void sormhr(char *side, char *trans, int *m, int *n, int *ilo, int *ihi, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *lwork, int *info) nogil:
    _fortran_sormhr(side, trans, m, n, ilo, ihi, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sorml2 "F_FUNC(sorml2,SORML2)"(char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *info) nogil
cdef void sorml2(char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *info) nogil:
    _fortran_sorml2(side, trans, m, n, k, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sormlq "F_FUNC(sormlq,SORMLQ)"(char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *lwork, int *info) nogil
cdef void sormlq(char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *lwork, int *info) nogil:
    _fortran_sormlq(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sormql "F_FUNC(sormql,SORMQL)"(char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *lwork, int *info) nogil
cdef void sormql(char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *lwork, int *info) nogil:
    _fortran_sormql(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sormqr "F_FUNC(sormqr,SORMQR)"(char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *lwork, int *info) nogil
cdef void sormqr(char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *lwork, int *info) nogil:
    _fortran_sormqr(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sormr2 "F_FUNC(sormr2,SORMR2)"(char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *info) nogil
cdef void sormr2(char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *info) nogil:
    _fortran_sormr2(side, trans, m, n, k, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sormr3 "F_FUNC(sormr3,SORMR3)"(char *side, char *trans, int *m, int *n, int *k, int *l, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *info) nogil
cdef void sormr3(char *side, char *trans, int *m, int *n, int *k, int *l, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *info) nogil:
    _fortran_sormr3(side, trans, m, n, k, l, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sormrq "F_FUNC(sormrq,SORMRQ)"(char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *lwork, int *info) nogil
cdef void sormrq(char *side, char *trans, int *m, int *n, int *k, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *lwork, int *info) nogil:
    _fortran_sormrq(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sormrz "F_FUNC(sormrz,SORMRZ)"(char *side, char *trans, int *m, int *n, int *k, int *l, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *lwork, int *info) nogil
cdef void sormrz(char *side, char *trans, int *m, int *n, int *k, int *l, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *lwork, int *info) nogil:
    _fortran_sormrz(side, trans, m, n, k, l, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sormtr "F_FUNC(sormtr,SORMTR)"(char *side, char *uplo, char *trans, int *m, int *n, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *lwork, int *info) nogil
cdef void sormtr(char *side, char *uplo, char *trans, int *m, int *n, s *a, int *lda, s *tau, s *c, int *ldc, s *work, int *lwork, int *info) nogil:
    _fortran_sormtr(side, uplo, trans, m, n, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spbcon "F_FUNC(spbcon,SPBCON)"(char *uplo, int *n, int *kd, s *ab, int *ldab, s *anorm, s *rcond, s *work, int *iwork, int *info) nogil
cdef void spbcon(char *uplo, int *n, int *kd, s *ab, int *ldab, s *anorm, s *rcond, s *work, int *iwork, int *info) nogil:
    _fortran_spbcon(uplo, n, kd, ab, ldab, anorm, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spbequ "F_FUNC(spbequ,SPBEQU)"(char *uplo, int *n, int *kd, s *ab, int *ldab, s *s, s *scond, s *amax, int *info) nogil
cdef void spbequ(char *uplo, int *n, int *kd, s *ab, int *ldab, s *s, s *scond, s *amax, int *info) nogil:
    _fortran_spbequ(uplo, n, kd, ab, ldab, s, scond, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spbrfs "F_FUNC(spbrfs,SPBRFS)"(char *uplo, int *n, int *kd, int *nrhs, s *ab, int *ldab, s *afb, int *ldafb, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void spbrfs(char *uplo, int *n, int *kd, int *nrhs, s *ab, int *ldab, s *afb, int *ldafb, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_spbrfs(uplo, n, kd, nrhs, ab, ldab, afb, ldafb, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spbstf "F_FUNC(spbstf,SPBSTF)"(char *uplo, int *n, int *kd, s *ab, int *ldab, int *info) nogil
cdef void spbstf(char *uplo, int *n, int *kd, s *ab, int *ldab, int *info) nogil:
    _fortran_spbstf(uplo, n, kd, ab, ldab, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spbsv "F_FUNC(spbsv,SPBSV)"(char *uplo, int *n, int *kd, int *nrhs, s *ab, int *ldab, s *b, int *ldb, int *info) nogil
cdef void spbsv(char *uplo, int *n, int *kd, int *nrhs, s *ab, int *ldab, s *b, int *ldb, int *info) nogil:
    _fortran_spbsv(uplo, n, kd, nrhs, ab, ldab, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spbsvx "F_FUNC(spbsvx,SPBSVX)"(char *fact, char *uplo, int *n, int *kd, int *nrhs, s *ab, int *ldab, s *afb, int *ldafb, char *equed, s *s, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void spbsvx(char *fact, char *uplo, int *n, int *kd, int *nrhs, s *ab, int *ldab, s *afb, int *ldafb, char *equed, s *s, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_spbsvx(fact, uplo, n, kd, nrhs, ab, ldab, afb, ldafb, equed, s, b, ldb, x, ldx, rcond, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spbtf2 "F_FUNC(spbtf2,SPBTF2)"(char *uplo, int *n, int *kd, s *ab, int *ldab, int *info) nogil
cdef void spbtf2(char *uplo, int *n, int *kd, s *ab, int *ldab, int *info) nogil:
    _fortran_spbtf2(uplo, n, kd, ab, ldab, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spbtrf "F_FUNC(spbtrf,SPBTRF)"(char *uplo, int *n, int *kd, s *ab, int *ldab, int *info) nogil
cdef void spbtrf(char *uplo, int *n, int *kd, s *ab, int *ldab, int *info) nogil:
    _fortran_spbtrf(uplo, n, kd, ab, ldab, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spbtrs "F_FUNC(spbtrs,SPBTRS)"(char *uplo, int *n, int *kd, int *nrhs, s *ab, int *ldab, s *b, int *ldb, int *info) nogil
cdef void spbtrs(char *uplo, int *n, int *kd, int *nrhs, s *ab, int *ldab, s *b, int *ldb, int *info) nogil:
    _fortran_spbtrs(uplo, n, kd, nrhs, ab, ldab, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spocon "F_FUNC(spocon,SPOCON)"(char *uplo, int *n, s *a, int *lda, s *anorm, s *rcond, s *work, int *iwork, int *info) nogil
cdef void spocon(char *uplo, int *n, s *a, int *lda, s *anorm, s *rcond, s *work, int *iwork, int *info) nogil:
    _fortran_spocon(uplo, n, a, lda, anorm, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spoequ "F_FUNC(spoequ,SPOEQU)"(int *n, s *a, int *lda, s *s, s *scond, s *amax, int *info) nogil
cdef void spoequ(int *n, s *a, int *lda, s *s, s *scond, s *amax, int *info) nogil:
    _fortran_spoequ(n, a, lda, s, scond, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sporfs "F_FUNC(sporfs,SPORFS)"(char *uplo, int *n, int *nrhs, s *a, int *lda, s *af, int *ldaf, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void sporfs(char *uplo, int *n, int *nrhs, s *a, int *lda, s *af, int *ldaf, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_sporfs(uplo, n, nrhs, a, lda, af, ldaf, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sposv "F_FUNC(sposv,SPOSV)"(char *uplo, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, int *info) nogil
cdef void sposv(char *uplo, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, int *info) nogil:
    _fortran_sposv(uplo, n, nrhs, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sposvx "F_FUNC(sposvx,SPOSVX)"(char *fact, char *uplo, int *n, int *nrhs, s *a, int *lda, s *af, int *ldaf, char *equed, s *s, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void sposvx(char *fact, char *uplo, int *n, int *nrhs, s *a, int *lda, s *af, int *ldaf, char *equed, s *s, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_sposvx(fact, uplo, n, nrhs, a, lda, af, ldaf, equed, s, b, ldb, x, ldx, rcond, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spotf2 "F_FUNC(spotf2,SPOTF2)"(char *uplo, int *n, s *a, int *lda, int *info) nogil
cdef void spotf2(char *uplo, int *n, s *a, int *lda, int *info) nogil:
    _fortran_spotf2(uplo, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spotrf "F_FUNC(spotrf,SPOTRF)"(char *uplo, int *n, s *a, int *lda, int *info) nogil
cdef void spotrf(char *uplo, int *n, s *a, int *lda, int *info) nogil:
    _fortran_spotrf(uplo, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spotri "F_FUNC(spotri,SPOTRI)"(char *uplo, int *n, s *a, int *lda, int *info) nogil
cdef void spotri(char *uplo, int *n, s *a, int *lda, int *info) nogil:
    _fortran_spotri(uplo, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spotrs "F_FUNC(spotrs,SPOTRS)"(char *uplo, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, int *info) nogil
cdef void spotrs(char *uplo, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, int *info) nogil:
    _fortran_spotrs(uplo, n, nrhs, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sppcon "F_FUNC(sppcon,SPPCON)"(char *uplo, int *n, s *ap, s *anorm, s *rcond, s *work, int *iwork, int *info) nogil
cdef void sppcon(char *uplo, int *n, s *ap, s *anorm, s *rcond, s *work, int *iwork, int *info) nogil:
    _fortran_sppcon(uplo, n, ap, anorm, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sppequ "F_FUNC(sppequ,SPPEQU)"(char *uplo, int *n, s *ap, s *s, s *scond, s *amax, int *info) nogil
cdef void sppequ(char *uplo, int *n, s *ap, s *s, s *scond, s *amax, int *info) nogil:
    _fortran_sppequ(uplo, n, ap, s, scond, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spprfs "F_FUNC(spprfs,SPPRFS)"(char *uplo, int *n, int *nrhs, s *ap, s *afp, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void spprfs(char *uplo, int *n, int *nrhs, s *ap, s *afp, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_spprfs(uplo, n, nrhs, ap, afp, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sppsv "F_FUNC(sppsv,SPPSV)"(char *uplo, int *n, int *nrhs, s *ap, s *b, int *ldb, int *info) nogil
cdef void sppsv(char *uplo, int *n, int *nrhs, s *ap, s *b, int *ldb, int *info) nogil:
    _fortran_sppsv(uplo, n, nrhs, ap, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sppsvx "F_FUNC(sppsvx,SPPSVX)"(char *fact, char *uplo, int *n, int *nrhs, s *ap, s *afp, char *equed, s *s, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void sppsvx(char *fact, char *uplo, int *n, int *nrhs, s *ap, s *afp, char *equed, s *s, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_sppsvx(fact, uplo, n, nrhs, ap, afp, equed, s, b, ldb, x, ldx, rcond, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spptrf "F_FUNC(spptrf,SPPTRF)"(char *uplo, int *n, s *ap, int *info) nogil
cdef void spptrf(char *uplo, int *n, s *ap, int *info) nogil:
    _fortran_spptrf(uplo, n, ap, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spptri "F_FUNC(spptri,SPPTRI)"(char *uplo, int *n, s *ap, int *info) nogil
cdef void spptri(char *uplo, int *n, s *ap, int *info) nogil:
    _fortran_spptri(uplo, n, ap, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spptrs "F_FUNC(spptrs,SPPTRS)"(char *uplo, int *n, int *nrhs, s *ap, s *b, int *ldb, int *info) nogil
cdef void spptrs(char *uplo, int *n, int *nrhs, s *ap, s *b, int *ldb, int *info) nogil:
    _fortran_spptrs(uplo, n, nrhs, ap, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sptcon "F_FUNC(sptcon,SPTCON)"(int *n, s *d, s *e, s *anorm, s *rcond, s *work, int *info) nogil
cdef void sptcon(int *n, s *d, s *e, s *anorm, s *rcond, s *work, int *info) nogil:
    _fortran_sptcon(n, d, e, anorm, rcond, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spteqr "F_FUNC(spteqr,SPTEQR)"(char *compz, int *n, s *d, s *e, s *z, int *ldz, s *work, int *info) nogil
cdef void spteqr(char *compz, int *n, s *d, s *e, s *z, int *ldz, s *work, int *info) nogil:
    _fortran_spteqr(compz, n, d, e, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sptrfs "F_FUNC(sptrfs,SPTRFS)"(int *n, int *nrhs, s *d, s *e, s *df, s *ef, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *info) nogil
cdef void sptrfs(int *n, int *nrhs, s *d, s *e, s *df, s *ef, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *info) nogil:
    _fortran_sptrfs(n, nrhs, d, e, df, ef, b, ldb, x, ldx, ferr, berr, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sptsv "F_FUNC(sptsv,SPTSV)"(int *n, int *nrhs, s *d, s *e, s *b, int *ldb, int *info) nogil
cdef void sptsv(int *n, int *nrhs, s *d, s *e, s *b, int *ldb, int *info) nogil:
    _fortran_sptsv(n, nrhs, d, e, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sptsvx "F_FUNC(sptsvx,SPTSVX)"(char *fact, int *n, int *nrhs, s *d, s *e, s *df, s *ef, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *info) nogil
cdef void sptsvx(char *fact, int *n, int *nrhs, s *d, s *e, s *df, s *ef, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *info) nogil:
    _fortran_sptsvx(fact, n, nrhs, d, e, df, ef, b, ldb, x, ldx, rcond, ferr, berr, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spttrf "F_FUNC(spttrf,SPTTRF)"(int *n, s *d, s *e, int *info) nogil
cdef void spttrf(int *n, s *d, s *e, int *info) nogil:
    _fortran_spttrf(n, d, e, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_spttrs "F_FUNC(spttrs,SPTTRS)"(int *n, int *nrhs, s *d, s *e, s *b, int *ldb, int *info) nogil
cdef void spttrs(int *n, int *nrhs, s *d, s *e, s *b, int *ldb, int *info) nogil:
    _fortran_spttrs(n, nrhs, d, e, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sptts2 "F_FUNC(sptts2,SPTTS2)"(int *n, int *nrhs, s *d, s *e, s *b, int *ldb) nogil
cdef void sptts2(int *n, int *nrhs, s *d, s *e, s *b, int *ldb) nogil:
    _fortran_sptts2(n, nrhs, d, e, b, ldb)

cdef extern from "_lapack_subroutines.h":
    void _fortran_srscl "F_FUNC(srscl,SRSCL)"(int *n, s *sa, s *sx, int *incx) nogil
cdef void srscl(int *n, s *sa, s *sx, int *incx) nogil:
    _fortran_srscl(n, sa, sx, incx)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssbev "F_FUNC(ssbev,SSBEV)"(char *jobz, char *uplo, int *n, int *kd, s *ab, int *ldab, s *w, s *z, int *ldz, s *work, int *info) nogil
cdef void ssbev(char *jobz, char *uplo, int *n, int *kd, s *ab, int *ldab, s *w, s *z, int *ldz, s *work, int *info) nogil:
    _fortran_ssbev(jobz, uplo, n, kd, ab, ldab, w, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssbevd "F_FUNC(ssbevd,SSBEVD)"(char *jobz, char *uplo, int *n, int *kd, s *ab, int *ldab, s *w, s *z, int *ldz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void ssbevd(char *jobz, char *uplo, int *n, int *kd, s *ab, int *ldab, s *w, s *z, int *ldz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_ssbevd(jobz, uplo, n, kd, ab, ldab, w, z, ldz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssbevx "F_FUNC(ssbevx,SSBEVX)"(char *jobz, char *range, char *uplo, int *n, int *kd, s *ab, int *ldab, s *q, int *ldq, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, s *work, int *iwork, int *ifail, int *info) nogil
cdef void ssbevx(char *jobz, char *range, char *uplo, int *n, int *kd, s *ab, int *ldab, s *q, int *ldq, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, s *work, int *iwork, int *ifail, int *info) nogil:
    _fortran_ssbevx(jobz, range, uplo, n, kd, ab, ldab, q, ldq, vl, vu, il, iu, abstol, m, w, z, ldz, work, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssbgst "F_FUNC(ssbgst,SSBGST)"(char *vect, char *uplo, int *n, int *ka, int *kb, s *ab, int *ldab, s *bb, int *ldbb, s *x, int *ldx, s *work, int *info) nogil
cdef void ssbgst(char *vect, char *uplo, int *n, int *ka, int *kb, s *ab, int *ldab, s *bb, int *ldbb, s *x, int *ldx, s *work, int *info) nogil:
    _fortran_ssbgst(vect, uplo, n, ka, kb, ab, ldab, bb, ldbb, x, ldx, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssbgv "F_FUNC(ssbgv,SSBGV)"(char *jobz, char *uplo, int *n, int *ka, int *kb, s *ab, int *ldab, s *bb, int *ldbb, s *w, s *z, int *ldz, s *work, int *info) nogil
cdef void ssbgv(char *jobz, char *uplo, int *n, int *ka, int *kb, s *ab, int *ldab, s *bb, int *ldbb, s *w, s *z, int *ldz, s *work, int *info) nogil:
    _fortran_ssbgv(jobz, uplo, n, ka, kb, ab, ldab, bb, ldbb, w, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssbgvd "F_FUNC(ssbgvd,SSBGVD)"(char *jobz, char *uplo, int *n, int *ka, int *kb, s *ab, int *ldab, s *bb, int *ldbb, s *w, s *z, int *ldz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void ssbgvd(char *jobz, char *uplo, int *n, int *ka, int *kb, s *ab, int *ldab, s *bb, int *ldbb, s *w, s *z, int *ldz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_ssbgvd(jobz, uplo, n, ka, kb, ab, ldab, bb, ldbb, w, z, ldz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssbgvx "F_FUNC(ssbgvx,SSBGVX)"(char *jobz, char *range, char *uplo, int *n, int *ka, int *kb, s *ab, int *ldab, s *bb, int *ldbb, s *q, int *ldq, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, s *work, int *iwork, int *ifail, int *info) nogil
cdef void ssbgvx(char *jobz, char *range, char *uplo, int *n, int *ka, int *kb, s *ab, int *ldab, s *bb, int *ldbb, s *q, int *ldq, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, s *work, int *iwork, int *ifail, int *info) nogil:
    _fortran_ssbgvx(jobz, range, uplo, n, ka, kb, ab, ldab, bb, ldbb, q, ldq, vl, vu, il, iu, abstol, m, w, z, ldz, work, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssbtrd "F_FUNC(ssbtrd,SSBTRD)"(char *vect, char *uplo, int *n, int *kd, s *ab, int *ldab, s *d, s *e, s *q, int *ldq, s *work, int *info) nogil
cdef void ssbtrd(char *vect, char *uplo, int *n, int *kd, s *ab, int *ldab, s *d, s *e, s *q, int *ldq, s *work, int *info) nogil:
    _fortran_ssbtrd(vect, uplo, n, kd, ab, ldab, d, e, q, ldq, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sspcon "F_FUNC(sspcon,SSPCON)"(char *uplo, int *n, s *ap, int *ipiv, s *anorm, s *rcond, s *work, int *iwork, int *info) nogil
cdef void sspcon(char *uplo, int *n, s *ap, int *ipiv, s *anorm, s *rcond, s *work, int *iwork, int *info) nogil:
    _fortran_sspcon(uplo, n, ap, ipiv, anorm, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sspev "F_FUNC(sspev,SSPEV)"(char *jobz, char *uplo, int *n, s *ap, s *w, s *z, int *ldz, s *work, int *info) nogil
cdef void sspev(char *jobz, char *uplo, int *n, s *ap, s *w, s *z, int *ldz, s *work, int *info) nogil:
    _fortran_sspev(jobz, uplo, n, ap, w, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sspevd "F_FUNC(sspevd,SSPEVD)"(char *jobz, char *uplo, int *n, s *ap, s *w, s *z, int *ldz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void sspevd(char *jobz, char *uplo, int *n, s *ap, s *w, s *z, int *ldz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_sspevd(jobz, uplo, n, ap, w, z, ldz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sspevx "F_FUNC(sspevx,SSPEVX)"(char *jobz, char *range, char *uplo, int *n, s *ap, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, s *work, int *iwork, int *ifail, int *info) nogil
cdef void sspevx(char *jobz, char *range, char *uplo, int *n, s *ap, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, s *work, int *iwork, int *ifail, int *info) nogil:
    _fortran_sspevx(jobz, range, uplo, n, ap, vl, vu, il, iu, abstol, m, w, z, ldz, work, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sspgst "F_FUNC(sspgst,SSPGST)"(int *itype, char *uplo, int *n, s *ap, s *bp, int *info) nogil
cdef void sspgst(int *itype, char *uplo, int *n, s *ap, s *bp, int *info) nogil:
    _fortran_sspgst(itype, uplo, n, ap, bp, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sspgv "F_FUNC(sspgv,SSPGV)"(int *itype, char *jobz, char *uplo, int *n, s *ap, s *bp, s *w, s *z, int *ldz, s *work, int *info) nogil
cdef void sspgv(int *itype, char *jobz, char *uplo, int *n, s *ap, s *bp, s *w, s *z, int *ldz, s *work, int *info) nogil:
    _fortran_sspgv(itype, jobz, uplo, n, ap, bp, w, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sspgvd "F_FUNC(sspgvd,SSPGVD)"(int *itype, char *jobz, char *uplo, int *n, s *ap, s *bp, s *w, s *z, int *ldz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void sspgvd(int *itype, char *jobz, char *uplo, int *n, s *ap, s *bp, s *w, s *z, int *ldz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_sspgvd(itype, jobz, uplo, n, ap, bp, w, z, ldz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sspgvx "F_FUNC(sspgvx,SSPGVX)"(int *itype, char *jobz, char *range, char *uplo, int *n, s *ap, s *bp, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, s *work, int *iwork, int *ifail, int *info) nogil
cdef void sspgvx(int *itype, char *jobz, char *range, char *uplo, int *n, s *ap, s *bp, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, s *work, int *iwork, int *ifail, int *info) nogil:
    _fortran_sspgvx(itype, jobz, range, uplo, n, ap, bp, vl, vu, il, iu, abstol, m, w, z, ldz, work, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssprfs "F_FUNC(ssprfs,SSPRFS)"(char *uplo, int *n, int *nrhs, s *ap, s *afp, int *ipiv, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void ssprfs(char *uplo, int *n, int *nrhs, s *ap, s *afp, int *ipiv, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_ssprfs(uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sspsv "F_FUNC(sspsv,SSPSV)"(char *uplo, int *n, int *nrhs, s *ap, int *ipiv, s *b, int *ldb, int *info) nogil
cdef void sspsv(char *uplo, int *n, int *nrhs, s *ap, int *ipiv, s *b, int *ldb, int *info) nogil:
    _fortran_sspsv(uplo, n, nrhs, ap, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sspsvx "F_FUNC(sspsvx,SSPSVX)"(char *fact, char *uplo, int *n, int *nrhs, s *ap, s *afp, int *ipiv, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void sspsvx(char *fact, char *uplo, int *n, int *nrhs, s *ap, s *afp, int *ipiv, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_sspsvx(fact, uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx, rcond, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssptrd "F_FUNC(ssptrd,SSPTRD)"(char *uplo, int *n, s *ap, s *d, s *e, s *tau, int *info) nogil
cdef void ssptrd(char *uplo, int *n, s *ap, s *d, s *e, s *tau, int *info) nogil:
    _fortran_ssptrd(uplo, n, ap, d, e, tau, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssptrf "F_FUNC(ssptrf,SSPTRF)"(char *uplo, int *n, s *ap, int *ipiv, int *info) nogil
cdef void ssptrf(char *uplo, int *n, s *ap, int *ipiv, int *info) nogil:
    _fortran_ssptrf(uplo, n, ap, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssptri "F_FUNC(ssptri,SSPTRI)"(char *uplo, int *n, s *ap, int *ipiv, s *work, int *info) nogil
cdef void ssptri(char *uplo, int *n, s *ap, int *ipiv, s *work, int *info) nogil:
    _fortran_ssptri(uplo, n, ap, ipiv, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssptrs "F_FUNC(ssptrs,SSPTRS)"(char *uplo, int *n, int *nrhs, s *ap, int *ipiv, s *b, int *ldb, int *info) nogil
cdef void ssptrs(char *uplo, int *n, int *nrhs, s *ap, int *ipiv, s *b, int *ldb, int *info) nogil:
    _fortran_ssptrs(uplo, n, nrhs, ap, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sstebz "F_FUNC(sstebz,SSTEBZ)"(char *range, char *order, int *n, s *vl, s *vu, int *il, int *iu, s *abstol, s *d, s *e, int *m, int *nsplit, s *w, int *iblock, int *isplit, s *work, int *iwork, int *info) nogil
cdef void sstebz(char *range, char *order, int *n, s *vl, s *vu, int *il, int *iu, s *abstol, s *d, s *e, int *m, int *nsplit, s *w, int *iblock, int *isplit, s *work, int *iwork, int *info) nogil:
    _fortran_sstebz(range, order, n, vl, vu, il, iu, abstol, d, e, m, nsplit, w, iblock, isplit, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sstedc "F_FUNC(sstedc,SSTEDC)"(char *compz, int *n, s *d, s *e, s *z, int *ldz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void sstedc(char *compz, int *n, s *d, s *e, s *z, int *ldz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_sstedc(compz, n, d, e, z, ldz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sstegr "F_FUNC(sstegr,SSTEGR)"(char *jobz, char *range, int *n, s *d, s *e, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, int *isuppz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void sstegr(char *jobz, char *range, int *n, s *d, s *e, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, int *isuppz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_sstegr(jobz, range, n, d, e, vl, vu, il, iu, abstol, m, w, z, ldz, isuppz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sstein "F_FUNC(sstein,SSTEIN)"(int *n, s *d, s *e, int *m, s *w, int *iblock, int *isplit, s *z, int *ldz, s *work, int *iwork, int *ifail, int *info) nogil
cdef void sstein(int *n, s *d, s *e, int *m, s *w, int *iblock, int *isplit, s *z, int *ldz, s *work, int *iwork, int *ifail, int *info) nogil:
    _fortran_sstein(n, d, e, m, w, iblock, isplit, z, ldz, work, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sstemr "F_FUNC(sstemr,SSTEMR)"(char *jobz, char *range, int *n, s *d, s *e, s *vl, s *vu, int *il, int *iu, int *m, s *w, s *z, int *ldz, int *nzc, int *isuppz, bint *tryrac, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void sstemr(char *jobz, char *range, int *n, s *d, s *e, s *vl, s *vu, int *il, int *iu, int *m, s *w, s *z, int *ldz, int *nzc, int *isuppz, bint *tryrac, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_sstemr(jobz, range, n, d, e, vl, vu, il, iu, m, w, z, ldz, nzc, isuppz, tryrac, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssteqr "F_FUNC(ssteqr,SSTEQR)"(char *compz, int *n, s *d, s *e, s *z, int *ldz, s *work, int *info) nogil
cdef void ssteqr(char *compz, int *n, s *d, s *e, s *z, int *ldz, s *work, int *info) nogil:
    _fortran_ssteqr(compz, n, d, e, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssterf "F_FUNC(ssterf,SSTERF)"(int *n, s *d, s *e, int *info) nogil
cdef void ssterf(int *n, s *d, s *e, int *info) nogil:
    _fortran_ssterf(n, d, e, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sstev "F_FUNC(sstev,SSTEV)"(char *jobz, int *n, s *d, s *e, s *z, int *ldz, s *work, int *info) nogil
cdef void sstev(char *jobz, int *n, s *d, s *e, s *z, int *ldz, s *work, int *info) nogil:
    _fortran_sstev(jobz, n, d, e, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sstevd "F_FUNC(sstevd,SSTEVD)"(char *jobz, int *n, s *d, s *e, s *z, int *ldz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void sstevd(char *jobz, int *n, s *d, s *e, s *z, int *ldz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_sstevd(jobz, n, d, e, z, ldz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sstevr "F_FUNC(sstevr,SSTEVR)"(char *jobz, char *range, int *n, s *d, s *e, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, int *isuppz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void sstevr(char *jobz, char *range, int *n, s *d, s *e, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, int *isuppz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_sstevr(jobz, range, n, d, e, vl, vu, il, iu, abstol, m, w, z, ldz, isuppz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_sstevx "F_FUNC(sstevx,SSTEVX)"(char *jobz, char *range, int *n, s *d, s *e, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, s *work, int *iwork, int *ifail, int *info) nogil
cdef void sstevx(char *jobz, char *range, int *n, s *d, s *e, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, s *work, int *iwork, int *ifail, int *info) nogil:
    _fortran_sstevx(jobz, range, n, d, e, vl, vu, il, iu, abstol, m, w, z, ldz, work, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssycon "F_FUNC(ssycon,SSYCON)"(char *uplo, int *n, s *a, int *lda, int *ipiv, s *anorm, s *rcond, s *work, int *iwork, int *info) nogil
cdef void ssycon(char *uplo, int *n, s *a, int *lda, int *ipiv, s *anorm, s *rcond, s *work, int *iwork, int *info) nogil:
    _fortran_ssycon(uplo, n, a, lda, ipiv, anorm, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssyev "F_FUNC(ssyev,SSYEV)"(char *jobz, char *uplo, int *n, s *a, int *lda, s *w, s *work, int *lwork, int *info) nogil
cdef void ssyev(char *jobz, char *uplo, int *n, s *a, int *lda, s *w, s *work, int *lwork, int *info) nogil:
    _fortran_ssyev(jobz, uplo, n, a, lda, w, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssyevd "F_FUNC(ssyevd,SSYEVD)"(char *jobz, char *uplo, int *n, s *a, int *lda, s *w, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void ssyevd(char *jobz, char *uplo, int *n, s *a, int *lda, s *w, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_ssyevd(jobz, uplo, n, a, lda, w, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssyevr "F_FUNC(ssyevr,SSYEVR)"(char *jobz, char *range, char *uplo, int *n, s *a, int *lda, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, int *isuppz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void ssyevr(char *jobz, char *range, char *uplo, int *n, s *a, int *lda, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, int *isuppz, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_ssyevr(jobz, range, uplo, n, a, lda, vl, vu, il, iu, abstol, m, w, z, ldz, isuppz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssyevx "F_FUNC(ssyevx,SSYEVX)"(char *jobz, char *range, char *uplo, int *n, s *a, int *lda, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, s *work, int *lwork, int *iwork, int *ifail, int *info) nogil
cdef void ssyevx(char *jobz, char *range, char *uplo, int *n, s *a, int *lda, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, s *work, int *lwork, int *iwork, int *ifail, int *info) nogil:
    _fortran_ssyevx(jobz, range, uplo, n, a, lda, vl, vu, il, iu, abstol, m, w, z, ldz, work, lwork, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssygs2 "F_FUNC(ssygs2,SSYGS2)"(int *itype, char *uplo, int *n, s *a, int *lda, s *b, int *ldb, int *info) nogil
cdef void ssygs2(int *itype, char *uplo, int *n, s *a, int *lda, s *b, int *ldb, int *info) nogil:
    _fortran_ssygs2(itype, uplo, n, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssygst "F_FUNC(ssygst,SSYGST)"(int *itype, char *uplo, int *n, s *a, int *lda, s *b, int *ldb, int *info) nogil
cdef void ssygst(int *itype, char *uplo, int *n, s *a, int *lda, s *b, int *ldb, int *info) nogil:
    _fortran_ssygst(itype, uplo, n, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssygv "F_FUNC(ssygv,SSYGV)"(int *itype, char *jobz, char *uplo, int *n, s *a, int *lda, s *b, int *ldb, s *w, s *work, int *lwork, int *info) nogil
cdef void ssygv(int *itype, char *jobz, char *uplo, int *n, s *a, int *lda, s *b, int *ldb, s *w, s *work, int *lwork, int *info) nogil:
    _fortran_ssygv(itype, jobz, uplo, n, a, lda, b, ldb, w, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssygvd "F_FUNC(ssygvd,SSYGVD)"(int *itype, char *jobz, char *uplo, int *n, s *a, int *lda, s *b, int *ldb, s *w, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void ssygvd(int *itype, char *jobz, char *uplo, int *n, s *a, int *lda, s *b, int *ldb, s *w, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_ssygvd(itype, jobz, uplo, n, a, lda, b, ldb, w, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssygvx "F_FUNC(ssygvx,SSYGVX)"(int *itype, char *jobz, char *range, char *uplo, int *n, s *a, int *lda, s *b, int *ldb, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, s *work, int *lwork, int *iwork, int *ifail, int *info) nogil
cdef void ssygvx(int *itype, char *jobz, char *range, char *uplo, int *n, s *a, int *lda, s *b, int *ldb, s *vl, s *vu, int *il, int *iu, s *abstol, int *m, s *w, s *z, int *ldz, s *work, int *lwork, int *iwork, int *ifail, int *info) nogil:
    _fortran_ssygvx(itype, jobz, range, uplo, n, a, lda, b, ldb, vl, vu, il, iu, abstol, m, w, z, ldz, work, lwork, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssyrfs "F_FUNC(ssyrfs,SSYRFS)"(char *uplo, int *n, int *nrhs, s *a, int *lda, s *af, int *ldaf, int *ipiv, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void ssyrfs(char *uplo, int *n, int *nrhs, s *a, int *lda, s *af, int *ldaf, int *ipiv, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_ssyrfs(uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssysv "F_FUNC(ssysv,SSYSV)"(char *uplo, int *n, int *nrhs, s *a, int *lda, int *ipiv, s *b, int *ldb, s *work, int *lwork, int *info) nogil
cdef void ssysv(char *uplo, int *n, int *nrhs, s *a, int *lda, int *ipiv, s *b, int *ldb, s *work, int *lwork, int *info) nogil:
    _fortran_ssysv(uplo, n, nrhs, a, lda, ipiv, b, ldb, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssysvx "F_FUNC(ssysvx,SSYSVX)"(char *fact, char *uplo, int *n, int *nrhs, s *a, int *lda, s *af, int *ldaf, int *ipiv, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *lwork, int *iwork, int *info) nogil
cdef void ssysvx(char *fact, char *uplo, int *n, int *nrhs, s *a, int *lda, s *af, int *ldaf, int *ipiv, s *b, int *ldb, s *x, int *ldx, s *rcond, s *ferr, s *berr, s *work, int *lwork, int *iwork, int *info) nogil:
    _fortran_ssysvx(fact, uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb, x, ldx, rcond, ferr, berr, work, lwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssytd2 "F_FUNC(ssytd2,SSYTD2)"(char *uplo, int *n, s *a, int *lda, s *d, s *e, s *tau, int *info) nogil
cdef void ssytd2(char *uplo, int *n, s *a, int *lda, s *d, s *e, s *tau, int *info) nogil:
    _fortran_ssytd2(uplo, n, a, lda, d, e, tau, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssytf2 "F_FUNC(ssytf2,SSYTF2)"(char *uplo, int *n, s *a, int *lda, int *ipiv, int *info) nogil
cdef void ssytf2(char *uplo, int *n, s *a, int *lda, int *ipiv, int *info) nogil:
    _fortran_ssytf2(uplo, n, a, lda, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssytrd "F_FUNC(ssytrd,SSYTRD)"(char *uplo, int *n, s *a, int *lda, s *d, s *e, s *tau, s *work, int *lwork, int *info) nogil
cdef void ssytrd(char *uplo, int *n, s *a, int *lda, s *d, s *e, s *tau, s *work, int *lwork, int *info) nogil:
    _fortran_ssytrd(uplo, n, a, lda, d, e, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssytrf "F_FUNC(ssytrf,SSYTRF)"(char *uplo, int *n, s *a, int *lda, int *ipiv, s *work, int *lwork, int *info) nogil
cdef void ssytrf(char *uplo, int *n, s *a, int *lda, int *ipiv, s *work, int *lwork, int *info) nogil:
    _fortran_ssytrf(uplo, n, a, lda, ipiv, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssytri "F_FUNC(ssytri,SSYTRI)"(char *uplo, int *n, s *a, int *lda, int *ipiv, s *work, int *info) nogil
cdef void ssytri(char *uplo, int *n, s *a, int *lda, int *ipiv, s *work, int *info) nogil:
    _fortran_ssytri(uplo, n, a, lda, ipiv, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ssytrs "F_FUNC(ssytrs,SSYTRS)"(char *uplo, int *n, int *nrhs, s *a, int *lda, int *ipiv, s *b, int *ldb, int *info) nogil
cdef void ssytrs(char *uplo, int *n, int *nrhs, s *a, int *lda, int *ipiv, s *b, int *ldb, int *info) nogil:
    _fortran_ssytrs(uplo, n, nrhs, a, lda, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stbcon "F_FUNC(stbcon,STBCON)"(char *norm, char *uplo, char *diag, int *n, int *kd, s *ab, int *ldab, s *rcond, s *work, int *iwork, int *info) nogil
cdef void stbcon(char *norm, char *uplo, char *diag, int *n, int *kd, s *ab, int *ldab, s *rcond, s *work, int *iwork, int *info) nogil:
    _fortran_stbcon(norm, uplo, diag, n, kd, ab, ldab, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stbrfs "F_FUNC(stbrfs,STBRFS)"(char *uplo, char *trans, char *diag, int *n, int *kd, int *nrhs, s *ab, int *ldab, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void stbrfs(char *uplo, char *trans, char *diag, int *n, int *kd, int *nrhs, s *ab, int *ldab, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_stbrfs(uplo, trans, diag, n, kd, nrhs, ab, ldab, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stbtrs "F_FUNC(stbtrs,STBTRS)"(char *uplo, char *trans, char *diag, int *n, int *kd, int *nrhs, s *ab, int *ldab, s *b, int *ldb, int *info) nogil
cdef void stbtrs(char *uplo, char *trans, char *diag, int *n, int *kd, int *nrhs, s *ab, int *ldab, s *b, int *ldb, int *info) nogil:
    _fortran_stbtrs(uplo, trans, diag, n, kd, nrhs, ab, ldab, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stgevc "F_FUNC(stgevc,STGEVC)"(char *side, char *howmny, bint *select, int *n, s *s, int *lds, s *p, int *ldp, s *vl, int *ldvl, s *vr, int *ldvr, int *mm, int *m, s *work, int *info) nogil
cdef void stgevc(char *side, char *howmny, bint *select, int *n, s *s, int *lds, s *p, int *ldp, s *vl, int *ldvl, s *vr, int *ldvr, int *mm, int *m, s *work, int *info) nogil:
    _fortran_stgevc(side, howmny, select, n, s, lds, p, ldp, vl, ldvl, vr, ldvr, mm, m, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stgex2 "F_FUNC(stgex2,STGEX2)"(bint *wantq, bint *wantz, int *n, s *a, int *lda, s *b, int *ldb, s *q, int *ldq, s *z, int *ldz, int *j1, int *n1, int *n2, s *work, int *lwork, int *info) nogil
cdef void stgex2(bint *wantq, bint *wantz, int *n, s *a, int *lda, s *b, int *ldb, s *q, int *ldq, s *z, int *ldz, int *j1, int *n1, int *n2, s *work, int *lwork, int *info) nogil:
    _fortran_stgex2(wantq, wantz, n, a, lda, b, ldb, q, ldq, z, ldz, j1, n1, n2, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stgexc "F_FUNC(stgexc,STGEXC)"(bint *wantq, bint *wantz, int *n, s *a, int *lda, s *b, int *ldb, s *q, int *ldq, s *z, int *ldz, int *ifst, int *ilst, s *work, int *lwork, int *info) nogil
cdef void stgexc(bint *wantq, bint *wantz, int *n, s *a, int *lda, s *b, int *ldb, s *q, int *ldq, s *z, int *ldz, int *ifst, int *ilst, s *work, int *lwork, int *info) nogil:
    _fortran_stgexc(wantq, wantz, n, a, lda, b, ldb, q, ldq, z, ldz, ifst, ilst, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stgsen "F_FUNC(stgsen,STGSEN)"(int *ijob, bint *wantq, bint *wantz, bint *select, int *n, s *a, int *lda, s *b, int *ldb, s *alphar, s *alphai, s *beta, s *q, int *ldq, s *z, int *ldz, int *m, s *pl, s *pr, s *dif, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void stgsen(int *ijob, bint *wantq, bint *wantz, bint *select, int *n, s *a, int *lda, s *b, int *ldb, s *alphar, s *alphai, s *beta, s *q, int *ldq, s *z, int *ldz, int *m, s *pl, s *pr, s *dif, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_stgsen(ijob, wantq, wantz, select, n, a, lda, b, ldb, alphar, alphai, beta, q, ldq, z, ldz, m, pl, pr, dif, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stgsja "F_FUNC(stgsja,STGSJA)"(char *jobu, char *jobv, char *jobq, int *m, int *p, int *n, int *k, int *l, s *a, int *lda, s *b, int *ldb, s *tola, s *tolb, s *alpha, s *beta, s *u, int *ldu, s *v, int *ldv, s *q, int *ldq, s *work, int *ncycle, int *info) nogil
cdef void stgsja(char *jobu, char *jobv, char *jobq, int *m, int *p, int *n, int *k, int *l, s *a, int *lda, s *b, int *ldb, s *tola, s *tolb, s *alpha, s *beta, s *u, int *ldu, s *v, int *ldv, s *q, int *ldq, s *work, int *ncycle, int *info) nogil:
    _fortran_stgsja(jobu, jobv, jobq, m, p, n, k, l, a, lda, b, ldb, tola, tolb, alpha, beta, u, ldu, v, ldv, q, ldq, work, ncycle, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stgsna "F_FUNC(stgsna,STGSNA)"(char *job, char *howmny, bint *select, int *n, s *a, int *lda, s *b, int *ldb, s *vl, int *ldvl, s *vr, int *ldvr, s *s, s *dif, int *mm, int *m, s *work, int *lwork, int *iwork, int *info) nogil
cdef void stgsna(char *job, char *howmny, bint *select, int *n, s *a, int *lda, s *b, int *ldb, s *vl, int *ldvl, s *vr, int *ldvr, s *s, s *dif, int *mm, int *m, s *work, int *lwork, int *iwork, int *info) nogil:
    _fortran_stgsna(job, howmny, select, n, a, lda, b, ldb, vl, ldvl, vr, ldvr, s, dif, mm, m, work, lwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stgsy2 "F_FUNC(stgsy2,STGSY2)"(char *trans, int *ijob, int *m, int *n, s *a, int *lda, s *b, int *ldb, s *c, int *ldc, s *d, int *ldd, s *e, int *lde, s *f, int *ldf, s *scale, s *rdsum, s *rdscal, int *iwork, int *pq, int *info) nogil
cdef void stgsy2(char *trans, int *ijob, int *m, int *n, s *a, int *lda, s *b, int *ldb, s *c, int *ldc, s *d, int *ldd, s *e, int *lde, s *f, int *ldf, s *scale, s *rdsum, s *rdscal, int *iwork, int *pq, int *info) nogil:
    _fortran_stgsy2(trans, ijob, m, n, a, lda, b, ldb, c, ldc, d, ldd, e, lde, f, ldf, scale, rdsum, rdscal, iwork, pq, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stgsyl "F_FUNC(stgsyl,STGSYL)"(char *trans, int *ijob, int *m, int *n, s *a, int *lda, s *b, int *ldb, s *c, int *ldc, s *d, int *ldd, s *e, int *lde, s *f, int *ldf, s *scale, s *dif, s *work, int *lwork, int *iwork, int *info) nogil
cdef void stgsyl(char *trans, int *ijob, int *m, int *n, s *a, int *lda, s *b, int *ldb, s *c, int *ldc, s *d, int *ldd, s *e, int *lde, s *f, int *ldf, s *scale, s *dif, s *work, int *lwork, int *iwork, int *info) nogil:
    _fortran_stgsyl(trans, ijob, m, n, a, lda, b, ldb, c, ldc, d, ldd, e, lde, f, ldf, scale, dif, work, lwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stpcon "F_FUNC(stpcon,STPCON)"(char *norm, char *uplo, char *diag, int *n, s *ap, s *rcond, s *work, int *iwork, int *info) nogil
cdef void stpcon(char *norm, char *uplo, char *diag, int *n, s *ap, s *rcond, s *work, int *iwork, int *info) nogil:
    _fortran_stpcon(norm, uplo, diag, n, ap, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stprfs "F_FUNC(stprfs,STPRFS)"(char *uplo, char *trans, char *diag, int *n, int *nrhs, s *ap, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void stprfs(char *uplo, char *trans, char *diag, int *n, int *nrhs, s *ap, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_stprfs(uplo, trans, diag, n, nrhs, ap, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stptri "F_FUNC(stptri,STPTRI)"(char *uplo, char *diag, int *n, s *ap, int *info) nogil
cdef void stptri(char *uplo, char *diag, int *n, s *ap, int *info) nogil:
    _fortran_stptri(uplo, diag, n, ap, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stptrs "F_FUNC(stptrs,STPTRS)"(char *uplo, char *trans, char *diag, int *n, int *nrhs, s *ap, s *b, int *ldb, int *info) nogil
cdef void stptrs(char *uplo, char *trans, char *diag, int *n, int *nrhs, s *ap, s *b, int *ldb, int *info) nogil:
    _fortran_stptrs(uplo, trans, diag, n, nrhs, ap, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_strcon "F_FUNC(strcon,STRCON)"(char *norm, char *uplo, char *diag, int *n, s *a, int *lda, s *rcond, s *work, int *iwork, int *info) nogil
cdef void strcon(char *norm, char *uplo, char *diag, int *n, s *a, int *lda, s *rcond, s *work, int *iwork, int *info) nogil:
    _fortran_strcon(norm, uplo, diag, n, a, lda, rcond, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_strevc "F_FUNC(strevc,STREVC)"(char *side, char *howmny, bint *select, int *n, s *t, int *ldt, s *vl, int *ldvl, s *vr, int *ldvr, int *mm, int *m, s *work, int *info) nogil
cdef void strevc(char *side, char *howmny, bint *select, int *n, s *t, int *ldt, s *vl, int *ldvl, s *vr, int *ldvr, int *mm, int *m, s *work, int *info) nogil:
    _fortran_strevc(side, howmny, select, n, t, ldt, vl, ldvl, vr, ldvr, mm, m, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_strexc "F_FUNC(strexc,STREXC)"(char *compq, int *n, s *t, int *ldt, s *q, int *ldq, int *ifst, int *ilst, s *work, int *info) nogil
cdef void strexc(char *compq, int *n, s *t, int *ldt, s *q, int *ldq, int *ifst, int *ilst, s *work, int *info) nogil:
    _fortran_strexc(compq, n, t, ldt, q, ldq, ifst, ilst, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_strrfs "F_FUNC(strrfs,STRRFS)"(char *uplo, char *trans, char *diag, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil
cdef void strrfs(char *uplo, char *trans, char *diag, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, s *x, int *ldx, s *ferr, s *berr, s *work, int *iwork, int *info) nogil:
    _fortran_strrfs(uplo, trans, diag, n, nrhs, a, lda, b, ldb, x, ldx, ferr, berr, work, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_strsen "F_FUNC(strsen,STRSEN)"(char *job, char *compq, bint *select, int *n, s *t, int *ldt, s *q, int *ldq, s *wr, s *wi, int *m, s *s, s *sep, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void strsen(char *job, char *compq, bint *select, int *n, s *t, int *ldt, s *q, int *ldq, s *wr, s *wi, int *m, s *s, s *sep, s *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_strsen(job, compq, select, n, t, ldt, q, ldq, wr, wi, m, s, sep, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_strsna "F_FUNC(strsna,STRSNA)"(char *job, char *howmny, bint *select, int *n, s *t, int *ldt, s *vl, int *ldvl, s *vr, int *ldvr, s *s, s *sep, int *mm, int *m, s *work, int *ldwork, int *iwork, int *info) nogil
cdef void strsna(char *job, char *howmny, bint *select, int *n, s *t, int *ldt, s *vl, int *ldvl, s *vr, int *ldvr, s *s, s *sep, int *mm, int *m, s *work, int *ldwork, int *iwork, int *info) nogil:
    _fortran_strsna(job, howmny, select, n, t, ldt, vl, ldvl, vr, ldvr, s, sep, mm, m, work, ldwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_strsyl "F_FUNC(strsyl,STRSYL)"(char *trana, char *tranb, int *isgn, int *m, int *n, s *a, int *lda, s *b, int *ldb, s *c, int *ldc, s *scale, int *info) nogil
cdef void strsyl(char *trana, char *tranb, int *isgn, int *m, int *n, s *a, int *lda, s *b, int *ldb, s *c, int *ldc, s *scale, int *info) nogil:
    _fortran_strsyl(trana, tranb, isgn, m, n, a, lda, b, ldb, c, ldc, scale, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_strti2 "F_FUNC(strti2,STRTI2)"(char *uplo, char *diag, int *n, s *a, int *lda, int *info) nogil
cdef void strti2(char *uplo, char *diag, int *n, s *a, int *lda, int *info) nogil:
    _fortran_strti2(uplo, diag, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_strtri "F_FUNC(strtri,STRTRI)"(char *uplo, char *diag, int *n, s *a, int *lda, int *info) nogil
cdef void strtri(char *uplo, char *diag, int *n, s *a, int *lda, int *info) nogil:
    _fortran_strtri(uplo, diag, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_strtrs "F_FUNC(strtrs,STRTRS)"(char *uplo, char *trans, char *diag, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, int *info) nogil
cdef void strtrs(char *uplo, char *trans, char *diag, int *n, int *nrhs, s *a, int *lda, s *b, int *ldb, int *info) nogil:
    _fortran_strtrs(uplo, trans, diag, n, nrhs, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stzrqf "F_FUNC(stzrqf,STZRQF)"(int *m, int *n, s *a, int *lda, s *tau, int *info) nogil
cdef void stzrqf(int *m, int *n, s *a, int *lda, s *tau, int *info) nogil:
    _fortran_stzrqf(m, n, a, lda, tau, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_stzrzf "F_FUNC(stzrzf,STZRZF)"(int *m, int *n, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil
cdef void stzrzf(int *m, int *n, s *a, int *lda, s *tau, s *work, int *lwork, int *info) nogil:
    _fortran_stzrzf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_xerbla "F_FUNC(xerbla,XERBLA)"(char *srname, int *info) nogil
cdef void xerbla(char *srname, int *info) nogil:
    _fortran_xerbla(srname, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zbdsqr "F_FUNC(zbdsqr,ZBDSQR)"(char *uplo, int *n, int *ncvt, int *nru, int *ncc, d *d, d *e, z *vt, int *ldvt, z *u, int *ldu, z *c, int *ldc, d *rwork, int *info) nogil
cdef void zbdsqr(char *uplo, int *n, int *ncvt, int *nru, int *ncc, d *d, d *e, z *vt, int *ldvt, z *u, int *ldu, z *c, int *ldc, d *rwork, int *info) nogil:
    _fortran_zbdsqr(uplo, n, ncvt, nru, ncc, d, e, vt, ldvt, u, ldu, c, ldc, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zcgesv "F_FUNC(zcgesv,ZCGESV)"(int *n, int *nrhs, z *a, int *lda, int *ipiv, z *b, int *ldb, z *x, int *ldx, z *work, c *swork, d *rwork, int *iter, int *info) nogil
cdef void zcgesv(int *n, int *nrhs, z *a, int *lda, int *ipiv, z *b, int *ldb, z *x, int *ldx, z *work, c *swork, d *rwork, int *iter, int *info) nogil:
    _fortran_zcgesv(n, nrhs, a, lda, ipiv, b, ldb, x, ldx, work, swork, rwork, iter, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zdrscl "F_FUNC(zdrscl,ZDRSCL)"(int *n, d *sa, z *sx, int *incx) nogil
cdef void zdrscl(int *n, d *sa, z *sx, int *incx) nogil:
    _fortran_zdrscl(n, sa, sx, incx)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgbbrd "F_FUNC(zgbbrd,ZGBBRD)"(char *vect, int *m, int *n, int *ncc, int *kl, int *ku, z *ab, int *ldab, d *d, d *e, z *q, int *ldq, z *pt, int *ldpt, z *c, int *ldc, z *work, d *rwork, int *info) nogil
cdef void zgbbrd(char *vect, int *m, int *n, int *ncc, int *kl, int *ku, z *ab, int *ldab, d *d, d *e, z *q, int *ldq, z *pt, int *ldpt, z *c, int *ldc, z *work, d *rwork, int *info) nogil:
    _fortran_zgbbrd(vect, m, n, ncc, kl, ku, ab, ldab, d, e, q, ldq, pt, ldpt, c, ldc, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgbcon "F_FUNC(zgbcon,ZGBCON)"(char *norm, int *n, int *kl, int *ku, z *ab, int *ldab, int *ipiv, d *anorm, d *rcond, z *work, d *rwork, int *info) nogil
cdef void zgbcon(char *norm, int *n, int *kl, int *ku, z *ab, int *ldab, int *ipiv, d *anorm, d *rcond, z *work, d *rwork, int *info) nogil:
    _fortran_zgbcon(norm, n, kl, ku, ab, ldab, ipiv, anorm, rcond, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgbequ "F_FUNC(zgbequ,ZGBEQU)"(int *m, int *n, int *kl, int *ku, z *ab, int *ldab, d *r, d *c, d *rowcnd, d *colcnd, d *amax, int *info) nogil
cdef void zgbequ(int *m, int *n, int *kl, int *ku, z *ab, int *ldab, d *r, d *c, d *rowcnd, d *colcnd, d *amax, int *info) nogil:
    _fortran_zgbequ(m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgbrfs "F_FUNC(zgbrfs,ZGBRFS)"(char *trans, int *n, int *kl, int *ku, int *nrhs, z *ab, int *ldab, z *afb, int *ldafb, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zgbrfs(char *trans, int *n, int *kl, int *ku, int *nrhs, z *ab, int *ldab, z *afb, int *ldafb, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zgbrfs(trans, n, kl, ku, nrhs, ab, ldab, afb, ldafb, ipiv, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgbsv "F_FUNC(zgbsv,ZGBSV)"(int *n, int *kl, int *ku, int *nrhs, z *ab, int *ldab, int *ipiv, z *b, int *ldb, int *info) nogil
cdef void zgbsv(int *n, int *kl, int *ku, int *nrhs, z *ab, int *ldab, int *ipiv, z *b, int *ldb, int *info) nogil:
    _fortran_zgbsv(n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgbsvx "F_FUNC(zgbsvx,ZGBSVX)"(char *fact, char *trans, int *n, int *kl, int *ku, int *nrhs, z *ab, int *ldab, z *afb, int *ldafb, int *ipiv, char *equed, d *r, d *c, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zgbsvx(char *fact, char *trans, int *n, int *kl, int *ku, int *nrhs, z *ab, int *ldab, z *afb, int *ldafb, int *ipiv, char *equed, d *r, d *c, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zgbsvx(fact, trans, n, kl, ku, nrhs, ab, ldab, afb, ldafb, ipiv, equed, r, c, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgbtf2 "F_FUNC(zgbtf2,ZGBTF2)"(int *m, int *n, int *kl, int *ku, z *ab, int *ldab, int *ipiv, int *info) nogil
cdef void zgbtf2(int *m, int *n, int *kl, int *ku, z *ab, int *ldab, int *ipiv, int *info) nogil:
    _fortran_zgbtf2(m, n, kl, ku, ab, ldab, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgbtrf "F_FUNC(zgbtrf,ZGBTRF)"(int *m, int *n, int *kl, int *ku, z *ab, int *ldab, int *ipiv, int *info) nogil
cdef void zgbtrf(int *m, int *n, int *kl, int *ku, z *ab, int *ldab, int *ipiv, int *info) nogil:
    _fortran_zgbtrf(m, n, kl, ku, ab, ldab, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgbtrs "F_FUNC(zgbtrs,ZGBTRS)"(char *trans, int *n, int *kl, int *ku, int *nrhs, z *ab, int *ldab, int *ipiv, z *b, int *ldb, int *info) nogil
cdef void zgbtrs(char *trans, int *n, int *kl, int *ku, int *nrhs, z *ab, int *ldab, int *ipiv, z *b, int *ldb, int *info) nogil:
    _fortran_zgbtrs(trans, n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgebak "F_FUNC(zgebak,ZGEBAK)"(char *job, char *side, int *n, int *ilo, int *ihi, d *scale, int *m, z *v, int *ldv, int *info) nogil
cdef void zgebak(char *job, char *side, int *n, int *ilo, int *ihi, d *scale, int *m, z *v, int *ldv, int *info) nogil:
    _fortran_zgebak(job, side, n, ilo, ihi, scale, m, v, ldv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgebal "F_FUNC(zgebal,ZGEBAL)"(char *job, int *n, z *a, int *lda, int *ilo, int *ihi, d *scale, int *info) nogil
cdef void zgebal(char *job, int *n, z *a, int *lda, int *ilo, int *ihi, d *scale, int *info) nogil:
    _fortran_zgebal(job, n, a, lda, ilo, ihi, scale, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgebd2 "F_FUNC(zgebd2,ZGEBD2)"(int *m, int *n, z *a, int *lda, d *d, d *e, z *tauq, z *taup, z *work, int *info) nogil
cdef void zgebd2(int *m, int *n, z *a, int *lda, d *d, d *e, z *tauq, z *taup, z *work, int *info) nogil:
    _fortran_zgebd2(m, n, a, lda, d, e, tauq, taup, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgebrd "F_FUNC(zgebrd,ZGEBRD)"(int *m, int *n, z *a, int *lda, d *d, d *e, z *tauq, z *taup, z *work, int *lwork, int *info) nogil
cdef void zgebrd(int *m, int *n, z *a, int *lda, d *d, d *e, z *tauq, z *taup, z *work, int *lwork, int *info) nogil:
    _fortran_zgebrd(m, n, a, lda, d, e, tauq, taup, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgecon "F_FUNC(zgecon,ZGECON)"(char *norm, int *n, z *a, int *lda, d *anorm, d *rcond, z *work, d *rwork, int *info) nogil
cdef void zgecon(char *norm, int *n, z *a, int *lda, d *anorm, d *rcond, z *work, d *rwork, int *info) nogil:
    _fortran_zgecon(norm, n, a, lda, anorm, rcond, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgeequ "F_FUNC(zgeequ,ZGEEQU)"(int *m, int *n, z *a, int *lda, d *r, d *c, d *rowcnd, d *colcnd, d *amax, int *info) nogil
cdef void zgeequ(int *m, int *n, z *a, int *lda, d *r, d *c, d *rowcnd, d *colcnd, d *amax, int *info) nogil:
    _fortran_zgeequ(m, n, a, lda, r, c, rowcnd, colcnd, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgees "F_FUNC(zgees,ZGEES)"(char *jobvs, char *sort, zselect1 *select, int *n, z *a, int *lda, int *sdim, z *w, z *vs, int *ldvs, z *work, int *lwork, d *rwork, bint *bwork, int *info) nogil
cdef void zgees(char *jobvs, char *sort, zselect1 *select, int *n, z *a, int *lda, int *sdim, z *w, z *vs, int *ldvs, z *work, int *lwork, d *rwork, bint *bwork, int *info) nogil:
    _fortran_zgees(jobvs, sort, select, n, a, lda, sdim, w, vs, ldvs, work, lwork, rwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgeesx "F_FUNC(zgeesx,ZGEESX)"(char *jobvs, char *sort, zselect1 *select, char *sense, int *n, z *a, int *lda, int *sdim, z *w, z *vs, int *ldvs, d *rconde, d *rcondv, z *work, int *lwork, d *rwork, bint *bwork, int *info) nogil
cdef void zgeesx(char *jobvs, char *sort, zselect1 *select, char *sense, int *n, z *a, int *lda, int *sdim, z *w, z *vs, int *ldvs, d *rconde, d *rcondv, z *work, int *lwork, d *rwork, bint *bwork, int *info) nogil:
    _fortran_zgeesx(jobvs, sort, select, sense, n, a, lda, sdim, w, vs, ldvs, rconde, rcondv, work, lwork, rwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgeev "F_FUNC(zgeev,ZGEEV)"(char *jobvl, char *jobvr, int *n, z *a, int *lda, z *w, z *vl, int *ldvl, z *vr, int *ldvr, z *work, int *lwork, d *rwork, int *info) nogil
cdef void zgeev(char *jobvl, char *jobvr, int *n, z *a, int *lda, z *w, z *vl, int *ldvl, z *vr, int *ldvr, z *work, int *lwork, d *rwork, int *info) nogil:
    _fortran_zgeev(jobvl, jobvr, n, a, lda, w, vl, ldvl, vr, ldvr, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgeevx "F_FUNC(zgeevx,ZGEEVX)"(char *balanc, char *jobvl, char *jobvr, char *sense, int *n, z *a, int *lda, z *w, z *vl, int *ldvl, z *vr, int *ldvr, int *ilo, int *ihi, d *scale, d *abnrm, d *rconde, d *rcondv, z *work, int *lwork, d *rwork, int *info) nogil
cdef void zgeevx(char *balanc, char *jobvl, char *jobvr, char *sense, int *n, z *a, int *lda, z *w, z *vl, int *ldvl, z *vr, int *ldvr, int *ilo, int *ihi, d *scale, d *abnrm, d *rconde, d *rcondv, z *work, int *lwork, d *rwork, int *info) nogil:
    _fortran_zgeevx(balanc, jobvl, jobvr, sense, n, a, lda, w, vl, ldvl, vr, ldvr, ilo, ihi, scale, abnrm, rconde, rcondv, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgegs "F_FUNC(zgegs,ZGEGS)"(char *jobvsl, char *jobvsr, int *n, z *a, int *lda, z *b, int *ldb, z *alpha, z *beta, z *vsl, int *ldvsl, z *vsr, int *ldvsr, z *work, int *lwork, d *rwork, int *info) nogil
cdef void zgegs(char *jobvsl, char *jobvsr, int *n, z *a, int *lda, z *b, int *ldb, z *alpha, z *beta, z *vsl, int *ldvsl, z *vsr, int *ldvsr, z *work, int *lwork, d *rwork, int *info) nogil:
    _fortran_zgegs(jobvsl, jobvsr, n, a, lda, b, ldb, alpha, beta, vsl, ldvsl, vsr, ldvsr, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgegv "F_FUNC(zgegv,ZGEGV)"(char *jobvl, char *jobvr, int *n, z *a, int *lda, z *b, int *ldb, z *alpha, z *beta, z *vl, int *ldvl, z *vr, int *ldvr, z *work, int *lwork, d *rwork, int *info) nogil
cdef void zgegv(char *jobvl, char *jobvr, int *n, z *a, int *lda, z *b, int *ldb, z *alpha, z *beta, z *vl, int *ldvl, z *vr, int *ldvr, z *work, int *lwork, d *rwork, int *info) nogil:
    _fortran_zgegv(jobvl, jobvr, n, a, lda, b, ldb, alpha, beta, vl, ldvl, vr, ldvr, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgehd2 "F_FUNC(zgehd2,ZGEHD2)"(int *n, int *ilo, int *ihi, z *a, int *lda, z *tau, z *work, int *info) nogil
cdef void zgehd2(int *n, int *ilo, int *ihi, z *a, int *lda, z *tau, z *work, int *info) nogil:
    _fortran_zgehd2(n, ilo, ihi, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgehrd "F_FUNC(zgehrd,ZGEHRD)"(int *n, int *ilo, int *ihi, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil
cdef void zgehrd(int *n, int *ilo, int *ihi, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil:
    _fortran_zgehrd(n, ilo, ihi, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgelq2 "F_FUNC(zgelq2,ZGELQ2)"(int *m, int *n, z *a, int *lda, z *tau, z *work, int *info) nogil
cdef void zgelq2(int *m, int *n, z *a, int *lda, z *tau, z *work, int *info) nogil:
    _fortran_zgelq2(m, n, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgelqf "F_FUNC(zgelqf,ZGELQF)"(int *m, int *n, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil
cdef void zgelqf(int *m, int *n, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil:
    _fortran_zgelqf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgels "F_FUNC(zgels,ZGELS)"(char *trans, int *m, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, z *work, int *lwork, int *info) nogil
cdef void zgels(char *trans, int *m, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, z *work, int *lwork, int *info) nogil:
    _fortran_zgels(trans, m, n, nrhs, a, lda, b, ldb, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgelsd "F_FUNC(zgelsd,ZGELSD)"(int *m, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, d *s, d *rcond, int *rank, z *work, int *lwork, d *rwork, int *iwork, int *info) nogil
cdef void zgelsd(int *m, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, d *s, d *rcond, int *rank, z *work, int *lwork, d *rwork, int *iwork, int *info) nogil:
    _fortran_zgelsd(m, n, nrhs, a, lda, b, ldb, s, rcond, rank, work, lwork, rwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgelss "F_FUNC(zgelss,ZGELSS)"(int *m, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, d *s, d *rcond, int *rank, z *work, int *lwork, d *rwork, int *info) nogil
cdef void zgelss(int *m, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, d *s, d *rcond, int *rank, z *work, int *lwork, d *rwork, int *info) nogil:
    _fortran_zgelss(m, n, nrhs, a, lda, b, ldb, s, rcond, rank, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgelsx "F_FUNC(zgelsx,ZGELSX)"(int *m, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, int *jpvt, d *rcond, int *rank, z *work, d *rwork, int *info) nogil
cdef void zgelsx(int *m, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, int *jpvt, d *rcond, int *rank, z *work, d *rwork, int *info) nogil:
    _fortran_zgelsx(m, n, nrhs, a, lda, b, ldb, jpvt, rcond, rank, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgelsy "F_FUNC(zgelsy,ZGELSY)"(int *m, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, int *jpvt, d *rcond, int *rank, z *work, int *lwork, d *rwork, int *info) nogil
cdef void zgelsy(int *m, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, int *jpvt, d *rcond, int *rank, z *work, int *lwork, d *rwork, int *info) nogil:
    _fortran_zgelsy(m, n, nrhs, a, lda, b, ldb, jpvt, rcond, rank, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgeql2 "F_FUNC(zgeql2,ZGEQL2)"(int *m, int *n, z *a, int *lda, z *tau, z *work, int *info) nogil
cdef void zgeql2(int *m, int *n, z *a, int *lda, z *tau, z *work, int *info) nogil:
    _fortran_zgeql2(m, n, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgeqlf "F_FUNC(zgeqlf,ZGEQLF)"(int *m, int *n, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil
cdef void zgeqlf(int *m, int *n, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil:
    _fortran_zgeqlf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgeqp3 "F_FUNC(zgeqp3,ZGEQP3)"(int *m, int *n, z *a, int *lda, int *jpvt, z *tau, z *work, int *lwork, d *rwork, int *info) nogil
cdef void zgeqp3(int *m, int *n, z *a, int *lda, int *jpvt, z *tau, z *work, int *lwork, d *rwork, int *info) nogil:
    _fortran_zgeqp3(m, n, a, lda, jpvt, tau, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgeqpf "F_FUNC(zgeqpf,ZGEQPF)"(int *m, int *n, z *a, int *lda, int *jpvt, z *tau, z *work, d *rwork, int *info) nogil
cdef void zgeqpf(int *m, int *n, z *a, int *lda, int *jpvt, z *tau, z *work, d *rwork, int *info) nogil:
    _fortran_zgeqpf(m, n, a, lda, jpvt, tau, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgeqr2 "F_FUNC(zgeqr2,ZGEQR2)"(int *m, int *n, z *a, int *lda, z *tau, z *work, int *info) nogil
cdef void zgeqr2(int *m, int *n, z *a, int *lda, z *tau, z *work, int *info) nogil:
    _fortran_zgeqr2(m, n, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgeqrf "F_FUNC(zgeqrf,ZGEQRF)"(int *m, int *n, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil
cdef void zgeqrf(int *m, int *n, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil:
    _fortran_zgeqrf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgerfs "F_FUNC(zgerfs,ZGERFS)"(char *trans, int *n, int *nrhs, z *a, int *lda, z *af, int *ldaf, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zgerfs(char *trans, int *n, int *nrhs, z *a, int *lda, z *af, int *ldaf, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zgerfs(trans, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgerq2 "F_FUNC(zgerq2,ZGERQ2)"(int *m, int *n, z *a, int *lda, z *tau, z *work, int *info) nogil
cdef void zgerq2(int *m, int *n, z *a, int *lda, z *tau, z *work, int *info) nogil:
    _fortran_zgerq2(m, n, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgerqf "F_FUNC(zgerqf,ZGERQF)"(int *m, int *n, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil
cdef void zgerqf(int *m, int *n, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil:
    _fortran_zgerqf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgesc2 "F_FUNC(zgesc2,ZGESC2)"(int *n, z *a, int *lda, z *rhs, int *ipiv, int *jpiv, d *scale) nogil
cdef void zgesc2(int *n, z *a, int *lda, z *rhs, int *ipiv, int *jpiv, d *scale) nogil:
    _fortran_zgesc2(n, a, lda, rhs, ipiv, jpiv, scale)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgesdd "F_FUNC(zgesdd,ZGESDD)"(char *jobz, int *m, int *n, z *a, int *lda, d *s, z *u, int *ldu, z *vt, int *ldvt, z *work, int *lwork, d *rwork, int *iwork, int *info) nogil
cdef void zgesdd(char *jobz, int *m, int *n, z *a, int *lda, d *s, z *u, int *ldu, z *vt, int *ldvt, z *work, int *lwork, d *rwork, int *iwork, int *info) nogil:
    _fortran_zgesdd(jobz, m, n, a, lda, s, u, ldu, vt, ldvt, work, lwork, rwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgesv "F_FUNC(zgesv,ZGESV)"(int *n, int *nrhs, z *a, int *lda, int *ipiv, z *b, int *ldb, int *info) nogil
cdef void zgesv(int *n, int *nrhs, z *a, int *lda, int *ipiv, z *b, int *ldb, int *info) nogil:
    _fortran_zgesv(n, nrhs, a, lda, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgesvd "F_FUNC(zgesvd,ZGESVD)"(char *jobu, char *jobvt, int *m, int *n, z *a, int *lda, d *s, z *u, int *ldu, z *vt, int *ldvt, z *work, int *lwork, d *rwork, int *info) nogil
cdef void zgesvd(char *jobu, char *jobvt, int *m, int *n, z *a, int *lda, d *s, z *u, int *ldu, z *vt, int *ldvt, z *work, int *lwork, d *rwork, int *info) nogil:
    _fortran_zgesvd(jobu, jobvt, m, n, a, lda, s, u, ldu, vt, ldvt, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgesvx "F_FUNC(zgesvx,ZGESVX)"(char *fact, char *trans, int *n, int *nrhs, z *a, int *lda, z *af, int *ldaf, int *ipiv, char *equed, d *r, d *c, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zgesvx(char *fact, char *trans, int *n, int *nrhs, z *a, int *lda, z *af, int *ldaf, int *ipiv, char *equed, d *r, d *c, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zgesvx(fact, trans, n, nrhs, a, lda, af, ldaf, ipiv, equed, r, c, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgetc2 "F_FUNC(zgetc2,ZGETC2)"(int *n, z *a, int *lda, int *ipiv, int *jpiv, int *info) nogil
cdef void zgetc2(int *n, z *a, int *lda, int *ipiv, int *jpiv, int *info) nogil:
    _fortran_zgetc2(n, a, lda, ipiv, jpiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgetf2 "F_FUNC(zgetf2,ZGETF2)"(int *m, int *n, z *a, int *lda, int *ipiv, int *info) nogil
cdef void zgetf2(int *m, int *n, z *a, int *lda, int *ipiv, int *info) nogil:
    _fortran_zgetf2(m, n, a, lda, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgetrf "F_FUNC(zgetrf,ZGETRF)"(int *m, int *n, z *a, int *lda, int *ipiv, int *info) nogil
cdef void zgetrf(int *m, int *n, z *a, int *lda, int *ipiv, int *info) nogil:
    _fortran_zgetrf(m, n, a, lda, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgetri "F_FUNC(zgetri,ZGETRI)"(int *n, z *a, int *lda, int *ipiv, z *work, int *lwork, int *info) nogil
cdef void zgetri(int *n, z *a, int *lda, int *ipiv, z *work, int *lwork, int *info) nogil:
    _fortran_zgetri(n, a, lda, ipiv, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgetrs "F_FUNC(zgetrs,ZGETRS)"(char *trans, int *n, int *nrhs, z *a, int *lda, int *ipiv, z *b, int *ldb, int *info) nogil
cdef void zgetrs(char *trans, int *n, int *nrhs, z *a, int *lda, int *ipiv, z *b, int *ldb, int *info) nogil:
    _fortran_zgetrs(trans, n, nrhs, a, lda, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zggbak "F_FUNC(zggbak,ZGGBAK)"(char *job, char *side, int *n, int *ilo, int *ihi, d *lscale, d *rscale, int *m, z *v, int *ldv, int *info) nogil
cdef void zggbak(char *job, char *side, int *n, int *ilo, int *ihi, d *lscale, d *rscale, int *m, z *v, int *ldv, int *info) nogil:
    _fortran_zggbak(job, side, n, ilo, ihi, lscale, rscale, m, v, ldv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zggbal "F_FUNC(zggbal,ZGGBAL)"(char *job, int *n, z *a, int *lda, z *b, int *ldb, int *ilo, int *ihi, d *lscale, d *rscale, d *work, int *info) nogil
cdef void zggbal(char *job, int *n, z *a, int *lda, z *b, int *ldb, int *ilo, int *ihi, d *lscale, d *rscale, d *work, int *info) nogil:
    _fortran_zggbal(job, n, a, lda, b, ldb, ilo, ihi, lscale, rscale, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgges "F_FUNC(zgges,ZGGES)"(char *jobvsl, char *jobvsr, char *sort, zselect2 *selctg, int *n, z *a, int *lda, z *b, int *ldb, int *sdim, z *alpha, z *beta, z *vsl, int *ldvsl, z *vsr, int *ldvsr, z *work, int *lwork, d *rwork, bint *bwork, int *info) nogil
cdef void zgges(char *jobvsl, char *jobvsr, char *sort, zselect2 *selctg, int *n, z *a, int *lda, z *b, int *ldb, int *sdim, z *alpha, z *beta, z *vsl, int *ldvsl, z *vsr, int *ldvsr, z *work, int *lwork, d *rwork, bint *bwork, int *info) nogil:
    _fortran_zgges(jobvsl, jobvsr, sort, selctg, n, a, lda, b, ldb, sdim, alpha, beta, vsl, ldvsl, vsr, ldvsr, work, lwork, rwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zggesx "F_FUNC(zggesx,ZGGESX)"(char *jobvsl, char *jobvsr, char *sort, zselect2 *selctg, char *sense, int *n, z *a, int *lda, z *b, int *ldb, int *sdim, z *alpha, z *beta, z *vsl, int *ldvsl, z *vsr, int *ldvsr, d *rconde, d *rcondv, z *work, int *lwork, d *rwork, int *iwork, int *liwork, bint *bwork, int *info) nogil
cdef void zggesx(char *jobvsl, char *jobvsr, char *sort, zselect2 *selctg, char *sense, int *n, z *a, int *lda, z *b, int *ldb, int *sdim, z *alpha, z *beta, z *vsl, int *ldvsl, z *vsr, int *ldvsr, d *rconde, d *rcondv, z *work, int *lwork, d *rwork, int *iwork, int *liwork, bint *bwork, int *info) nogil:
    _fortran_zggesx(jobvsl, jobvsr, sort, selctg, sense, n, a, lda, b, ldb, sdim, alpha, beta, vsl, ldvsl, vsr, ldvsr, rconde, rcondv, work, lwork, rwork, iwork, liwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zggev "F_FUNC(zggev,ZGGEV)"(char *jobvl, char *jobvr, int *n, z *a, int *lda, z *b, int *ldb, z *alpha, z *beta, z *vl, int *ldvl, z *vr, int *ldvr, z *work, int *lwork, d *rwork, int *info) nogil
cdef void zggev(char *jobvl, char *jobvr, int *n, z *a, int *lda, z *b, int *ldb, z *alpha, z *beta, z *vl, int *ldvl, z *vr, int *ldvr, z *work, int *lwork, d *rwork, int *info) nogil:
    _fortran_zggev(jobvl, jobvr, n, a, lda, b, ldb, alpha, beta, vl, ldvl, vr, ldvr, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zggevx "F_FUNC(zggevx,ZGGEVX)"(char *balanc, char *jobvl, char *jobvr, char *sense, int *n, z *a, int *lda, z *b, int *ldb, z *alpha, z *beta, z *vl, int *ldvl, z *vr, int *ldvr, int *ilo, int *ihi, d *lscale, d *rscale, d *abnrm, d *bbnrm, d *rconde, d *rcondv, z *work, int *lwork, d *rwork, int *iwork, bint *bwork, int *info) nogil
cdef void zggevx(char *balanc, char *jobvl, char *jobvr, char *sense, int *n, z *a, int *lda, z *b, int *ldb, z *alpha, z *beta, z *vl, int *ldvl, z *vr, int *ldvr, int *ilo, int *ihi, d *lscale, d *rscale, d *abnrm, d *bbnrm, d *rconde, d *rcondv, z *work, int *lwork, d *rwork, int *iwork, bint *bwork, int *info) nogil:
    _fortran_zggevx(balanc, jobvl, jobvr, sense, n, a, lda, b, ldb, alpha, beta, vl, ldvl, vr, ldvr, ilo, ihi, lscale, rscale, abnrm, bbnrm, rconde, rcondv, work, lwork, rwork, iwork, bwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zggglm "F_FUNC(zggglm,ZGGGLM)"(int *n, int *m, int *p, z *a, int *lda, z *b, int *ldb, z *d, z *x, z *y, z *work, int *lwork, int *info) nogil
cdef void zggglm(int *n, int *m, int *p, z *a, int *lda, z *b, int *ldb, z *d, z *x, z *y, z *work, int *lwork, int *info) nogil:
    _fortran_zggglm(n, m, p, a, lda, b, ldb, d, x, y, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgghrd "F_FUNC(zgghrd,ZGGHRD)"(char *compq, char *compz, int *n, int *ilo, int *ihi, z *a, int *lda, z *b, int *ldb, z *q, int *ldq, z *z, int *ldz, int *info) nogil
cdef void zgghrd(char *compq, char *compz, int *n, int *ilo, int *ihi, z *a, int *lda, z *b, int *ldb, z *q, int *ldq, z *z, int *ldz, int *info) nogil:
    _fortran_zgghrd(compq, compz, n, ilo, ihi, a, lda, b, ldb, q, ldq, z, ldz, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgglse "F_FUNC(zgglse,ZGGLSE)"(int *m, int *n, int *p, z *a, int *lda, z *b, int *ldb, z *c, z *d, z *x, z *work, int *lwork, int *info) nogil
cdef void zgglse(int *m, int *n, int *p, z *a, int *lda, z *b, int *ldb, z *c, z *d, z *x, z *work, int *lwork, int *info) nogil:
    _fortran_zgglse(m, n, p, a, lda, b, ldb, c, d, x, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zggqrf "F_FUNC(zggqrf,ZGGQRF)"(int *n, int *m, int *p, z *a, int *lda, z *taua, z *b, int *ldb, z *taub, z *work, int *lwork, int *info) nogil
cdef void zggqrf(int *n, int *m, int *p, z *a, int *lda, z *taua, z *b, int *ldb, z *taub, z *work, int *lwork, int *info) nogil:
    _fortran_zggqrf(n, m, p, a, lda, taua, b, ldb, taub, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zggrqf "F_FUNC(zggrqf,ZGGRQF)"(int *m, int *p, int *n, z *a, int *lda, z *taua, z *b, int *ldb, z *taub, z *work, int *lwork, int *info) nogil
cdef void zggrqf(int *m, int *p, int *n, z *a, int *lda, z *taua, z *b, int *ldb, z *taub, z *work, int *lwork, int *info) nogil:
    _fortran_zggrqf(m, p, n, a, lda, taua, b, ldb, taub, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zggsvd "F_FUNC(zggsvd,ZGGSVD)"(char *jobu, char *jobv, char *jobq, int *m, int *n, int *p, int *k, int *l, z *a, int *lda, z *b, int *ldb, d *alpha, d *beta, z *u, int *ldu, z *v, int *ldv, z *q, int *ldq, z *work, d *rwork, int *iwork, int *info) nogil
cdef void zggsvd(char *jobu, char *jobv, char *jobq, int *m, int *n, int *p, int *k, int *l, z *a, int *lda, z *b, int *ldb, d *alpha, d *beta, z *u, int *ldu, z *v, int *ldv, z *q, int *ldq, z *work, d *rwork, int *iwork, int *info) nogil:
    _fortran_zggsvd(jobu, jobv, jobq, m, n, p, k, l, a, lda, b, ldb, alpha, beta, u, ldu, v, ldv, q, ldq, work, rwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zggsvp "F_FUNC(zggsvp,ZGGSVP)"(char *jobu, char *jobv, char *jobq, int *m, int *p, int *n, z *a, int *lda, z *b, int *ldb, d *tola, d *tolb, int *k, int *l, z *u, int *ldu, z *v, int *ldv, z *q, int *ldq, int *iwork, d *rwork, z *tau, z *work, int *info) nogil
cdef void zggsvp(char *jobu, char *jobv, char *jobq, int *m, int *p, int *n, z *a, int *lda, z *b, int *ldb, d *tola, d *tolb, int *k, int *l, z *u, int *ldu, z *v, int *ldv, z *q, int *ldq, int *iwork, d *rwork, z *tau, z *work, int *info) nogil:
    _fortran_zggsvp(jobu, jobv, jobq, m, p, n, a, lda, b, ldb, tola, tolb, k, l, u, ldu, v, ldv, q, ldq, iwork, rwork, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgtcon "F_FUNC(zgtcon,ZGTCON)"(char *norm, int *n, z *dl, z *d, z *du, z *du2, int *ipiv, d *anorm, d *rcond, z *work, int *info) nogil
cdef void zgtcon(char *norm, int *n, z *dl, z *d, z *du, z *du2, int *ipiv, d *anorm, d *rcond, z *work, int *info) nogil:
    _fortran_zgtcon(norm, n, dl, d, du, du2, ipiv, anorm, rcond, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgtrfs "F_FUNC(zgtrfs,ZGTRFS)"(char *trans, int *n, int *nrhs, z *dl, z *d, z *du, z *dlf, z *df, z *duf, z *du2, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zgtrfs(char *trans, int *n, int *nrhs, z *dl, z *d, z *du, z *dlf, z *df, z *duf, z *du2, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zgtrfs(trans, n, nrhs, dl, d, du, dlf, df, duf, du2, ipiv, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgtsv "F_FUNC(zgtsv,ZGTSV)"(int *n, int *nrhs, z *dl, z *d, z *du, z *b, int *ldb, int *info) nogil
cdef void zgtsv(int *n, int *nrhs, z *dl, z *d, z *du, z *b, int *ldb, int *info) nogil:
    _fortran_zgtsv(n, nrhs, dl, d, du, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgtsvx "F_FUNC(zgtsvx,ZGTSVX)"(char *fact, char *trans, int *n, int *nrhs, z *dl, z *d, z *du, z *dlf, z *df, z *duf, z *du2, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zgtsvx(char *fact, char *trans, int *n, int *nrhs, z *dl, z *d, z *du, z *dlf, z *df, z *duf, z *du2, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zgtsvx(fact, trans, n, nrhs, dl, d, du, dlf, df, duf, du2, ipiv, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgttrf "F_FUNC(zgttrf,ZGTTRF)"(int *n, z *dl, z *d, z *du, z *du2, int *ipiv, int *info) nogil
cdef void zgttrf(int *n, z *dl, z *d, z *du, z *du2, int *ipiv, int *info) nogil:
    _fortran_zgttrf(n, dl, d, du, du2, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgttrs "F_FUNC(zgttrs,ZGTTRS)"(char *trans, int *n, int *nrhs, z *dl, z *d, z *du, z *du2, int *ipiv, z *b, int *ldb, int *info) nogil
cdef void zgttrs(char *trans, int *n, int *nrhs, z *dl, z *d, z *du, z *du2, int *ipiv, z *b, int *ldb, int *info) nogil:
    _fortran_zgttrs(trans, n, nrhs, dl, d, du, du2, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zgtts2 "F_FUNC(zgtts2,ZGTTS2)"(int *itrans, int *n, int *nrhs, z *dl, z *d, z *du, z *du2, int *ipiv, z *b, int *ldb) nogil
cdef void zgtts2(int *itrans, int *n, int *nrhs, z *dl, z *d, z *du, z *du2, int *ipiv, z *b, int *ldb) nogil:
    _fortran_zgtts2(itrans, n, nrhs, dl, d, du, du2, ipiv, b, ldb)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhbev "F_FUNC(zhbev,ZHBEV)"(char *jobz, char *uplo, int *n, int *kd, z *ab, int *ldab, d *w, z *z, int *ldz, z *work, d *rwork, int *info) nogil
cdef void zhbev(char *jobz, char *uplo, int *n, int *kd, z *ab, int *ldab, d *w, z *z, int *ldz, z *work, d *rwork, int *info) nogil:
    _fortran_zhbev(jobz, uplo, n, kd, ab, ldab, w, z, ldz, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhbevd "F_FUNC(zhbevd,ZHBEVD)"(char *jobz, char *uplo, int *n, int *kd, z *ab, int *ldab, d *w, z *z, int *ldz, z *work, int *lwork, d *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil
cdef void zhbevd(char *jobz, char *uplo, int *n, int *kd, z *ab, int *ldab, d *w, z *z, int *ldz, z *work, int *lwork, d *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_zhbevd(jobz, uplo, n, kd, ab, ldab, w, z, ldz, work, lwork, rwork, lrwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhbevx "F_FUNC(zhbevx,ZHBEVX)"(char *jobz, char *range, char *uplo, int *n, int *kd, z *ab, int *ldab, z *q, int *ldq, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, z *z, int *ldz, z *work, d *rwork, int *iwork, int *ifail, int *info) nogil
cdef void zhbevx(char *jobz, char *range, char *uplo, int *n, int *kd, z *ab, int *ldab, z *q, int *ldq, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, z *z, int *ldz, z *work, d *rwork, int *iwork, int *ifail, int *info) nogil:
    _fortran_zhbevx(jobz, range, uplo, n, kd, ab, ldab, q, ldq, vl, vu, il, iu, abstol, m, w, z, ldz, work, rwork, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhbgst "F_FUNC(zhbgst,ZHBGST)"(char *vect, char *uplo, int *n, int *ka, int *kb, z *ab, int *ldab, z *bb, int *ldbb, z *x, int *ldx, z *work, d *rwork, int *info) nogil
cdef void zhbgst(char *vect, char *uplo, int *n, int *ka, int *kb, z *ab, int *ldab, z *bb, int *ldbb, z *x, int *ldx, z *work, d *rwork, int *info) nogil:
    _fortran_zhbgst(vect, uplo, n, ka, kb, ab, ldab, bb, ldbb, x, ldx, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhbgv "F_FUNC(zhbgv,ZHBGV)"(char *jobz, char *uplo, int *n, int *ka, int *kb, z *ab, int *ldab, z *bb, int *ldbb, d *w, z *z, int *ldz, z *work, d *rwork, int *info) nogil
cdef void zhbgv(char *jobz, char *uplo, int *n, int *ka, int *kb, z *ab, int *ldab, z *bb, int *ldbb, d *w, z *z, int *ldz, z *work, d *rwork, int *info) nogil:
    _fortran_zhbgv(jobz, uplo, n, ka, kb, ab, ldab, bb, ldbb, w, z, ldz, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhbgvd "F_FUNC(zhbgvd,ZHBGVD)"(char *jobz, char *uplo, int *n, int *ka, int *kb, z *ab, int *ldab, z *bb, int *ldbb, d *w, z *z, int *ldz, z *work, int *lwork, d *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil
cdef void zhbgvd(char *jobz, char *uplo, int *n, int *ka, int *kb, z *ab, int *ldab, z *bb, int *ldbb, d *w, z *z, int *ldz, z *work, int *lwork, d *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_zhbgvd(jobz, uplo, n, ka, kb, ab, ldab, bb, ldbb, w, z, ldz, work, lwork, rwork, lrwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhbgvx "F_FUNC(zhbgvx,ZHBGVX)"(char *jobz, char *range, char *uplo, int *n, int *ka, int *kb, z *ab, int *ldab, z *bb, int *ldbb, z *q, int *ldq, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, z *z, int *ldz, z *work, d *rwork, int *iwork, int *ifail, int *info) nogil
cdef void zhbgvx(char *jobz, char *range, char *uplo, int *n, int *ka, int *kb, z *ab, int *ldab, z *bb, int *ldbb, z *q, int *ldq, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, z *z, int *ldz, z *work, d *rwork, int *iwork, int *ifail, int *info) nogil:
    _fortran_zhbgvx(jobz, range, uplo, n, ka, kb, ab, ldab, bb, ldbb, q, ldq, vl, vu, il, iu, abstol, m, w, z, ldz, work, rwork, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhbtrd "F_FUNC(zhbtrd,ZHBTRD)"(char *vect, char *uplo, int *n, int *kd, z *ab, int *ldab, d *d, d *e, z *q, int *ldq, z *work, int *info) nogil
cdef void zhbtrd(char *vect, char *uplo, int *n, int *kd, z *ab, int *ldab, d *d, d *e, z *q, int *ldq, z *work, int *info) nogil:
    _fortran_zhbtrd(vect, uplo, n, kd, ab, ldab, d, e, q, ldq, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhecon "F_FUNC(zhecon,ZHECON)"(char *uplo, int *n, z *a, int *lda, int *ipiv, d *anorm, d *rcond, z *work, int *info) nogil
cdef void zhecon(char *uplo, int *n, z *a, int *lda, int *ipiv, d *anorm, d *rcond, z *work, int *info) nogil:
    _fortran_zhecon(uplo, n, a, lda, ipiv, anorm, rcond, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zheev "F_FUNC(zheev,ZHEEV)"(char *jobz, char *uplo, int *n, z *a, int *lda, d *w, z *work, int *lwork, d *rwork, int *info) nogil
cdef void zheev(char *jobz, char *uplo, int *n, z *a, int *lda, d *w, z *work, int *lwork, d *rwork, int *info) nogil:
    _fortran_zheev(jobz, uplo, n, a, lda, w, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zheevd "F_FUNC(zheevd,ZHEEVD)"(char *jobz, char *uplo, int *n, z *a, int *lda, d *w, z *work, int *lwork, d *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil
cdef void zheevd(char *jobz, char *uplo, int *n, z *a, int *lda, d *w, z *work, int *lwork, d *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_zheevd(jobz, uplo, n, a, lda, w, work, lwork, rwork, lrwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zheevr "F_FUNC(zheevr,ZHEEVR)"(char *jobz, char *range, char *uplo, int *n, z *a, int *lda, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, z *z, int *ldz, int *isuppz, z *work, int *lwork, d *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil
cdef void zheevr(char *jobz, char *range, char *uplo, int *n, z *a, int *lda, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, z *z, int *ldz, int *isuppz, z *work, int *lwork, d *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_zheevr(jobz, range, uplo, n, a, lda, vl, vu, il, iu, abstol, m, w, z, ldz, isuppz, work, lwork, rwork, lrwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zheevx "F_FUNC(zheevx,ZHEEVX)"(char *jobz, char *range, char *uplo, int *n, z *a, int *lda, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, z *z, int *ldz, z *work, int *lwork, d *rwork, int *iwork, int *ifail, int *info) nogil
cdef void zheevx(char *jobz, char *range, char *uplo, int *n, z *a, int *lda, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, z *z, int *ldz, z *work, int *lwork, d *rwork, int *iwork, int *ifail, int *info) nogil:
    _fortran_zheevx(jobz, range, uplo, n, a, lda, vl, vu, il, iu, abstol, m, w, z, ldz, work, lwork, rwork, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhegs2 "F_FUNC(zhegs2,ZHEGS2)"(int *itype, char *uplo, int *n, z *a, int *lda, z *b, int *ldb, int *info) nogil
cdef void zhegs2(int *itype, char *uplo, int *n, z *a, int *lda, z *b, int *ldb, int *info) nogil:
    _fortran_zhegs2(itype, uplo, n, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhegst "F_FUNC(zhegst,ZHEGST)"(int *itype, char *uplo, int *n, z *a, int *lda, z *b, int *ldb, int *info) nogil
cdef void zhegst(int *itype, char *uplo, int *n, z *a, int *lda, z *b, int *ldb, int *info) nogil:
    _fortran_zhegst(itype, uplo, n, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhegv "F_FUNC(zhegv,ZHEGV)"(int *itype, char *jobz, char *uplo, int *n, z *a, int *lda, z *b, int *ldb, d *w, z *work, int *lwork, d *rwork, int *info) nogil
cdef void zhegv(int *itype, char *jobz, char *uplo, int *n, z *a, int *lda, z *b, int *ldb, d *w, z *work, int *lwork, d *rwork, int *info) nogil:
    _fortran_zhegv(itype, jobz, uplo, n, a, lda, b, ldb, w, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhegvd "F_FUNC(zhegvd,ZHEGVD)"(int *itype, char *jobz, char *uplo, int *n, z *a, int *lda, z *b, int *ldb, d *w, z *work, int *lwork, d *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil
cdef void zhegvd(int *itype, char *jobz, char *uplo, int *n, z *a, int *lda, z *b, int *ldb, d *w, z *work, int *lwork, d *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_zhegvd(itype, jobz, uplo, n, a, lda, b, ldb, w, work, lwork, rwork, lrwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhegvx "F_FUNC(zhegvx,ZHEGVX)"(int *itype, char *jobz, char *range, char *uplo, int *n, z *a, int *lda, z *b, int *ldb, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, z *z, int *ldz, z *work, int *lwork, d *rwork, int *iwork, int *ifail, int *info) nogil
cdef void zhegvx(int *itype, char *jobz, char *range, char *uplo, int *n, z *a, int *lda, z *b, int *ldb, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, z *z, int *ldz, z *work, int *lwork, d *rwork, int *iwork, int *ifail, int *info) nogil:
    _fortran_zhegvx(itype, jobz, range, uplo, n, a, lda, b, ldb, vl, vu, il, iu, abstol, m, w, z, ldz, work, lwork, rwork, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zherfs "F_FUNC(zherfs,ZHERFS)"(char *uplo, int *n, int *nrhs, z *a, int *lda, z *af, int *ldaf, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zherfs(char *uplo, int *n, int *nrhs, z *a, int *lda, z *af, int *ldaf, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zherfs(uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhesv "F_FUNC(zhesv,ZHESV)"(char *uplo, int *n, int *nrhs, z *a, int *lda, int *ipiv, z *b, int *ldb, z *work, int *lwork, int *info) nogil
cdef void zhesv(char *uplo, int *n, int *nrhs, z *a, int *lda, int *ipiv, z *b, int *ldb, z *work, int *lwork, int *info) nogil:
    _fortran_zhesv(uplo, n, nrhs, a, lda, ipiv, b, ldb, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhesvx "F_FUNC(zhesvx,ZHESVX)"(char *fact, char *uplo, int *n, int *nrhs, z *a, int *lda, z *af, int *ldaf, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, int *lwork, d *rwork, int *info) nogil
cdef void zhesvx(char *fact, char *uplo, int *n, int *nrhs, z *a, int *lda, z *af, int *ldaf, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, int *lwork, d *rwork, int *info) nogil:
    _fortran_zhesvx(fact, uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb, x, ldx, rcond, ferr, berr, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhetd2 "F_FUNC(zhetd2,ZHETD2)"(char *uplo, int *n, z *a, int *lda, d *d, d *e, z *tau, int *info) nogil
cdef void zhetd2(char *uplo, int *n, z *a, int *lda, d *d, d *e, z *tau, int *info) nogil:
    _fortran_zhetd2(uplo, n, a, lda, d, e, tau, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhetf2 "F_FUNC(zhetf2,ZHETF2)"(char *uplo, int *n, z *a, int *lda, int *ipiv, int *info) nogil
cdef void zhetf2(char *uplo, int *n, z *a, int *lda, int *ipiv, int *info) nogil:
    _fortran_zhetf2(uplo, n, a, lda, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhetrd "F_FUNC(zhetrd,ZHETRD)"(char *uplo, int *n, z *a, int *lda, d *d, d *e, z *tau, z *work, int *lwork, int *info) nogil
cdef void zhetrd(char *uplo, int *n, z *a, int *lda, d *d, d *e, z *tau, z *work, int *lwork, int *info) nogil:
    _fortran_zhetrd(uplo, n, a, lda, d, e, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhetrf "F_FUNC(zhetrf,ZHETRF)"(char *uplo, int *n, z *a, int *lda, int *ipiv, z *work, int *lwork, int *info) nogil
cdef void zhetrf(char *uplo, int *n, z *a, int *lda, int *ipiv, z *work, int *lwork, int *info) nogil:
    _fortran_zhetrf(uplo, n, a, lda, ipiv, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhetri "F_FUNC(zhetri,ZHETRI)"(char *uplo, int *n, z *a, int *lda, int *ipiv, z *work, int *info) nogil
cdef void zhetri(char *uplo, int *n, z *a, int *lda, int *ipiv, z *work, int *info) nogil:
    _fortran_zhetri(uplo, n, a, lda, ipiv, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhetrs "F_FUNC(zhetrs,ZHETRS)"(char *uplo, int *n, int *nrhs, z *a, int *lda, int *ipiv, z *b, int *ldb, int *info) nogil
cdef void zhetrs(char *uplo, int *n, int *nrhs, z *a, int *lda, int *ipiv, z *b, int *ldb, int *info) nogil:
    _fortran_zhetrs(uplo, n, nrhs, a, lda, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhgeqz "F_FUNC(zhgeqz,ZHGEQZ)"(char *job, char *compq, char *compz, int *n, int *ilo, int *ihi, z *h, int *ldh, z *t, int *ldt, z *alpha, z *beta, z *q, int *ldq, z *z, int *ldz, z *work, int *lwork, d *rwork, int *info) nogil
cdef void zhgeqz(char *job, char *compq, char *compz, int *n, int *ilo, int *ihi, z *h, int *ldh, z *t, int *ldt, z *alpha, z *beta, z *q, int *ldq, z *z, int *ldz, z *work, int *lwork, d *rwork, int *info) nogil:
    _fortran_zhgeqz(job, compq, compz, n, ilo, ihi, h, ldh, t, ldt, alpha, beta, q, ldq, z, ldz, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhpcon "F_FUNC(zhpcon,ZHPCON)"(char *uplo, int *n, z *ap, int *ipiv, d *anorm, d *rcond, z *work, int *info) nogil
cdef void zhpcon(char *uplo, int *n, z *ap, int *ipiv, d *anorm, d *rcond, z *work, int *info) nogil:
    _fortran_zhpcon(uplo, n, ap, ipiv, anorm, rcond, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhpev "F_FUNC(zhpev,ZHPEV)"(char *jobz, char *uplo, int *n, z *ap, d *w, z *z, int *ldz, z *work, d *rwork, int *info) nogil
cdef void zhpev(char *jobz, char *uplo, int *n, z *ap, d *w, z *z, int *ldz, z *work, d *rwork, int *info) nogil:
    _fortran_zhpev(jobz, uplo, n, ap, w, z, ldz, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhpevd "F_FUNC(zhpevd,ZHPEVD)"(char *jobz, char *uplo, int *n, z *ap, d *w, z *z, int *ldz, z *work, int *lwork, d *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil
cdef void zhpevd(char *jobz, char *uplo, int *n, z *ap, d *w, z *z, int *ldz, z *work, int *lwork, d *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_zhpevd(jobz, uplo, n, ap, w, z, ldz, work, lwork, rwork, lrwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhpevx "F_FUNC(zhpevx,ZHPEVX)"(char *jobz, char *range, char *uplo, int *n, z *ap, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, z *z, int *ldz, z *work, d *rwork, int *iwork, int *ifail, int *info) nogil
cdef void zhpevx(char *jobz, char *range, char *uplo, int *n, z *ap, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, z *z, int *ldz, z *work, d *rwork, int *iwork, int *ifail, int *info) nogil:
    _fortran_zhpevx(jobz, range, uplo, n, ap, vl, vu, il, iu, abstol, m, w, z, ldz, work, rwork, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhpgst "F_FUNC(zhpgst,ZHPGST)"(int *itype, char *uplo, int *n, z *ap, z *bp, int *info) nogil
cdef void zhpgst(int *itype, char *uplo, int *n, z *ap, z *bp, int *info) nogil:
    _fortran_zhpgst(itype, uplo, n, ap, bp, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhpgv "F_FUNC(zhpgv,ZHPGV)"(int *itype, char *jobz, char *uplo, int *n, z *ap, z *bp, d *w, z *z, int *ldz, z *work, d *rwork, int *info) nogil
cdef void zhpgv(int *itype, char *jobz, char *uplo, int *n, z *ap, z *bp, d *w, z *z, int *ldz, z *work, d *rwork, int *info) nogil:
    _fortran_zhpgv(itype, jobz, uplo, n, ap, bp, w, z, ldz, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhpgvd "F_FUNC(zhpgvd,ZHPGVD)"(int *itype, char *jobz, char *uplo, int *n, z *ap, z *bp, d *w, z *z, int *ldz, z *work, int *lwork, d *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil
cdef void zhpgvd(int *itype, char *jobz, char *uplo, int *n, z *ap, z *bp, d *w, z *z, int *ldz, z *work, int *lwork, d *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_zhpgvd(itype, jobz, uplo, n, ap, bp, w, z, ldz, work, lwork, rwork, lrwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhpgvx "F_FUNC(zhpgvx,ZHPGVX)"(int *itype, char *jobz, char *range, char *uplo, int *n, z *ap, z *bp, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, z *z, int *ldz, z *work, d *rwork, int *iwork, int *ifail, int *info) nogil
cdef void zhpgvx(int *itype, char *jobz, char *range, char *uplo, int *n, z *ap, z *bp, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, z *z, int *ldz, z *work, d *rwork, int *iwork, int *ifail, int *info) nogil:
    _fortran_zhpgvx(itype, jobz, range, uplo, n, ap, bp, vl, vu, il, iu, abstol, m, w, z, ldz, work, rwork, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhprfs "F_FUNC(zhprfs,ZHPRFS)"(char *uplo, int *n, int *nrhs, z *ap, z *afp, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zhprfs(char *uplo, int *n, int *nrhs, z *ap, z *afp, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zhprfs(uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhpsv "F_FUNC(zhpsv,ZHPSV)"(char *uplo, int *n, int *nrhs, z *ap, int *ipiv, z *b, int *ldb, int *info) nogil
cdef void zhpsv(char *uplo, int *n, int *nrhs, z *ap, int *ipiv, z *b, int *ldb, int *info) nogil:
    _fortran_zhpsv(uplo, n, nrhs, ap, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhpsvx "F_FUNC(zhpsvx,ZHPSVX)"(char *fact, char *uplo, int *n, int *nrhs, z *ap, z *afp, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zhpsvx(char *fact, char *uplo, int *n, int *nrhs, z *ap, z *afp, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zhpsvx(fact, uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhptrd "F_FUNC(zhptrd,ZHPTRD)"(char *uplo, int *n, z *ap, d *d, d *e, z *tau, int *info) nogil
cdef void zhptrd(char *uplo, int *n, z *ap, d *d, d *e, z *tau, int *info) nogil:
    _fortran_zhptrd(uplo, n, ap, d, e, tau, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhptrf "F_FUNC(zhptrf,ZHPTRF)"(char *uplo, int *n, z *ap, int *ipiv, int *info) nogil
cdef void zhptrf(char *uplo, int *n, z *ap, int *ipiv, int *info) nogil:
    _fortran_zhptrf(uplo, n, ap, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhptri "F_FUNC(zhptri,ZHPTRI)"(char *uplo, int *n, z *ap, int *ipiv, z *work, int *info) nogil
cdef void zhptri(char *uplo, int *n, z *ap, int *ipiv, z *work, int *info) nogil:
    _fortran_zhptri(uplo, n, ap, ipiv, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhptrs "F_FUNC(zhptrs,ZHPTRS)"(char *uplo, int *n, int *nrhs, z *ap, int *ipiv, z *b, int *ldb, int *info) nogil
cdef void zhptrs(char *uplo, int *n, int *nrhs, z *ap, int *ipiv, z *b, int *ldb, int *info) nogil:
    _fortran_zhptrs(uplo, n, nrhs, ap, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhsein "F_FUNC(zhsein,ZHSEIN)"(char *side, char *eigsrc, char *initv, bint *select, int *n, z *h, int *ldh, z *w, z *vl, int *ldvl, z *vr, int *ldvr, int *mm, int *m, z *work, d *rwork, int *ifaill, int *ifailr, int *info) nogil
cdef void zhsein(char *side, char *eigsrc, char *initv, bint *select, int *n, z *h, int *ldh, z *w, z *vl, int *ldvl, z *vr, int *ldvr, int *mm, int *m, z *work, d *rwork, int *ifaill, int *ifailr, int *info) nogil:
    _fortran_zhsein(side, eigsrc, initv, select, n, h, ldh, w, vl, ldvl, vr, ldvr, mm, m, work, rwork, ifaill, ifailr, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zhseqr "F_FUNC(zhseqr,ZHSEQR)"(char *job, char *compz, int *n, int *ilo, int *ihi, z *h, int *ldh, z *w, z *z, int *ldz, z *work, int *lwork, int *info) nogil
cdef void zhseqr(char *job, char *compz, int *n, int *ilo, int *ihi, z *h, int *ldh, z *w, z *z, int *ldz, z *work, int *lwork, int *info) nogil:
    _fortran_zhseqr(job, compz, n, ilo, ihi, h, ldh, w, z, ldz, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zlacn2 "F_FUNC(zlacn2,ZLACN2)"(int *n, z *v, z *x, d *est, int *kase, int *isave) nogil
cdef void zlacn2(int *n, z *v, z *x, d *est, int *kase, int *isave) nogil:
    _fortran_zlacn2(n, v, x, est, kase, isave)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zlacon "F_FUNC(zlacon,ZLACON)"(int *n, z *v, z *x, d *est, int *kase) nogil
cdef void zlacon(int *n, z *v, z *x, d *est, int *kase) nogil:
    _fortran_zlacon(n, v, x, est, kase)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zlarf "F_FUNC(zlarf,ZLARF)"(char *side, int *m, int *n, z *v, int *incv, z *tau, z *c, int *ldc, z *work) nogil
cdef void zlarf(char *side, int *m, int *n, z *v, int *incv, z *tau, z *c, int *ldc, z *work) nogil:
    _fortran_zlarf(side, m, n, v, incv, tau, c, ldc, work)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zlarz "F_FUNC(zlarz,ZLARZ)"(char *side, int *m, int *n, int *l, z *v, int *incv, z *tau, z *c, int *ldc, z *work) nogil
cdef void zlarz(char *side, int *m, int *n, int *l, z *v, int *incv, z *tau, z *c, int *ldc, z *work) nogil:
    _fortran_zlarz(side, m, n, l, v, incv, tau, c, ldc, work)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zlaswp "F_FUNC(zlaswp,ZLASWP)"(int *n, z *a, int *lda, int *k1, int *k2, int *ipiv, int *incx) nogil
cdef void zlaswp(int *n, z *a, int *lda, int *k1, int *k2, int *ipiv, int *incx) nogil:
    _fortran_zlaswp(n, a, lda, k1, k2, ipiv, incx)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zlauum "F_FUNC(zlauum,ZLAUUM)"(char *uplo, int *n, z *a, int *lda, int *info) nogil
cdef void zlauum(char *uplo, int *n, z *a, int *lda, int *info) nogil:
    _fortran_zlauum(uplo, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpbcon "F_FUNC(zpbcon,ZPBCON)"(char *uplo, int *n, int *kd, z *ab, int *ldab, d *anorm, d *rcond, z *work, d *rwork, int *info) nogil
cdef void zpbcon(char *uplo, int *n, int *kd, z *ab, int *ldab, d *anorm, d *rcond, z *work, d *rwork, int *info) nogil:
    _fortran_zpbcon(uplo, n, kd, ab, ldab, anorm, rcond, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpbequ "F_FUNC(zpbequ,ZPBEQU)"(char *uplo, int *n, int *kd, z *ab, int *ldab, d *s, d *scond, d *amax, int *info) nogil
cdef void zpbequ(char *uplo, int *n, int *kd, z *ab, int *ldab, d *s, d *scond, d *amax, int *info) nogil:
    _fortran_zpbequ(uplo, n, kd, ab, ldab, s, scond, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpbrfs "F_FUNC(zpbrfs,ZPBRFS)"(char *uplo, int *n, int *kd, int *nrhs, z *ab, int *ldab, z *afb, int *ldafb, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zpbrfs(char *uplo, int *n, int *kd, int *nrhs, z *ab, int *ldab, z *afb, int *ldafb, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zpbrfs(uplo, n, kd, nrhs, ab, ldab, afb, ldafb, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpbstf "F_FUNC(zpbstf,ZPBSTF)"(char *uplo, int *n, int *kd, z *ab, int *ldab, int *info) nogil
cdef void zpbstf(char *uplo, int *n, int *kd, z *ab, int *ldab, int *info) nogil:
    _fortran_zpbstf(uplo, n, kd, ab, ldab, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpbsv "F_FUNC(zpbsv,ZPBSV)"(char *uplo, int *n, int *kd, int *nrhs, z *ab, int *ldab, z *b, int *ldb, int *info) nogil
cdef void zpbsv(char *uplo, int *n, int *kd, int *nrhs, z *ab, int *ldab, z *b, int *ldb, int *info) nogil:
    _fortran_zpbsv(uplo, n, kd, nrhs, ab, ldab, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpbsvx "F_FUNC(zpbsvx,ZPBSVX)"(char *fact, char *uplo, int *n, int *kd, int *nrhs, z *ab, int *ldab, z *afb, int *ldafb, char *equed, d *s, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zpbsvx(char *fact, char *uplo, int *n, int *kd, int *nrhs, z *ab, int *ldab, z *afb, int *ldafb, char *equed, d *s, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zpbsvx(fact, uplo, n, kd, nrhs, ab, ldab, afb, ldafb, equed, s, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpbtf2 "F_FUNC(zpbtf2,ZPBTF2)"(char *uplo, int *n, int *kd, z *ab, int *ldab, int *info) nogil
cdef void zpbtf2(char *uplo, int *n, int *kd, z *ab, int *ldab, int *info) nogil:
    _fortran_zpbtf2(uplo, n, kd, ab, ldab, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpbtrf "F_FUNC(zpbtrf,ZPBTRF)"(char *uplo, int *n, int *kd, z *ab, int *ldab, int *info) nogil
cdef void zpbtrf(char *uplo, int *n, int *kd, z *ab, int *ldab, int *info) nogil:
    _fortran_zpbtrf(uplo, n, kd, ab, ldab, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpbtrs "F_FUNC(zpbtrs,ZPBTRS)"(char *uplo, int *n, int *kd, int *nrhs, z *ab, int *ldab, z *b, int *ldb, int *info) nogil
cdef void zpbtrs(char *uplo, int *n, int *kd, int *nrhs, z *ab, int *ldab, z *b, int *ldb, int *info) nogil:
    _fortran_zpbtrs(uplo, n, kd, nrhs, ab, ldab, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpocon "F_FUNC(zpocon,ZPOCON)"(char *uplo, int *n, z *a, int *lda, d *anorm, d *rcond, z *work, d *rwork, int *info) nogil
cdef void zpocon(char *uplo, int *n, z *a, int *lda, d *anorm, d *rcond, z *work, d *rwork, int *info) nogil:
    _fortran_zpocon(uplo, n, a, lda, anorm, rcond, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpoequ "F_FUNC(zpoequ,ZPOEQU)"(int *n, z *a, int *lda, d *s, d *scond, d *amax, int *info) nogil
cdef void zpoequ(int *n, z *a, int *lda, d *s, d *scond, d *amax, int *info) nogil:
    _fortran_zpoequ(n, a, lda, s, scond, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zporfs "F_FUNC(zporfs,ZPORFS)"(char *uplo, int *n, int *nrhs, z *a, int *lda, z *af, int *ldaf, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zporfs(char *uplo, int *n, int *nrhs, z *a, int *lda, z *af, int *ldaf, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zporfs(uplo, n, nrhs, a, lda, af, ldaf, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zposv "F_FUNC(zposv,ZPOSV)"(char *uplo, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, int *info) nogil
cdef void zposv(char *uplo, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, int *info) nogil:
    _fortran_zposv(uplo, n, nrhs, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zposvx "F_FUNC(zposvx,ZPOSVX)"(char *fact, char *uplo, int *n, int *nrhs, z *a, int *lda, z *af, int *ldaf, char *equed, d *s, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zposvx(char *fact, char *uplo, int *n, int *nrhs, z *a, int *lda, z *af, int *ldaf, char *equed, d *s, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zposvx(fact, uplo, n, nrhs, a, lda, af, ldaf, equed, s, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpotf2 "F_FUNC(zpotf2,ZPOTF2)"(char *uplo, int *n, z *a, int *lda, int *info) nogil
cdef void zpotf2(char *uplo, int *n, z *a, int *lda, int *info) nogil:
    _fortran_zpotf2(uplo, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpotrf "F_FUNC(zpotrf,ZPOTRF)"(char *uplo, int *n, z *a, int *lda, int *info) nogil
cdef void zpotrf(char *uplo, int *n, z *a, int *lda, int *info) nogil:
    _fortran_zpotrf(uplo, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpotri "F_FUNC(zpotri,ZPOTRI)"(char *uplo, int *n, z *a, int *lda, int *info) nogil
cdef void zpotri(char *uplo, int *n, z *a, int *lda, int *info) nogil:
    _fortran_zpotri(uplo, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpotrs "F_FUNC(zpotrs,ZPOTRS)"(char *uplo, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, int *info) nogil
cdef void zpotrs(char *uplo, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, int *info) nogil:
    _fortran_zpotrs(uplo, n, nrhs, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zppcon "F_FUNC(zppcon,ZPPCON)"(char *uplo, int *n, z *ap, d *anorm, d *rcond, z *work, d *rwork, int *info) nogil
cdef void zppcon(char *uplo, int *n, z *ap, d *anorm, d *rcond, z *work, d *rwork, int *info) nogil:
    _fortran_zppcon(uplo, n, ap, anorm, rcond, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zppequ "F_FUNC(zppequ,ZPPEQU)"(char *uplo, int *n, z *ap, d *s, d *scond, d *amax, int *info) nogil
cdef void zppequ(char *uplo, int *n, z *ap, d *s, d *scond, d *amax, int *info) nogil:
    _fortran_zppequ(uplo, n, ap, s, scond, amax, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpprfs "F_FUNC(zpprfs,ZPPRFS)"(char *uplo, int *n, int *nrhs, z *ap, z *afp, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zpprfs(char *uplo, int *n, int *nrhs, z *ap, z *afp, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zpprfs(uplo, n, nrhs, ap, afp, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zppsv "F_FUNC(zppsv,ZPPSV)"(char *uplo, int *n, int *nrhs, z *ap, z *b, int *ldb, int *info) nogil
cdef void zppsv(char *uplo, int *n, int *nrhs, z *ap, z *b, int *ldb, int *info) nogil:
    _fortran_zppsv(uplo, n, nrhs, ap, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zppsvx "F_FUNC(zppsvx,ZPPSVX)"(char *fact, char *uplo, int *n, int *nrhs, z *ap, z *afp, char *equed, d *s, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zppsvx(char *fact, char *uplo, int *n, int *nrhs, z *ap, z *afp, char *equed, d *s, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zppsvx(fact, uplo, n, nrhs, ap, afp, equed, s, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpptrf "F_FUNC(zpptrf,ZPPTRF)"(char *uplo, int *n, z *ap, int *info) nogil
cdef void zpptrf(char *uplo, int *n, z *ap, int *info) nogil:
    _fortran_zpptrf(uplo, n, ap, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpptri "F_FUNC(zpptri,ZPPTRI)"(char *uplo, int *n, z *ap, int *info) nogil
cdef void zpptri(char *uplo, int *n, z *ap, int *info) nogil:
    _fortran_zpptri(uplo, n, ap, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpptrs "F_FUNC(zpptrs,ZPPTRS)"(char *uplo, int *n, int *nrhs, z *ap, z *b, int *ldb, int *info) nogil
cdef void zpptrs(char *uplo, int *n, int *nrhs, z *ap, z *b, int *ldb, int *info) nogil:
    _fortran_zpptrs(uplo, n, nrhs, ap, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zptcon "F_FUNC(zptcon,ZPTCON)"(int *n, d *d, z *e, d *anorm, d *rcond, d *rwork, int *info) nogil
cdef void zptcon(int *n, d *d, z *e, d *anorm, d *rcond, d *rwork, int *info) nogil:
    _fortran_zptcon(n, d, e, anorm, rcond, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpteqr "F_FUNC(zpteqr,ZPTEQR)"(char *compz, int *n, d *d, d *e, z *z, int *ldz, d *work, int *info) nogil
cdef void zpteqr(char *compz, int *n, d *d, d *e, z *z, int *ldz, d *work, int *info) nogil:
    _fortran_zpteqr(compz, n, d, e, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zptrfs "F_FUNC(zptrfs,ZPTRFS)"(char *uplo, int *n, int *nrhs, d *d, z *e, d *df, z *ef, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zptrfs(char *uplo, int *n, int *nrhs, d *d, z *e, d *df, z *ef, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zptrfs(uplo, n, nrhs, d, e, df, ef, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zptsv "F_FUNC(zptsv,ZPTSV)"(int *n, int *nrhs, d *d, z *e, z *b, int *ldb, int *info) nogil
cdef void zptsv(int *n, int *nrhs, d *d, z *e, z *b, int *ldb, int *info) nogil:
    _fortran_zptsv(n, nrhs, d, e, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zptsvx "F_FUNC(zptsvx,ZPTSVX)"(char *fact, int *n, int *nrhs, d *d, z *e, d *df, z *ef, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zptsvx(char *fact, int *n, int *nrhs, d *d, z *e, d *df, z *ef, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zptsvx(fact, n, nrhs, d, e, df, ef, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpttrf "F_FUNC(zpttrf,ZPTTRF)"(int *n, d *d, z *e, int *info) nogil
cdef void zpttrf(int *n, d *d, z *e, int *info) nogil:
    _fortran_zpttrf(n, d, e, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zpttrs "F_FUNC(zpttrs,ZPTTRS)"(char *uplo, int *n, int *nrhs, d *d, z *e, z *b, int *ldb, int *info) nogil
cdef void zpttrs(char *uplo, int *n, int *nrhs, d *d, z *e, z *b, int *ldb, int *info) nogil:
    _fortran_zpttrs(uplo, n, nrhs, d, e, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zptts2 "F_FUNC(zptts2,ZPTTS2)"(int *iuplo, int *n, int *nrhs, d *d, z *e, z *b, int *ldb) nogil
cdef void zptts2(int *iuplo, int *n, int *nrhs, d *d, z *e, z *b, int *ldb) nogil:
    _fortran_zptts2(iuplo, n, nrhs, d, e, b, ldb)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zrot "F_FUNC(zrot,ZROT)"(int *n, z *cx, int *incx, z *cy, int *incy, d *c, z *s) nogil
cdef void zrot(int *n, z *cx, int *incx, z *cy, int *incy, d *c, z *s) nogil:
    _fortran_zrot(n, cx, incx, cy, incy, c, s)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zspcon "F_FUNC(zspcon,ZSPCON)"(char *uplo, int *n, z *ap, int *ipiv, d *anorm, d *rcond, z *work, int *info) nogil
cdef void zspcon(char *uplo, int *n, z *ap, int *ipiv, d *anorm, d *rcond, z *work, int *info) nogil:
    _fortran_zspcon(uplo, n, ap, ipiv, anorm, rcond, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zspmv "F_FUNC(zspmv,ZSPMV)"(char *uplo, int *n, z *alpha, z *ap, z *x, int *incx, z *beta, z *y, int *incy) nogil
cdef void zspmv(char *uplo, int *n, z *alpha, z *ap, z *x, int *incx, z *beta, z *y, int *incy) nogil:
    _fortran_zspmv(uplo, n, alpha, ap, x, incx, beta, y, incy)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zspr "F_FUNC(zspr,ZSPR)"(char *uplo, int *n, z *alpha, z *x, int *incx, z *ap) nogil
cdef void zspr(char *uplo, int *n, z *alpha, z *x, int *incx, z *ap) nogil:
    _fortran_zspr(uplo, n, alpha, x, incx, ap)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zsprfs "F_FUNC(zsprfs,ZSPRFS)"(char *uplo, int *n, int *nrhs, z *ap, z *afp, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zsprfs(char *uplo, int *n, int *nrhs, z *ap, z *afp, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zsprfs(uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zspsv "F_FUNC(zspsv,ZSPSV)"(char *uplo, int *n, int *nrhs, z *ap, int *ipiv, z *b, int *ldb, int *info) nogil
cdef void zspsv(char *uplo, int *n, int *nrhs, z *ap, int *ipiv, z *b, int *ldb, int *info) nogil:
    _fortran_zspsv(uplo, n, nrhs, ap, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zspsvx "F_FUNC(zspsvx,ZSPSVX)"(char *fact, char *uplo, int *n, int *nrhs, z *ap, z *afp, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zspsvx(char *fact, char *uplo, int *n, int *nrhs, z *ap, z *afp, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zspsvx(fact, uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx, rcond, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zsptrf "F_FUNC(zsptrf,ZSPTRF)"(char *uplo, int *n, z *ap, int *ipiv, int *info) nogil
cdef void zsptrf(char *uplo, int *n, z *ap, int *ipiv, int *info) nogil:
    _fortran_zsptrf(uplo, n, ap, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zsptri "F_FUNC(zsptri,ZSPTRI)"(char *uplo, int *n, z *ap, int *ipiv, z *work, int *info) nogil
cdef void zsptri(char *uplo, int *n, z *ap, int *ipiv, z *work, int *info) nogil:
    _fortran_zsptri(uplo, n, ap, ipiv, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zsptrs "F_FUNC(zsptrs,ZSPTRS)"(char *uplo, int *n, int *nrhs, z *ap, int *ipiv, z *b, int *ldb, int *info) nogil
cdef void zsptrs(char *uplo, int *n, int *nrhs, z *ap, int *ipiv, z *b, int *ldb, int *info) nogil:
    _fortran_zsptrs(uplo, n, nrhs, ap, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zstedc "F_FUNC(zstedc,ZSTEDC)"(char *compz, int *n, d *d, d *e, z *z, int *ldz, z *work, int *lwork, d *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil
cdef void zstedc(char *compz, int *n, d *d, d *e, z *z, int *ldz, z *work, int *lwork, d *rwork, int *lrwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_zstedc(compz, n, d, e, z, ldz, work, lwork, rwork, lrwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zstegr "F_FUNC(zstegr,ZSTEGR)"(char *jobz, char *range, int *n, d *d, d *e, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, z *z, int *ldz, int *isuppz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void zstegr(char *jobz, char *range, int *n, d *d, d *e, d *vl, d *vu, int *il, int *iu, d *abstol, int *m, d *w, z *z, int *ldz, int *isuppz, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_zstegr(jobz, range, n, d, e, vl, vu, il, iu, abstol, m, w, z, ldz, isuppz, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zstein "F_FUNC(zstein,ZSTEIN)"(int *n, d *d, d *e, int *m, d *w, int *iblock, int *isplit, z *z, int *ldz, d *work, int *iwork, int *ifail, int *info) nogil
cdef void zstein(int *n, d *d, d *e, int *m, d *w, int *iblock, int *isplit, z *z, int *ldz, d *work, int *iwork, int *ifail, int *info) nogil:
    _fortran_zstein(n, d, e, m, w, iblock, isplit, z, ldz, work, iwork, ifail, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zstemr "F_FUNC(zstemr,ZSTEMR)"(char *jobz, char *range, int *n, d *d, d *e, d *vl, d *vu, int *il, int *iu, int *m, d *w, z *z, int *ldz, int *nzc, int *isuppz, bint *tryrac, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void zstemr(char *jobz, char *range, int *n, d *d, d *e, d *vl, d *vu, int *il, int *iu, int *m, d *w, z *z, int *ldz, int *nzc, int *isuppz, bint *tryrac, d *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_zstemr(jobz, range, n, d, e, vl, vu, il, iu, m, w, z, ldz, nzc, isuppz, tryrac, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zsteqr "F_FUNC(zsteqr,ZSTEQR)"(char *compz, int *n, d *d, d *e, z *z, int *ldz, d *work, int *info) nogil
cdef void zsteqr(char *compz, int *n, d *d, d *e, z *z, int *ldz, d *work, int *info) nogil:
    _fortran_zsteqr(compz, n, d, e, z, ldz, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zsycon "F_FUNC(zsycon,ZSYCON)"(char *uplo, int *n, z *a, int *lda, int *ipiv, d *anorm, d *rcond, z *work, int *info) nogil
cdef void zsycon(char *uplo, int *n, z *a, int *lda, int *ipiv, d *anorm, d *rcond, z *work, int *info) nogil:
    _fortran_zsycon(uplo, n, a, lda, ipiv, anorm, rcond, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zsymv "F_FUNC(zsymv,ZSYMV)"(char *uplo, int *n, z *alpha, z *a, int *lda, z *x, int *incx, z *beta, z *y, int *incy) nogil
cdef void zsymv(char *uplo, int *n, z *alpha, z *a, int *lda, z *x, int *incx, z *beta, z *y, int *incy) nogil:
    _fortran_zsymv(uplo, n, alpha, a, lda, x, incx, beta, y, incy)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zsyr "F_FUNC(zsyr,ZSYR)"(char *uplo, int *n, z *alpha, z *x, int *incx, z *a, int *lda) nogil
cdef void zsyr(char *uplo, int *n, z *alpha, z *x, int *incx, z *a, int *lda) nogil:
    _fortran_zsyr(uplo, n, alpha, x, incx, a, lda)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zsyrfs "F_FUNC(zsyrfs,ZSYRFS)"(char *uplo, int *n, int *nrhs, z *a, int *lda, z *af, int *ldaf, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void zsyrfs(char *uplo, int *n, int *nrhs, z *a, int *lda, z *af, int *ldaf, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_zsyrfs(uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zsysv "F_FUNC(zsysv,ZSYSV)"(char *uplo, int *n, int *nrhs, z *a, int *lda, int *ipiv, z *b, int *ldb, z *work, int *lwork, int *info) nogil
cdef void zsysv(char *uplo, int *n, int *nrhs, z *a, int *lda, int *ipiv, z *b, int *ldb, z *work, int *lwork, int *info) nogil:
    _fortran_zsysv(uplo, n, nrhs, a, lda, ipiv, b, ldb, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zsysvx "F_FUNC(zsysvx,ZSYSVX)"(char *fact, char *uplo, int *n, int *nrhs, z *a, int *lda, z *af, int *ldaf, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, int *lwork, d *rwork, int *info) nogil
cdef void zsysvx(char *fact, char *uplo, int *n, int *nrhs, z *a, int *lda, z *af, int *ldaf, int *ipiv, z *b, int *ldb, z *x, int *ldx, d *rcond, d *ferr, d *berr, z *work, int *lwork, d *rwork, int *info) nogil:
    _fortran_zsysvx(fact, uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb, x, ldx, rcond, ferr, berr, work, lwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zsytf2 "F_FUNC(zsytf2,ZSYTF2)"(char *uplo, int *n, z *a, int *lda, int *ipiv, int *info) nogil
cdef void zsytf2(char *uplo, int *n, z *a, int *lda, int *ipiv, int *info) nogil:
    _fortran_zsytf2(uplo, n, a, lda, ipiv, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zsytrf "F_FUNC(zsytrf,ZSYTRF)"(char *uplo, int *n, z *a, int *lda, int *ipiv, z *work, int *lwork, int *info) nogil
cdef void zsytrf(char *uplo, int *n, z *a, int *lda, int *ipiv, z *work, int *lwork, int *info) nogil:
    _fortran_zsytrf(uplo, n, a, lda, ipiv, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zsytri "F_FUNC(zsytri,ZSYTRI)"(char *uplo, int *n, z *a, int *lda, int *ipiv, z *work, int *info) nogil
cdef void zsytri(char *uplo, int *n, z *a, int *lda, int *ipiv, z *work, int *info) nogil:
    _fortran_zsytri(uplo, n, a, lda, ipiv, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zsytrs "F_FUNC(zsytrs,ZSYTRS)"(char *uplo, int *n, int *nrhs, z *a, int *lda, int *ipiv, z *b, int *ldb, int *info) nogil
cdef void zsytrs(char *uplo, int *n, int *nrhs, z *a, int *lda, int *ipiv, z *b, int *ldb, int *info) nogil:
    _fortran_zsytrs(uplo, n, nrhs, a, lda, ipiv, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztbcon "F_FUNC(ztbcon,ZTBCON)"(char *norm, char *uplo, char *diag, int *n, int *kd, z *ab, int *ldab, d *rcond, z *work, d *rwork, int *info) nogil
cdef void ztbcon(char *norm, char *uplo, char *diag, int *n, int *kd, z *ab, int *ldab, d *rcond, z *work, d *rwork, int *info) nogil:
    _fortran_ztbcon(norm, uplo, diag, n, kd, ab, ldab, rcond, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztbrfs "F_FUNC(ztbrfs,ZTBRFS)"(char *uplo, char *trans, char *diag, int *n, int *kd, int *nrhs, z *ab, int *ldab, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void ztbrfs(char *uplo, char *trans, char *diag, int *n, int *kd, int *nrhs, z *ab, int *ldab, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_ztbrfs(uplo, trans, diag, n, kd, nrhs, ab, ldab, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztbtrs "F_FUNC(ztbtrs,ZTBTRS)"(char *uplo, char *trans, char *diag, int *n, int *kd, int *nrhs, z *ab, int *ldab, z *b, int *ldb, int *info) nogil
cdef void ztbtrs(char *uplo, char *trans, char *diag, int *n, int *kd, int *nrhs, z *ab, int *ldab, z *b, int *ldb, int *info) nogil:
    _fortran_ztbtrs(uplo, trans, diag, n, kd, nrhs, ab, ldab, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztgevc "F_FUNC(ztgevc,ZTGEVC)"(char *side, char *howmny, bint *select, int *n, z *s, int *lds, z *p, int *ldp, z *vl, int *ldvl, z *vr, int *ldvr, int *mm, int *m, z *work, d *rwork, int *info) nogil
cdef void ztgevc(char *side, char *howmny, bint *select, int *n, z *s, int *lds, z *p, int *ldp, z *vl, int *ldvl, z *vr, int *ldvr, int *mm, int *m, z *work, d *rwork, int *info) nogil:
    _fortran_ztgevc(side, howmny, select, n, s, lds, p, ldp, vl, ldvl, vr, ldvr, mm, m, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztgex2 "F_FUNC(ztgex2,ZTGEX2)"(bint *wantq, bint *wantz, int *n, z *a, int *lda, z *b, int *ldb, z *q, int *ldq, z *z, int *ldz, int *j1, int *info) nogil
cdef void ztgex2(bint *wantq, bint *wantz, int *n, z *a, int *lda, z *b, int *ldb, z *q, int *ldq, z *z, int *ldz, int *j1, int *info) nogil:
    _fortran_ztgex2(wantq, wantz, n, a, lda, b, ldb, q, ldq, z, ldz, j1, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztgexc "F_FUNC(ztgexc,ZTGEXC)"(bint *wantq, bint *wantz, int *n, z *a, int *lda, z *b, int *ldb, z *q, int *ldq, z *z, int *ldz, int *ifst, int *ilst, int *info) nogil
cdef void ztgexc(bint *wantq, bint *wantz, int *n, z *a, int *lda, z *b, int *ldb, z *q, int *ldq, z *z, int *ldz, int *ifst, int *ilst, int *info) nogil:
    _fortran_ztgexc(wantq, wantz, n, a, lda, b, ldb, q, ldq, z, ldz, ifst, ilst, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztgsen "F_FUNC(ztgsen,ZTGSEN)"(int *ijob, bint *wantq, bint *wantz, bint *select, int *n, z *a, int *lda, z *b, int *ldb, z *alpha, z *beta, z *q, int *ldq, z *z, int *ldz, int *m, d *pl, d *pr, d *dif, z *work, int *lwork, int *iwork, int *liwork, int *info) nogil
cdef void ztgsen(int *ijob, bint *wantq, bint *wantz, bint *select, int *n, z *a, int *lda, z *b, int *ldb, z *alpha, z *beta, z *q, int *ldq, z *z, int *ldz, int *m, d *pl, d *pr, d *dif, z *work, int *lwork, int *iwork, int *liwork, int *info) nogil:
    _fortran_ztgsen(ijob, wantq, wantz, select, n, a, lda, b, ldb, alpha, beta, q, ldq, z, ldz, m, pl, pr, dif, work, lwork, iwork, liwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztgsja "F_FUNC(ztgsja,ZTGSJA)"(char *jobu, char *jobv, char *jobq, int *m, int *p, int *n, int *k, int *l, z *a, int *lda, z *b, int *ldb, d *tola, d *tolb, d *alpha, d *beta, z *u, int *ldu, z *v, int *ldv, z *q, int *ldq, z *work, int *ncycle, int *info) nogil
cdef void ztgsja(char *jobu, char *jobv, char *jobq, int *m, int *p, int *n, int *k, int *l, z *a, int *lda, z *b, int *ldb, d *tola, d *tolb, d *alpha, d *beta, z *u, int *ldu, z *v, int *ldv, z *q, int *ldq, z *work, int *ncycle, int *info) nogil:
    _fortran_ztgsja(jobu, jobv, jobq, m, p, n, k, l, a, lda, b, ldb, tola, tolb, alpha, beta, u, ldu, v, ldv, q, ldq, work, ncycle, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztgsna "F_FUNC(ztgsna,ZTGSNA)"(char *job, char *howmny, bint *select, int *n, z *a, int *lda, z *b, int *ldb, z *vl, int *ldvl, z *vr, int *ldvr, d *s, d *dif, int *mm, int *m, z *work, int *lwork, int *iwork, int *info) nogil
cdef void ztgsna(char *job, char *howmny, bint *select, int *n, z *a, int *lda, z *b, int *ldb, z *vl, int *ldvl, z *vr, int *ldvr, d *s, d *dif, int *mm, int *m, z *work, int *lwork, int *iwork, int *info) nogil:
    _fortran_ztgsna(job, howmny, select, n, a, lda, b, ldb, vl, ldvl, vr, ldvr, s, dif, mm, m, work, lwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztgsy2 "F_FUNC(ztgsy2,ZTGSY2)"(char *trans, int *ijob, int *m, int *n, z *a, int *lda, z *b, int *ldb, z *c, int *ldc, z *d, int *ldd, z *e, int *lde, z *f, int *ldf, d *scale, d *rdsum, d *rdscal, int *info) nogil
cdef void ztgsy2(char *trans, int *ijob, int *m, int *n, z *a, int *lda, z *b, int *ldb, z *c, int *ldc, z *d, int *ldd, z *e, int *lde, z *f, int *ldf, d *scale, d *rdsum, d *rdscal, int *info) nogil:
    _fortran_ztgsy2(trans, ijob, m, n, a, lda, b, ldb, c, ldc, d, ldd, e, lde, f, ldf, scale, rdsum, rdscal, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztgsyl "F_FUNC(ztgsyl,ZTGSYL)"(char *trans, int *ijob, int *m, int *n, z *a, int *lda, z *b, int *ldb, z *c, int *ldc, z *d, int *ldd, z *e, int *lde, z *f, int *ldf, d *scale, d *dif, z *work, int *lwork, int *iwork, int *info) nogil
cdef void ztgsyl(char *trans, int *ijob, int *m, int *n, z *a, int *lda, z *b, int *ldb, z *c, int *ldc, z *d, int *ldd, z *e, int *lde, z *f, int *ldf, d *scale, d *dif, z *work, int *lwork, int *iwork, int *info) nogil:
    _fortran_ztgsyl(trans, ijob, m, n, a, lda, b, ldb, c, ldc, d, ldd, e, lde, f, ldf, scale, dif, work, lwork, iwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztpcon "F_FUNC(ztpcon,ZTPCON)"(char *norm, char *uplo, char *diag, int *n, z *ap, d *rcond, z *work, d *rwork, int *info) nogil
cdef void ztpcon(char *norm, char *uplo, char *diag, int *n, z *ap, d *rcond, z *work, d *rwork, int *info) nogil:
    _fortran_ztpcon(norm, uplo, diag, n, ap, rcond, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztprfs "F_FUNC(ztprfs,ZTPRFS)"(char *uplo, char *trans, char *diag, int *n, int *nrhs, z *ap, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void ztprfs(char *uplo, char *trans, char *diag, int *n, int *nrhs, z *ap, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_ztprfs(uplo, trans, diag, n, nrhs, ap, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztptri "F_FUNC(ztptri,ZTPTRI)"(char *uplo, char *diag, int *n, z *ap, int *info) nogil
cdef void ztptri(char *uplo, char *diag, int *n, z *ap, int *info) nogil:
    _fortran_ztptri(uplo, diag, n, ap, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztptrs "F_FUNC(ztptrs,ZTPTRS)"(char *uplo, char *trans, char *diag, int *n, int *nrhs, z *ap, z *b, int *ldb, int *info) nogil
cdef void ztptrs(char *uplo, char *trans, char *diag, int *n, int *nrhs, z *ap, z *b, int *ldb, int *info) nogil:
    _fortran_ztptrs(uplo, trans, diag, n, nrhs, ap, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztrcon "F_FUNC(ztrcon,ZTRCON)"(char *norm, char *uplo, char *diag, int *n, z *a, int *lda, d *rcond, z *work, d *rwork, int *info) nogil
cdef void ztrcon(char *norm, char *uplo, char *diag, int *n, z *a, int *lda, d *rcond, z *work, d *rwork, int *info) nogil:
    _fortran_ztrcon(norm, uplo, diag, n, a, lda, rcond, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztrevc "F_FUNC(ztrevc,ZTREVC)"(char *side, char *howmny, bint *select, int *n, z *t, int *ldt, z *vl, int *ldvl, z *vr, int *ldvr, int *mm, int *m, z *work, d *rwork, int *info) nogil
cdef void ztrevc(char *side, char *howmny, bint *select, int *n, z *t, int *ldt, z *vl, int *ldvl, z *vr, int *ldvr, int *mm, int *m, z *work, d *rwork, int *info) nogil:
    _fortran_ztrevc(side, howmny, select, n, t, ldt, vl, ldvl, vr, ldvr, mm, m, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztrexc "F_FUNC(ztrexc,ZTREXC)"(char *compq, int *n, z *t, int *ldt, z *q, int *ldq, int *ifst, int *ilst, int *info) nogil
cdef void ztrexc(char *compq, int *n, z *t, int *ldt, z *q, int *ldq, int *ifst, int *ilst, int *info) nogil:
    _fortran_ztrexc(compq, n, t, ldt, q, ldq, ifst, ilst, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztrrfs "F_FUNC(ztrrfs,ZTRRFS)"(char *uplo, char *trans, char *diag, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil
cdef void ztrrfs(char *uplo, char *trans, char *diag, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, z *x, int *ldx, d *ferr, d *berr, z *work, d *rwork, int *info) nogil:
    _fortran_ztrrfs(uplo, trans, diag, n, nrhs, a, lda, b, ldb, x, ldx, ferr, berr, work, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztrsen "F_FUNC(ztrsen,ZTRSEN)"(char *job, char *compq, bint *select, int *n, z *t, int *ldt, z *q, int *ldq, z *w, int *m, d *s, d *sep, z *work, int *lwork, int *info) nogil
cdef void ztrsen(char *job, char *compq, bint *select, int *n, z *t, int *ldt, z *q, int *ldq, z *w, int *m, d *s, d *sep, z *work, int *lwork, int *info) nogil:
    _fortran_ztrsen(job, compq, select, n, t, ldt, q, ldq, w, m, s, sep, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztrsna "F_FUNC(ztrsna,ZTRSNA)"(char *job, char *howmny, bint *select, int *n, z *t, int *ldt, z *vl, int *ldvl, z *vr, int *ldvr, d *s, d *sep, int *mm, int *m, z *work, int *ldwork, d *rwork, int *info) nogil
cdef void ztrsna(char *job, char *howmny, bint *select, int *n, z *t, int *ldt, z *vl, int *ldvl, z *vr, int *ldvr, d *s, d *sep, int *mm, int *m, z *work, int *ldwork, d *rwork, int *info) nogil:
    _fortran_ztrsna(job, howmny, select, n, t, ldt, vl, ldvl, vr, ldvr, s, sep, mm, m, work, ldwork, rwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztrsyl "F_FUNC(ztrsyl,ZTRSYL)"(char *trana, char *tranb, int *isgn, int *m, int *n, z *a, int *lda, z *b, int *ldb, z *c, int *ldc, d *scale, int *info) nogil
cdef void ztrsyl(char *trana, char *tranb, int *isgn, int *m, int *n, z *a, int *lda, z *b, int *ldb, z *c, int *ldc, d *scale, int *info) nogil:
    _fortran_ztrsyl(trana, tranb, isgn, m, n, a, lda, b, ldb, c, ldc, scale, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztrti2 "F_FUNC(ztrti2,ZTRTI2)"(char *uplo, char *diag, int *n, z *a, int *lda, int *info) nogil
cdef void ztrti2(char *uplo, char *diag, int *n, z *a, int *lda, int *info) nogil:
    _fortran_ztrti2(uplo, diag, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztrtri "F_FUNC(ztrtri,ZTRTRI)"(char *uplo, char *diag, int *n, z *a, int *lda, int *info) nogil
cdef void ztrtri(char *uplo, char *diag, int *n, z *a, int *lda, int *info) nogil:
    _fortran_ztrtri(uplo, diag, n, a, lda, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztrtrs "F_FUNC(ztrtrs,ZTRTRS)"(char *uplo, char *trans, char *diag, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, int *info) nogil
cdef void ztrtrs(char *uplo, char *trans, char *diag, int *n, int *nrhs, z *a, int *lda, z *b, int *ldb, int *info) nogil:
    _fortran_ztrtrs(uplo, trans, diag, n, nrhs, a, lda, b, ldb, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztzrqf "F_FUNC(ztzrqf,ZTZRQF)"(int *m, int *n, z *a, int *lda, z *tau, int *info) nogil
cdef void ztzrqf(int *m, int *n, z *a, int *lda, z *tau, int *info) nogil:
    _fortran_ztzrqf(m, n, a, lda, tau, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_ztzrzf "F_FUNC(ztzrzf,ZTZRZF)"(int *m, int *n, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil
cdef void ztzrzf(int *m, int *n, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil:
    _fortran_ztzrzf(m, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zung2l "F_FUNC(zung2l,ZUNG2L)"(int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *info) nogil
cdef void zung2l(int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *info) nogil:
    _fortran_zung2l(m, n, k, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zung2r "F_FUNC(zung2r,ZUNG2R)"(int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *info) nogil
cdef void zung2r(int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *info) nogil:
    _fortran_zung2r(m, n, k, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zungbr "F_FUNC(zungbr,ZUNGBR)"(char *vect, int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil
cdef void zungbr(char *vect, int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil:
    _fortran_zungbr(vect, m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zunghr "F_FUNC(zunghr,ZUNGHR)"(int *n, int *ilo, int *ihi, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil
cdef void zunghr(int *n, int *ilo, int *ihi, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil:
    _fortran_zunghr(n, ilo, ihi, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zungl2 "F_FUNC(zungl2,ZUNGL2)"(int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *info) nogil
cdef void zungl2(int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *info) nogil:
    _fortran_zungl2(m, n, k, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zunglq "F_FUNC(zunglq,ZUNGLQ)"(int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil
cdef void zunglq(int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil:
    _fortran_zunglq(m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zungql "F_FUNC(zungql,ZUNGQL)"(int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil
cdef void zungql(int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil:
    _fortran_zungql(m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zungqr "F_FUNC(zungqr,ZUNGQR)"(int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil
cdef void zungqr(int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil:
    _fortran_zungqr(m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zungr2 "F_FUNC(zungr2,ZUNGR2)"(int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *info) nogil
cdef void zungr2(int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *info) nogil:
    _fortran_zungr2(m, n, k, a, lda, tau, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zungrq "F_FUNC(zungrq,ZUNGRQ)"(int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil
cdef void zungrq(int *m, int *n, int *k, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil:
    _fortran_zungrq(m, n, k, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zungtr "F_FUNC(zungtr,ZUNGTR)"(char *uplo, int *n, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil
cdef void zungtr(char *uplo, int *n, z *a, int *lda, z *tau, z *work, int *lwork, int *info) nogil:
    _fortran_zungtr(uplo, n, a, lda, tau, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zunm2l "F_FUNC(zunm2l,ZUNM2L)"(char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *info) nogil
cdef void zunm2l(char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *info) nogil:
    _fortran_zunm2l(side, trans, m, n, k, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zunm2r "F_FUNC(zunm2r,ZUNM2R)"(char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *info) nogil
cdef void zunm2r(char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *info) nogil:
    _fortran_zunm2r(side, trans, m, n, k, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zunmbr "F_FUNC(zunmbr,ZUNMBR)"(char *vect, char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *lwork, int *info) nogil
cdef void zunmbr(char *vect, char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *lwork, int *info) nogil:
    _fortran_zunmbr(vect, side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zunmhr "F_FUNC(zunmhr,ZUNMHR)"(char *side, char *trans, int *m, int *n, int *ilo, int *ihi, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *lwork, int *info) nogil
cdef void zunmhr(char *side, char *trans, int *m, int *n, int *ilo, int *ihi, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *lwork, int *info) nogil:
    _fortran_zunmhr(side, trans, m, n, ilo, ihi, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zunml2 "F_FUNC(zunml2,ZUNML2)"(char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *info) nogil
cdef void zunml2(char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *info) nogil:
    _fortran_zunml2(side, trans, m, n, k, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zunmlq "F_FUNC(zunmlq,ZUNMLQ)"(char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *lwork, int *info) nogil
cdef void zunmlq(char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *lwork, int *info) nogil:
    _fortran_zunmlq(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zunmql "F_FUNC(zunmql,ZUNMQL)"(char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *lwork, int *info) nogil
cdef void zunmql(char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *lwork, int *info) nogil:
    _fortran_zunmql(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zunmqr "F_FUNC(zunmqr,ZUNMQR)"(char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *lwork, int *info) nogil
cdef void zunmqr(char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *lwork, int *info) nogil:
    _fortran_zunmqr(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zunmr2 "F_FUNC(zunmr2,ZUNMR2)"(char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *info) nogil
cdef void zunmr2(char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *info) nogil:
    _fortran_zunmr2(side, trans, m, n, k, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zunmr3 "F_FUNC(zunmr3,ZUNMR3)"(char *side, char *trans, int *m, int *n, int *k, int *l, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *info) nogil
cdef void zunmr3(char *side, char *trans, int *m, int *n, int *k, int *l, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *info) nogil:
    _fortran_zunmr3(side, trans, m, n, k, l, a, lda, tau, c, ldc, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zunmrq "F_FUNC(zunmrq,ZUNMRQ)"(char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *lwork, int *info) nogil
cdef void zunmrq(char *side, char *trans, int *m, int *n, int *k, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *lwork, int *info) nogil:
    _fortran_zunmrq(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zunmrz "F_FUNC(zunmrz,ZUNMRZ)"(char *side, char *trans, int *m, int *n, int *k, int *l, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *lwork, int *info) nogil
cdef void zunmrz(char *side, char *trans, int *m, int *n, int *k, int *l, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *lwork, int *info) nogil:
    _fortran_zunmrz(side, trans, m, n, k, l, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zunmtr "F_FUNC(zunmtr,ZUNMTR)"(char *side, char *uplo, char *trans, int *m, int *n, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *lwork, int *info) nogil
cdef void zunmtr(char *side, char *uplo, char *trans, int *m, int *n, z *a, int *lda, z *tau, z *c, int *ldc, z *work, int *lwork, int *info) nogil:
    _fortran_zunmtr(side, uplo, trans, m, n, a, lda, tau, c, ldc, work, lwork, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zupgtr "F_FUNC(zupgtr,ZUPGTR)"(char *uplo, int *n, z *ap, z *tau, z *q, int *ldq, z *work, int *info) nogil
cdef void zupgtr(char *uplo, int *n, z *ap, z *tau, z *q, int *ldq, z *work, int *info) nogil:
    _fortran_zupgtr(uplo, n, ap, tau, q, ldq, work, info)

cdef extern from "_lapack_subroutines.h":
    void _fortran_zupmtr "F_FUNC(zupmtr,ZUPMTR)"(char *side, char *uplo, char *trans, int *m, int *n, z *ap, z *tau, z *c, int *ldc, z *work, int *info) nogil
cdef void zupmtr(char *side, char *uplo, char *trans, int *m, int *n, z *ap, z *tau, z *c, int *ldc, z *work, int *info) nogil:
    _fortran_zupmtr(side, uplo, trans, m, n, ap, tau, c, ldc, work, info)


# Python accessible wrappers for testing:

def _test_dlamch(cmach):
    # This conversion is necessary to handle Python 3 strings.
    cmach_bytes = bytes(cmach)
    # Now that it is a bytes representation, a non-temporary variable
    # must be passed as a part of the function call.
    cdef char* cmach_char = cmach_bytes
    return dlamch(cmach_char)

def _test_slamch(cmach):
    # This conversion is necessary to handle Python 3 strings.
    cmach_bytes = bytes(cmach)
    # Now that it is a bytes representation, a non-temporary variable
    # must be passed as a part of the function call.
    cdef char* cmach_char = cmach_bytes
    return slamch(cmach_char)
