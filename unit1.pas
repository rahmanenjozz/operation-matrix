unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Variants, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Grids;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupMatA: TGroupBox;
    GroupMatB: TGroupBox;
    GroupHasMat: TGroupBox;
    GroupOpMat: TGroupBox;
    LBarisA: TLabel;
    LKolomA: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Judul: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButton4Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.Edit1Change(Sender: TObject);

begin
  stringgrid1.RowCount := strtoint (Edit1.Text);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  RadioButton1.checked := false;
  RadioButton2.checked := false;
  RadioButton3.checked := false;
  RadioButton4.checked := false;
  Edit1.Text := '0';
  Edit2.Text := '0';
  Edit3.Text := '0';
  Edit4.Text := '0';
  stringgrid3.RowCount := StrToInt('0');
  stringgrid3.colCount := StrToInt('0');
end;

procedure TForm1.Edit2Change(Sender: TObject);

begin
  stringgrid1.ColCount := strtoint (Edit2.Text);
end;

procedure TForm1.Edit3Change(Sender: TObject);

begin
  stringgrid2.RowCount := strtoint (edit3.Text);
end;

procedure TForm1.Edit4Change(Sender: TObject);

begin
  stringgrid2.colCount := strtoint (edit4.Text);
end;

procedure TForm1.Button1Click(Sender: TObject);

var
  c,i,j,k,m,n,o,p : integer;

begin
  n := strtoint (Edit1.Text);
  m := strtoint (Edit2.Text);
  o := strtoint (edit3.Text);
  p := strtoint (edit4.Text);
  stringgrid1.RowCount := n;
  stringgrid1.colCount := m;
  stringgrid2.RowCount := o;
  stringgrid2.colCount := p;

  if RadioButton1.checked then
  begin
    if (n = o) and (m = p) then
    begin
      stringgrid3.RowCount:= n;
      stringgrid3.colCount:= m;
      for i:=0 to n-1 do
      begin
           for j:=0 to m-1 do
           begin
                c:= 0;
                c:= c + strtoint (stringgrid1.Cells[j,i]) + strtoint (stringgrid2.Cells[j,i]);
                stringgrid3.Cells[j,i]:= inttostr (c);
           end;
      end;
    end
    else
      MessageDlg('Ordo Matriks A dan Ordo Matriks B Harus Sama !!',mtInformation,[mbok],0);
  end;

  if RadioButton2.checked then
  begin
    if (n = o) and (m = p) then
    begin
      stringgrid3.RowCount:= n;
      stringgrid3.colCount:= m;
      for i:=0 to n-1 do
      begin
           for j:=0 to m-1 do
           begin
                c:= 0;
                c:= c + strtoint (stringgrid1.Cells[j,i]) - strtoint (stringgrid2.Cells[j,i]);
                stringgrid3.Cells[j,i]:= inttostr (c);
           end;
      end;
    end
    else
      MessageDlg('Ordo Matriks A dan Ordo Matriks B Harus Sama !!',mtInformation,[mbok],0);
  end;

  if RadioButton3.checked then
  begin
    if m = o then
    begin
      k := m;
      stringgrid3.RowCount:= stringgrid1.RowCount;
      stringgrid3.colCount:= stringgrid2.colCount;
      for i:= 0 to n-1 do
      for j := 0 to p-1 do
      begin
           c:= 0;
           for k := 0 to m-1 do
           c:= c + strtoint (stringgrid1.Cells[k,i]) * strtoint (stringgrid2.Cells[j,k]);
           stringgrid3.Cells[j,i]:= inttostr (c);
      end;
    end
    else
       MessageDlg('Kolom Matrix A dan baris Matrix B harus sama !!',mtInformation,[mbok],0);
  end;

  if RadioButton4.checked then
  begin
    stringGrid3.RowCount := m;
    stringGrid3.ColCount := n;
    for i := 0 to m-1 do
    begin
         for j:= 0 to n-1 do
         StringGrid3.Cells[j,i] := StringGrid1.Cells[i,j];
    end;
  end;

  if (RadioButton1.checked = false) and (RadioButton2.checked = false) and (RadioButton3.checked = false) and (RadioButton4.checked = false) then
  begin
    MessageDlg('Pilih Operasi Matriks!!',mtInformation,[mbok],0);
  end;

end;

procedure TForm1.RadioButton4Change(Sender: TObject);
begin
  if RadioButton4.Checked then
  begin
     GroupMatB.Enabled:= false;
  end
  else
     GroupMatB.Enabled:= true;
end;

end.

