program CyrusBarber;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uLogin in 'uLogin.pas' {FrmLogin},
  uCadastroUsuario in 'uCadastroUsuario.pas' {FrmCadastroUsuario},
  DataModulo.Global in 'DataModule\DataModulo.Global.pas' {DM: TDataModule},
  fRecomendados in 'Frame\fRecomendados.pas' {FrameRecomendados: TFrame},
  fStatusAgendado in 'Frame\fStatusAgendado.pas' {FrameStatusAgendado: TFrame},
  Funcoes in 'Function\Funcoes.pas',
  VariaveisGlobais in 'Unit\VariaveisGlobais.pas',
  fServicos in 'Frame\fServicos.pas' {FrameServico: TFrame},
  fCalendarioDay in 'Frame\fCalendarioDay.pas' {FrameCalendarioDay: TFrame},
  uAgendamento in 'uAgendamento.pas' {FrmAgendamento},
  uPerfilLoja in 'uPerfilLoja.pas' {FrmPerfilLoja},
  fEquipe in 'Frame\fEquipe.pas' {FrameEquipe: TFrame},
  fAvaliacao in 'Frame\fAvaliacao.pas' {FrameAvaliacao: TFrame},
  fLojaProxima in 'Frame\fLojaProxima.pas' {FrameLojaProxima: TFrame},
  fHorario in 'Frame\fHorario.pas' {FrameHorario: TFrame},
  fProfissional in 'Frame\fProfissional.pas' {FrameProfissional: TFrame},
  uFormat in 'Unit\uFormat.pas',
  uLoading in 'Unit\uLoading.pas',
  fMensagem in 'Unit\fMensagem.pas' {FrameMensagem: TFrame},
  uApagarEssaUnit in 'uApagarEssaUnit.pas' {Form1},
  uCheckout in 'uCheckout.pas' {FrmCheckout},
  fDetalhesAgendamento in 'Frame\fDetalhesAgendamento.pas' {FrameDetalhesAgendamento: TFrame};

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
