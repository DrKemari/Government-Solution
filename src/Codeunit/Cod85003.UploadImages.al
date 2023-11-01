#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 85003 "Upload Images"
{

    trigger OnRun()
    begin
    end;

    var
        CustRec: Record Customer;
        fileName: Text[250];
        inStreamObject: InStream;
        importFile: File;
        "count": Integer;
        mediasetId: Guid;
        TName: Text;
        ImageLogs: Record "Images Logs";
        LineNo: Integer;


    procedure FNUploadImages(IDNumber: Code[100])
    begin
        ImageLogs.Reset;
        if ImageLogs.FindLast then
          LineNo:=ImageLogs."Line No"+1;
        CustRec.Reset;
        CustRec.SetRange("ID. No.",IDNumber);
        if CustRec.FindSet then begin
        
        TName:='\\192.168.0.95\kasnebtest\Student Processing Header\'+ IDNumber+'\'+ IDNumber+'.jpg';
        fileName :=TName;
        
        // if CustRec.Image.Hasvalue=false then begin
        // if FILE.Exists(fileName) then begin
        //  // MESSAGE('Hie %1',fileName);
        // importFile.Open(fileName);
        // importFile.CreateInstream(inStreamObject);
        // CustRec.Image.ImportStream(inStreamObject, 'student Profile photo ' + Format(CustRec."No."));
        // CustRec.Modify;
        // importFile.Close;
        
        ImageLogs.Init;
        ImageLogs."Line No":=LineNo;
        ImageLogs."Customer No":=CustRec."No.";
        ImageLogs."ID Number":=CustRec."ID. No.";
        ImageLogs."Picture Description":=CustRec."ID. No."+'.jpg';
        ImageLogs.Insert;
        end;
        end;
        /*
        fileName := 'C:\images\1000-v2.jpg';
        importFile.OPEN(fileName);
        importFile.CREATEINSTREAM(inStreamObject);
        CustRec.Picture.IMPORTSTREAM(inStreamObject, 'Demo image for item ' + FORMAT(CustRec."No."));
        CustRec.MODIFY;
        importFile.CLOSE;
        */
        //count := (CustRec.Image.ha);
        //mediasetId := CustRec.Image.MEDIAID;
        //MESSAGE(Text000,CustRec."No.",count,mediasetId);
      //  
     //   end;

   // end;
}

