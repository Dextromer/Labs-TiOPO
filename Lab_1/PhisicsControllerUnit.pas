unit PhisicsControllerUnit;

interface

uses ControllersUnit, System.Generics.Collections;

type
  PhisicsController = class(TInterfacedObject, Controllers)
  public
    function getMenu:TList<string>;

  end;

implementation

function PhisicsController.getMenu:TList<string>;
begin
  result:=TList<string>.create;
  result.Add('Test');
  result.Add('10');
  result.Add('T10');
  result.Add('Test');
end;

end.
