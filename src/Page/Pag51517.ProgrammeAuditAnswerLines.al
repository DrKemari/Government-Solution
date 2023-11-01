#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51517 "Programme Audit Answer Lines"
{
    Caption = 'Programme Audit Answer Lines';
    CardPageID = "Programme Answer Sub-Lines";
    PageType = ListPart;
    SourceTable = "Audit Response Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Section Description"; Rec."Section Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
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
                            Responsetxt:= Rec."Response Code";
                            Rec."Response Description".CreateOutstream(MemoWriter);
                          MemoWriter.Write(Responsetxt);
                          end
                    end;
                }
                field("Response Description";Responsetxt)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Clear(Rec."Response Description");
                        if Responsetxt <> '' then begin
                            Rec."Response Description".CreateOutstream(MemoWriter);
                          MemoWriter.Write(Responsetxt);
                        end
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Sub-Questions")
            {
                ApplicationArea = Basic;
                RunObject = Page "Programme Answer Sub-Lines";
                // RunPageLink = "Audit Requisition No."=field("Audit Requisition No."),
                //               "Question ID"=field("Question ID");
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Response Description");
        if not Rec."Response Description".Hasvalue then
          Responsetxt:= ''
        else begin
            Rec."Response Description".CreateInstream(MemoReader);
          MemoReader.Read(Responsetxt,MaxStrLen(Responsetxt));
        end;
    end;

    var
        Responsetxt: Text;
        InStr: InStream;
        OutStr: OutStream;
        MemoReader: InStream;
        MemoWriter: OutStream;
}

#pragma implicitwith restore

