unit VariaveisGlobais;

interface

uses
   System.UITypes, FireDAC.Comp.Client, FMX.Controls;

const
  Base_URL     = 'http://192.168.0.129:3002';
  ImageLogoURL = 'http://192.168.0.129:8080/Assets/Images/Logo/';
  ImageBackgroundURL = 'http://192.168.0.129:8080/Assets/Images/background/';
var
  //******* Variaveis usada durante o programa.. *******
  CodigoLojaSelecionada  : Integer = 0;
  CodigoUsuarioConectado : Integer = 0;
  NomeUsuarioConectado   : String  = '';
  UsuarioConectado       : Boolean = False;
  KeyBoardEstaVisivel    : Boolean = False;
  xStyleBook             : TStyleBook;

  //******* TIPO MENSAGEM *******
  xMsgTipoSUCESSO    :  String = 'SUCESSO';
  xMsgTipoCONFIRMAÇÃO:  String = 'CONFIRMAÇÃO';
  xMsgTipoINFORMATIVA:  String = 'INFORMATIVA';
  xMsgTipoERRO       :  String = 'ERRO';
  xMsgTipoNOME       :  String = 'NOME';

  //******* CORES DA JANELA *******
  xCorRED   : TAlphaColor = $FFDB5050;
  xCorBLUE  : TAlphaColor = $FF5072DB;
  xCorGREEN : TAlphaColor = $FF5EDB50;

  //******* MODO DARK / LIGHT *******
  UsingModeDARK: Boolean = true;
  // dark
  FundoDARK: TAlphaColor = $FF343434;
  FundoTransDARK: TAlphaColor = $FF434343;
  TextoDARK: TAlphaColor = TAlphaColors.Lightgray;

  // light
  FundoLIGHT: TAlphaColor = $FFFFFFFF;
  FundoTransLIGHT: TAlphaColor = $FFE6E6E6;
  TextoLIGHT: TAlphaColor = $FF545454;


implementation
end.
