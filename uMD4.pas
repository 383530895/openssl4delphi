unit uMD4;

interface

uses
  Windows, Classes, uOpenSSLConst;

const
  MD4_CBLOCK =	64;
  MD4_LBLOCK =	16;//(MD4_CBLOCK/4);
  MD4_DIGEST_LENGTH = 16;
    
type
  MD4_LONG =	Cardinal; //unsigned int

  MD4state_st = record
    A,B,C,D: MD4_LONG;
    Nl,Nh  : MD4_LONG;
    data   : array[0..MD4_LBLOCK - 1] of MD4_LONG;
    num    : Cardinal;
  end;
  MD4_CTX = MD4state_st;
  PMD4_CTX = ^MD4_CTX;

  //int MD4_Init(MD4_CTX *c);
  function MD4_Init(c: PMD4_CTX): Integer; cdecl; external LIBEAY32;
  //int MD4_Update(MD4_CTX *c, const void *data, size_t len);
  function MD4_Update(c: PMD4_CTX): Integer; cdecl; external LIBEAY32;
  //int MD4_Final(unsigned char *md, MD4_CTX *c);
  function MD4_Final(md: PByte; c: PMD4_CTX): Integer; cdecl; external LIBEAY32;
  
  //unsigned char *MD4(const unsigned char *d, size_t n, unsigned char *md);
  function MD4(d: PByte; n: size_t; md: array of Byte): PByte; cdecl; external LIBEAY32;
  
implementation

end.
