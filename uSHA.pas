unit uSHA;

interface

uses
  Windows, Classes, uOpenSSLConst;

const
  SHA_LBLOCK = 16;
  SHA_CBLOCK = SHA_LBLOCK * 4;///* SHA treats input data as a
					 //* contiguous array of 32 bit
					 //* wide big-endian values. */
  SHA_LAST_BLOCK = (SHA_CBLOCK-8);           
  SHA_DIGEST_LENGTH = 20;


  SHA256_CBLOCK	= (SHA_LBLOCK*4);	//* SHA-256 treats input data as a
					 //* contiguous array of 32 bit
					 //* wide big-endian values. */
  SHA224_DIGEST_LENGTH = 28;           
  SHA256_DIGEST_LENGTH = 32;
  SHA384_DIGEST_LENGTH = 48;
  SHA512_DIGEST_LENGTH = 64;

  SHA512_CBLOCK	= (SHA_LBLOCK*8);	///* SHA-512 treats input data as a
					 //* contiguous array of 64 bit
					 //* wide big-endian values. */
type
  SHA_LONG = Cardinal;   
  SHA_LONG64 = Int64;

  //  typedef struct SHAstate_st
  //	{
  //	SHA_LONG h0,h1,h2,h3,h4;
  //	SHA_LONG Nl,Nh;
  //	SHA_LONG data[SHA_LBLOCK];
  //	unsigned int num;
  //	} SHA_CTX;
  SHAstate_st = record
    h0,h1,h2,h3,h4: SHA_LONG;
    Nl,Nh         : SHA_LONG;
    data          : array[0..SHA_LBLOCK-1] of SHA_LONG;
    num           : Cardinal;  
  end;
  SHA_CTX = SHAstate_st;
  PSHA_CTX = ^SHA_CTX;

  //typedef struct SHA256state_st
  //	{
  //	SHA_LONG h[8];
  //	SHA_LONG Nl,Nh;
  //	SHA_LONG data[SHA_LBLOCK];
  //	unsigned int num,md_len;
  //	} SHA256_CTX;
  SHA256state_st = record
    h         : array[0..7] of SHA_LONG;
    Nl,Nh     : SHA_LONG;
    data      : array[0..SHA_LBLOCK - 1] of SHA_LONG;
    num,md_len: Cardinal;
  end;
  SHA256_CTX = SHA256state_st;
  PSHA256_CTX = ^SHA256_CTX;

  //typedef struct SHA512state_st
  //	{
  //	SHA_LONG64 h[8];
  //	SHA_LONG64 Nl,Nh;
  //	union {
  //		SHA_LONG64	d[SHA_LBLOCK];
  //		unsigned char	p[SHA512_CBLOCK];
  //	} u;
  //	unsigned int num,md_len;
  //	} SHA512_CTX;
  _u = record
    d: array[0..SHA_LBLOCK] of SHA_LONG64;
    p: array[0..SHA512_CBLOCK - 1] of Byte;
  end;
  
  SHA512state_st = record
    h: array[0..7] of SHA_LONG64;
    Nl,Nh: SHA_LONG64;
    u: _u;
    num,md_len: Cardinal;
  end;
  
  //SHA
  //int SHA_Init(SHA_CTX *c);
  function SHA_Init(c: PSHA_CTX): Integer; cdecl; external LIBEAY32;
  //int SHA_Update(SHA_CTX *c, const void *data, size_t len);
  function SHA_Update(c: PSHA_CTX; data: Pointer; len: size_t): Integer; cdecl; external LIBEAY32;
  //int SHA_Final(unsigned char *md, SHA_CTX *c);
  function SHA_Final(md: array of Byte; c: PSHA_CTX): Integer; cdecl; external LIBEAY32;
  //unsigned char *SHA(const unsigned char *d, size_t n, unsigned char *md);
  function SHA(const d: PByte; n: size_t; md: array of Byte): PByte; cdecl; external LIBEAY32;

  //SHA1
  //int SHA1_Init(SHA_CTX *c);
  function SHA1_Init(c: PSHA_CTX): Integer; cdecl; external LIBEAY32;
  //int SHA1_Update(SHA_CTX *c, const void *data, size_t len);
  function SHA1_Update(c: PSHA_CTX; data: Pointer; len: size_t): Integer; cdecl; external LIBEAY32;
  //int SHA1_Final(unsigned char *md, SHA_CTX *c);
  function SHA1_Final(md: array of Byte; c: PSHA_CTX): Integer; cdecl; external LIBEAY32;
  //unsigned char *SHA1(const unsigned char *d, size_t n, unsigned char *md);
  function SHA1(const d: PByte; n: size_t; md: array of Byte): PByte; cdecl; external LIBEAY32;

  //SHA224
  //int SHA224_Init(SHA256_CTX *c);
  function SHA224_Init(c: PSHA256_CTX): Integer; cdecl; external LIBEAY32;
  //int SHA224_Update(SHA256_CTX *c, const void *data, size_t len);
  function SHA224_Update(c: PSHA256_CTX; data: Pointer; len: size_t): Integer; cdecl; external LIBEAY32;
  //int SHA224_Final(unsigned char *md, SHA256_CTX *c);
  function SHA224_Final(md: array of Byte; c: PSHA256_CTX): Integer; cdecl; external LIBEAY32;
  //unsigned char *SHA224(const unsigned char *d, size_t n,unsigned char *md);
  function SHA224(const d: PByte; n: size_t; md: array of Byte): PByte; cdecl; external LIBEAY32;

  //SHA256
  //int SHA256_Init(SHA256_CTX *c);
  function SHA256_Init(c: PSHA256_CTX): Integer; cdecl; external LIBEAY32;
  //int SHA256_Update(SHA256_CTX *c, const void *data, size_t len);
  function SHA256_Update(c: PSHA256_CTX; data: Pointer; len: size_t): Integer; cdecl; external LIBEAY32;
  //int SHA256_Final(unsigned char *md, SHA256_CTX *c);
  function SHA256_Final(md: array of Byte; c: PSHA256_CTX): Integer; cdecl; external LIBEAY32;
  //unsigned char *SHA256(const unsigned char *d, size_t n,unsigned char *md);
  function SHA256(const d: PByte; n: size_t; md: array of Byte): PByte; cdecl; external LIBEAY32;

implementation

end.
