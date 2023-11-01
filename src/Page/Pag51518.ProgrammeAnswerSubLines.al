#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51518 "Programme Answer Sub-Lines"
{
    Caption = 'Programme Answer Sub-Lines';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Audit Response Sub-Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Question Description"; Rec."Question Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Response Code"; Rec."Response Code")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if Rec."Response Code" <> '' then
                          begin
                            SubResponsetxt:= Rec."Response Code";
                            Rec."Response Description".CreateOutstream(MemoWriter);
                          MemoWriter.Write(SubResponsetxt);
                          end
                    end;
                }
                field("Response Description";SubResponsetxt)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Clear(Rec."Response Description");
                        if SubResponsetxt <> '' then begin
                            Rec."Response Description".CreateOutstream(MemoWriter);
                          MemoWriter.Write(SubResponsetxt);
                        end
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Response Description");
        if not Rec."Response Description".Hasvalue then
          SubResponsetxt:= ''
        else begin
            Rec."Response Description".CreateInstream(MemoReader);
          MemoReader.Read(SubResponsetxt,MaxStrLen(SubResponsetxt));
        end;
    end;

    var
        SubResponsetxt: Text;
        InStr: InStream;
        OutStr: OutStream;
        MemoReader: InStream;
        MemoWriter: OutStream;
}

#pragma implicitwith restore

