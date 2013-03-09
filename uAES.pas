{/* crypto/aes/aes.h -*- mode:C; c-file-style: "eay" -*- */
/* ====================================================================
 * Copyright (c) 1998-2002 The OpenSSL Project.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer. 
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. All advertising materials mentioning features or use of this
 *    software must display the following acknowledgment:
 *    "This product includes software developed by the OpenSSL Project
 *    for use in the OpenSSL Toolkit. (http://www.openssl.org/)"
 *
 * 4. The names "OpenSSL Toolkit" and "OpenSSL Project" must not be used to
 *    endorse or promote products derived from this software without
 *    prior written permission. For written permission, please contact
 *    openssl-core@openssl.org.
 *
 * 5. Products derived from this software may not be called "OpenSSL"
 *    nor may "OpenSSL" appear in their names without prior written
 *    permission of the OpenSSL Project.
 *
 * 6. Redistributions of any form whatsoever must retain the following
 *    acknowledgment:
 *    "This product includes software developed by the OpenSSL Project
 *    for use in the OpenSSL Toolkit (http://www.openssl.org/)"
 *
 * THIS SOFTWARE IS PROVIDED BY THE OpenSSL PROJECT ``AS IS'' AND ANY
 * EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE OpenSSL PROJECT OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 * ====================================================================
 *
 */ }
unit uAES;

interface

uses
  Windows, Classes, uOpenSSLConst;

const
//  AES_ENCRYPT = 1;
//  AES_DECRYPT = 0;

///* Because array size can't be a const in C, the following two are macros.
//   Both sizes are in bytes. */
  AES_MAXNR = 14;
  AES_BLOCK_SIZE = 16;

type
  aes_key_st = record
    rd_key: array[0..4 *(AES_MAXNR + 1) - 1] of Cardinal;
    rounds: Integer;
  end;
  AES_KEY = aes_key_st;
  PAES_KEY = ^AES_KEY;

  //  int AES_set_encrypt_key(const unsigned char *userKey, const int bits,
  //	AES_KEY *key);
  function AES_set_encrypt_key(const userKey: PByte; const bits: Integer; key: PAES_KEY): Integer; cdecl; external LIBEAY32;
  //  int AES_set_decrypt_key(const unsigned char *userKey, const int bits,
  //	AES_KEY *key);
  function AES_set_decrypt_key(const userKey: PByte; const bits: Integer; key: PAES_KEY): Integer; cdecl; external LIBEAY32;

  //void AES_encrypt(const unsigned char *in, unsigned char *out,
  //	const AES_KEY *key);
  procedure AES_encrypt(const _in: PByte; _out: array of Byte; const key: PAES_KEY); cdecl; external LIBEAY32;
  //void AES_decrypt(const unsigned char *in, unsigned char *out,
  //	const AES_KEY *key);
  procedure AES_decrypt(const _in: PByte; _out: array of Byte; const key: PAES_KEY); cdecl; external LIBEAY32;

implementation

end.
