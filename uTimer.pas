unit uTimer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TMainForm = class(TForm)
      btnStart: TButton;
      btnStop: TButton;
      udwHours: TUpDown;
      pnlTimer: TPanel;
      edtMinutes: TEdit;
      edtSeconds: TEdit;
      edtHours: TEdit;
      udwMinutes: TUpDown;
      udwSeconds: TUpDown;
      TimerClock: TTimer;
      procedure edtMinutesSecondsChange(Sender: TObject);
      procedure btnStartClick(Sender: TObject);
      procedure TimerClockTimer(Sender: TObject);
      procedure btnStopClick(Sender: TObject);
    private
      { Private declarations }
    public
      procedure ResetTimer();
  end;


  HMSArray = Array[0..2] of Integer;


  TimerExtencion = class
    private
      hours: Integer;
      minutes: Integer;
      seconds: Integer;
    public
      Constructor Create(hours: Integer; minutes: Integer; seconds: Integer);
      procedure PassSecond();
      function GetRemainingTime(): HMSArray;
  end;


procedure StopTimer();

var
  MainForm: TMainForm;
  Timer: TimerExtencion;

implementation

{$R *.dfm}

constructor TimerExtencion.Create(hours: Integer; minutes: Integer; seconds: Integer);
begin
  if (hours < 0) or (minutes < 0) or (minutes > 59) or (seconds < 0) or (seconds > 59) then
    Exit;

  self.hours := hours;
  self.minutes := minutes;
  self.seconds := seconds;
end;

procedure TimerExtencion.PassSecond();
begin
  if seconds = 0 then
  begin
    if minutes = 0 then
    begin
      if hours = 0 then
      begin
        StopTimer();
        Exit;
      end
      else
      begin
        seconds := 59;
        minutes := 59;
        hours := hours - 1;
      end;
    end
    else
    begin
      seconds := 59;
      minutes := minutes - 1;
    end;
  end
  else
    seconds := seconds - 1;
end;

function TimerExtencion.GetRemainingTime(): HMSArray;
begin
  result[0] := hours;
  result[1] := minutes;
  result[2] := seconds;
end;


procedure TMainForm.btnStartClick(Sender: TObject);
var
  hours, minutes, seconds: Word;
begin
  edtHours.Enabled := False;
  udwHours.Enabled := False;
  edtMinutes.Enabled := False;
  udwMinutes.Enabled := False;
  edtSeconds.Enabled := False;
  udwSeconds.Enabled := False;

  hours := StrToInt(edtHours.Text);
  minutes := StrToInt(edtMinutes.Text);
  seconds := StrToInt(edtSeconds.Text);

  Timer := TimerExtencion.Create(hours, minutes, seconds);
  TimerClock.Enabled := True;
end;

procedure TMainForm.edtMinutesSecondsChange(Sender: TObject);
var
  edit: TEdit;
begin
  edit := Sender as TEdit;

  if edit.Text = '' then
    Exit;

  if StrToInt(edit.Text) > 59 then
  begin
    edit.Text := IntToStr(0);
  end
  else if StrToInt(edit.Text) < 0 then
  begin
    edit.Text := IntToStr(59);
  end;
end;

procedure TMainForm.TimerClockTimer(Sender: TObject);
var
  HMS: HMSArray;
begin
  Timer.PassSecond();
  HMS := Timer.GetRemainingTime();

  edtHours.Text := IntToStr(HMS[0]);
  edtMinutes.Text := IntToStr(HMS[1]);
  edtSeconds.Text := IntToStr(HMS[2]);
end;

procedure TMainForm.btnStopClick(Sender: TObject);
begin
  StopTimer();
end;


procedure StopTimer();
begin
  MainForm.ResetTimer();

  MessageBox(0, 'Time is up.', 'Timer notification', mb_IconExclamation);
end;

procedure TMainForm.ResetTimer();
begin
  TimerClock.Enabled := False;

  edtHours.Text := IntToStr(0);
  edtMinutes.Text := IntToStr(0);
  edtSeconds.Text := IntToStr(0);

  edtHours.Enabled := True;
  udwHours.Enabled := True;
  edtMinutes.Enabled := True;
  udwMinutes.Enabled := True;
  edtSeconds.Enabled := True;
  udwSeconds.Enabled := True;
end;

end.
