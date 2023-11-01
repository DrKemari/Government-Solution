#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85378 "Student Exam Result"
{
    PageType = List;
    SourceTable = "Examination Results";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                }
                field("Part"; Rec.Part)
                {
                    ApplicationArea = Basic;
                }
                field(Section; Rec.Section)
                {
                    ApplicationArea = Basic;
                }
                field(Paper; Rec.Paper)
                {
                    ApplicationArea = Basic;
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = Basic;
                    Caption = 'Year';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                }
                field("Section Grade"; Rec."Section Grade")
                {
                    ApplicationArea = Basic;
                }
                field("Section Description"; Rec."Section Description")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Sitting ID"; Rec."Examination Sitting ID")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Center"; Rec."Examination Center")
                {
                    ApplicationArea = Basic;
                }
                field(Mark; Rec.Mark)
                {
                    ApplicationArea = Basic;
                }
                field(Passed; Rec.Passed)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        //DeleteAllow:=TRUE;
        //UserSetup.RESET;
        //IF UserSetup.GET(USERID) THEN BEGIN
          //IF UserSetup."Examination Results Admin"=TRUE THEN BEGIN
           // DeleteAllow:=TRUE;
          //END;
          //END; i
    end;

    var
        DeleteAllow: Boolean;
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

