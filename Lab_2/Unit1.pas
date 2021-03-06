unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Variants, System.Classes,
  System.Generics.Collections, ExtCtrls, StdCtrls,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ControllersUnit, PhisicsControllerUnit,
    CodeSiteLogging;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure Label1Enter (Sender:TObject);
  private
    list:TList<string>;
    Buttons:TList<TButton>;
    /// <link>aggregation</link>
    Controller1: Controllers;
    procedure destroyButtons;
    procedure createPanels(list:TList<String>);
  public
    procedure onClick1(Sender:TObject);
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.destroyButtons;
{var
  s:string; }
begin
 { for s in list do
  begin
    with Buttons.Last do
    begin
      Parent:=nil;
      Destroy;
    end;
  end; }
end;

procedure TForm1.createPanels(list: TList<String>);
var
  i:integer;
  s:string;
begin
  i:=0;
  Buttons:=TList<TButton>.Create;
  self.list:=TList<string>.Create;
  self.list:=list;
  for s in list do
  begin
    Buttons.Add(TButton.Create(self));
    with Buttons.Last do
    begin
      Parent:=self;
      Top:=i*41;
      Caption:=s;
      Width:=300;
      OnClick:=OnClick1;
    end;
    i:=i+1;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  list:TList<string>;
begin
  Controller1:=PhisicsController.Create;
  list:=TList<string>.Create;
  list:=Controller1.getMenu;
  createPanels(list);
end;

procedure TForm1.Label1Enter(Sender: TObject);
begin
  self.Caption:='1111111';
end;

procedure TForm1.onClick1(Sender: TObject);
var
  quest:TList<string>;
  answer:TList<string>;
  correct:TDictionary<integer,integer>;
begin
  Controller1.setTest((Sender as TButton).Caption);
  destroyButtons;
  quest:=TList<string>.Create;
  answer:=TList<string>.Create;
  correct:=TDictionary<integer,integer>.Create;
  quest:=Controller1.getQuest;
  answer:=Controller1.getAnswer;
  correct:=Controller1.getCorrect;
end;

end.
