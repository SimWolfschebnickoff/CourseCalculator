unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckGroup1: TCheckGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;
  Rdegree, cathetA, cathetB, hypotenuse, consumption, fuel, Adegree, Bdegree, RAdegree, RBdegree: Real;
  Counter: Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);     // Обратный курс
begin
     Rdegree:=StrToFloat(Edit1.Text);
     if Rdegree < 180 then
     begin
          Rdegree:=360-(180-Rdegree);
     end
     else
     begin
          Rdegree:=Rdegree-180;
     end;
     Edit2.Text:=FloatToStr(Rdegree);
     Edit2.Text:=FloatToStr(RoundTo(StrToFloat(Edit2.Text),-1));
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
     if CheckBox1.Checked then
     begin
          Counter:=Counter+1;
     end
     else
     begin
          Counter:=Counter-1;
     end;
     Button1.Click;
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin
     if CheckBox2.Checked then
     begin
          Counter:=Counter+2;
     end
     else
     begin
          Counter:=Counter-2;
     end;
     Button1.Click;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     Counter:=0;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
     cathetA:=StrToFloat(LabeledEdit1.Text);
     cathetB:=StrToFloat(LabeledEdit2.Text);
     hypotenuse:=sqrt((cathetA*cathetA)+(cathetB*cathetB));   // Гипотенуза по известным катетам (путь)
     consumption:=StrToFloat(LabeledEdit4.Text);
     fuel:=consumption*hypotenuse*2;
     Adegree:=(180/pi)*(ArcTan(cathetA/cathetB));                 // Радианы в градусы (курс)
     Adegree:=90-Adegree;
     // Курс бета (не угол)
     Bdegree:=180-90-Adegree+180;
     // Чекбокс
     if CheckBox1.Checked then
     begin
         Adegree:=360-180-Adegree; // Отражение курса по вертикали
         Bdegree:=360-Bdegree+180;
     end;
     if CheckBox2.Checked then
     begin
         Adegree:=360-Adegree;   // Отражение курса по горизонтали
         Bdegree:=360-Bdegree;
     end;
     // Обратный курс
     if Adegree < 180 then
     begin
          RAdegree:=360-(180-Adegree);
     end
     else
     begin
          RAdegree:=Adegree-180;
     end;
     if Bdegree < 180 then
     begin
          RBdegree:=360-(180-Bdegree);
     end
     else
         begin
         RBdegree:=Bdegree-180;
     end;
     // Переворот картинки
     case Counter of
          0:      begin
                       Image1.Visible:=true;
                       Image2.Visible:=false;
                       Image3.Visible:=false;
                       Image4.Visible:=false;
                  end;
          1:      begin
                       Image1.Visible:=false;
                       Image2.Visible:=true;
                       Image3.Visible:=false;
                       Image4.Visible:=false;
                  end;
          2:      begin
                       Image1.Visible:=false;
                       Image2.Visible:=false;
                       Image3.Visible:=true;
                       Image4.Visible:=false;
                  end;
          3:      begin
                       Image1.Visible:=false;
                       Image2.Visible:=false;
                       Image3.Visible:=false;
                       Image4.Visible:=true;
                  end;
     end;
     // Вывод данных
     LabeledEdit3.Text:=FloatToStr(hypotenuse);
     LabeledEdit3.Text:=FloatToStr(RoundTo(StrToFloat(LabeledEdit3.Text),-1));  // Округление при выводе
     LabeledEdit5.Text:=FloatToStr(fuel);
     LabeledEdit5.Text:=FloatToStr(RoundTo(StrToFloat(LabeledEdit5.Text),-1));
     LabeledEdit6.Text:=FloatToStr(Adegree);
     LabeledEdit6.Text:=FloatToStr(RoundTo(StrToFloat(LabeledEdit6.Text),-1));
     LabeledEdit7.Text:=FloatToStr(Bdegree);
     LabeledEdit7.Text:=FloatToStr(RoundTo(StrToFloat(LabeledEdit7.Text),-1));
     LabeledEdit8.Text:=FloatToStr(RAdegree);
     LabeledEdit8.Text:=FloatToStr(RoundTo(StrToFloat(LabeledEdit8.Text),-1));
     LabeledEdit9.Text:=FloatToStr(RBdegree);
     LabeledEdit9.Text:=FloatToStr(RoundTo(StrToFloat(LabeledEdit9.Text),-1));
end;

end.

