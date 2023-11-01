#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85311 "Stakeholders Comments"
{
    PageType = ListPart;
    SourceTable = "Review Stakeholder Comment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = Basic;
                }
                field("Stakeholder Type"; Rec."Stakeholder Type")
                {
                    ApplicationArea = Basic;
                }
                field("Stakeholder Name"; Rec."Stakeholder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Expected Content";ExpectedContenttxt)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;

                    trigger OnValidate()
                    begin
                        Clear(Rec."Expected Content");
                        if ExpectedContenttxt <> '' then begin
                            Rec."Expected Content".CreateOutstream(MemoWriter);
                          MemoWriter.Write(ExpectedContenttxt);
                        end;
                    end;
                }
                field("Rules and Regulations";RulesAndRegulationtxt)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;

                    trigger OnValidate()
                    begin
                        Clear(Rec."Rules and Regulation");
                        if RulesAndRegulationtxt <> '' then begin
                            Rec."Rules and Regulation".CreateOutstream(MemoWriter);
                          MemoWriter.Write(RulesAndRegulationtxt);
                        end;
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
        Rec.CalcFields("Expected Content");
        Rec.CalcFields("Rules and Regulation");
        if not Rec."Expected Content".Hasvalue then
          ExpectedContenttxt := ''
        else begin
            Rec."Expected Content".CreateInstream(MemoReader);
          MemoReader.Read(ExpectedContenttxt,MaxStrLen(ExpectedContenttxt));
        end;

        if not Rec."Rules and Regulation".Hasvalue then
          RulesAndRegulationtxt := ''
        else begin
            Rec."Rules and Regulation".CreateInstream(MemoReader);
          MemoReader.Read(RulesAndRegulationtxt,MaxStrLen(RulesAndRegulationtxt));
        end;
    end;

    var
        RulesAndRegulationtxt: Text;
        ExpectedContenttxt: Text;
        InStr: InStream;
        OutStr: OutStream;
        MemoReader: InStream;
        MemoWriter: OutStream;
}

#pragma implicitwith restore

