object MainForm: TMainForm
  Left = 749
  Top = 484
  Caption = 'Timer'
  ClientHeight = 125
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object btnStart: TButton
    Left = 220
    Top = 25
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = btnStartClick
  end
  object btnStop: TButton
    Left = 220
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = btnStopClick
  end
  object pnlTimer: TPanel
    Left = 25
    Top = 25
    Width = 175
    Height = 75
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 2
    object udwHours: TUpDown
      Left = 38
      Top = 25
      Width = 16
      Height = 21
      Associate = edtHours
      TabOrder = 0
    end
    object edtMinutes: TEdit
      Left = 67
      Top = 25
      Width = 25
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      Text = '0'
      OnChange = edtMinutesSecondsChange
    end
    object edtSeconds: TEdit
      Left = 120
      Top = 25
      Width = 25
      Height = 21
      NumbersOnly = True
      TabOrder = 2
      Text = '0'
      OnChange = edtMinutesSecondsChange
    end
    object edtHours: TEdit
      Left = 13
      Top = 25
      Width = 25
      Height = 21
      NumbersOnly = True
      TabOrder = 3
      Text = '0'
    end
    object udwMinutes: TUpDown
      Left = 92
      Top = 25
      Width = 16
      Height = 21
      Associate = edtMinutes
      TabOrder = 4
    end
    object udwSeconds: TUpDown
      Left = 145
      Top = 25
      Width = 16
      Height = 21
      Associate = edtSeconds
      TabOrder = 5
    end
  end
  object TimerClock: TTimer
    Enabled = False
    OnTimer = TimerClockTimer
    Left = 288
    Top = 96
  end
end
