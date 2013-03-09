{
  OpenSSL md5.h
}
unit uMD5;

interface

uses
  Windows, Classes, uOpenSSLConst;

const
  MD5_CBLOCK =	64;
  MD5_LBLOCK =	16;//(MD5_CBLOCK/4);
  MD5_DIGEST_LENGTH = 16;

type
  MD5_LONG = Cardinal; //unsigned int

  MD5state_st = record
    A,B,C,D: MD5_LONG;
    Nl,Nh  : MD5_LONG;
    data   : array[0..MD5_LBLOCK - 1] of MD5_LONG;
    num    : Cardinal;
  end;
  MD5_CTX = MD5state_st;
  PMD5_CTX = ^MD5_CTX;

  //int MD5_Init(MD5_CTX *c);
  //c:是MD5的context
  //返回值:1成功0失败
  function MD5_Init(c: PMD5_CTX): Integer; cdecl; external LIBEAY32;
  //int MD5_Update(MD5_CTX *c, const void *data, size_t len);
  //循环调用加入不同数据计算MD5数值
  //c:是MD5的context
  //data:数据
  //len:长度
  //返回值:1成功0失败
  function MD5_Update(c: PMD5_CTX): Integer; cdecl; external LIBEAY32;
  //int MD5_Final(unsigned char *md, MD5_CTX *c);
  function MD5_Final(md: PByte; c: PMD5_CTX): Integer; cdecl; external LIBEAY32;

  //unsigned char *MD5(const unsigned char *d, size_t n, unsigned char *md);
  //MD5_Init,MD5_Update, MD5_Final 计算的组合函数用户可以直接调用此函数计算出MD5数值
  //d:数据
  //n:长度
  //md:MD5数值
  //返回值:MD5数值保存地址
  function MD5(const d: PByte; n: size_t; md: array of Byte): PByte; cdecl; external LIBEAY32;

  //void MD5_Transform(MD5_CTX *c, const unsigned char *b);
  //计算MD5时的中间函数，用户不需要使用此函数
  //procedure MD5_Transform(c: PMD5_CTX; const b: PByte); cdecl; external LIBEAY32;
  
implementation

end.
