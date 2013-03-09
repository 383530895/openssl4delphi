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
  //c:��MD5��context
  //����ֵ:1�ɹ�0ʧ��
  function MD5_Init(c: PMD5_CTX): Integer; cdecl; external LIBEAY32;
  //int MD5_Update(MD5_CTX *c, const void *data, size_t len);
  //ѭ�����ü��벻ͬ���ݼ���MD5��ֵ
  //c:��MD5��context
  //data:����
  //len:����
  //����ֵ:1�ɹ�0ʧ��
  function MD5_Update(c: PMD5_CTX): Integer; cdecl; external LIBEAY32;
  //int MD5_Final(unsigned char *md, MD5_CTX *c);
  function MD5_Final(md: PByte; c: PMD5_CTX): Integer; cdecl; external LIBEAY32;

  //unsigned char *MD5(const unsigned char *d, size_t n, unsigned char *md);
  //MD5_Init,MD5_Update, MD5_Final �������Ϻ����û�����ֱ�ӵ��ô˺��������MD5��ֵ
  //d:����
  //n:����
  //md:MD5��ֵ
  //����ֵ:MD5��ֵ�����ַ
  function MD5(const d: PByte; n: size_t; md: array of Byte): PByte; cdecl; external LIBEAY32;

  //void MD5_Transform(MD5_CTX *c, const unsigned char *b);
  //����MD5ʱ���м亯�����û�����Ҫʹ�ô˺���
  //procedure MD5_Transform(c: PMD5_CTX; const b: PByte); cdecl; external LIBEAY32;
  
implementation

end.
